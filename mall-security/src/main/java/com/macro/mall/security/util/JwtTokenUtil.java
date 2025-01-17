package com.macro.mall.security.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.macro.mall.common.api.RedisTable;
import com.macro.mall.common.service.TTCRedisService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JwtToken生成的工具类
 * JWT token的格式：header.payload.signature
 * header的格式（算法、token的类型）：
 * {"alg": "HS512","typ": "JWT"}
 * payload的格式（用户名、创建时间、生成时间）：
 * {"sub":"wang","created":1489079981393,"exp":1489684781}
 * signature的生成算法：
 * HMACSHA512(base64UrlEncode(header) + "." +base64UrlEncode(payload),secret)
 * Created by macro on 2018/4/26.
 */
@Slf4j
public class JwtTokenUtil {
    private static final String CLAIM_KEY_USERNAME = "sub";
    private static final String CLAIM_KEY_CREATED = "created";
    @Value("${jwt.secret}")
    private String secret;
    @Value("${jwt.expiration}")
    private Long expiration;
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Autowired
    private TTCRedisService ttcRedisService;

    /**
     * 根据负责生成JWT的token
     */
    private String generateToken(Map<String, Object> claims) {
        String username = (String) claims.get(CLAIM_KEY_USERNAME);

        //1.生成token
        String token = Jwts.builder()
                .setClaims(claims)
                .setExpiration(generateExpirationDate())
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();

        //2.通过username从redis中获取旧的token，然后将旧token的过期时间设置为30s，让该token在30s内仍然有效,以完成最后的请求
        String oldToken = getTokenByUsername(username);
        if (!StringUtils.isEmpty(oldToken)) {
            ttcRedisService.expire(RedisTable.UmsAdminToken, oldToken, 30);
        }


        //3.token缓存到redis中，过期时间比实际多100ms
        ttcRedisService.set(RedisTable.UmsAdminToken, token, 1, expiration + 1);
        ttcRedisService.set(RedisTable.UmsAdminUserToken, username, token, expiration + 1);


        return token;
    }

    /**
     * 从token中获取JWT中的负载
     */
    private Claims getClaimsFromToken(String token) {
        Claims claims = null;
        try {
            claims = Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            log.info("JWT格式验证失败:{}", token);
        }
        return claims;
    }

    /**
     * 生成token的过期时间
     */
    private Date generateExpirationDate() {
        return new Date(System.currentTimeMillis() + expiration * 1000);
    }

    /**
     * 从token中获取登录用户名
     */
    public String getUserNameFromToken(String token) {
        String username;
        try {
            Claims claims = getClaimsFromToken(token);
            username = claims.getSubject();
        } catch (Exception e) {
            username = null;
        }
        return username;
    }

    /**
     * 验证token是否还有效
     * 注：直接改成了在redis中判断是否存在token，不存在则直接无效，存在则当作是未过期，不另外判断expired
     *
     * @param token       客户端传入的token
     * @param userDetails 从数据库中查询出来的用户信息
     */
    public boolean validateToken(String token, UserDetails userDetails) {
        if (!ttcRedisService.hasKey(RedisTable.UmsAdminToken, token)) {
            return false;
        }
        String username = getUserNameFromToken(token);
        return username.equals(userDetails.getUsername());
    }

    /**
     * 判断token是否已经失效
     */
    private boolean isTokenExpired(String token) {
        Date expiredDate = getExpiredDateFromToken(token);
        return expiredDate.before(new Date());
    }

    /**
     * 如果redis中不存在token，则表示过期
     *
     * @param token
     * @return
     */
    private boolean isTokenExpiredV2(String token) {
        return !ttcRedisService.hasKey(RedisTable.UmsAdminToken, token);
    }

    /**
     * 从token中获取过期时间
     */
    private Date getExpiredDateFromToken(String token) {
        Claims claims = getClaimsFromToken(token);
        return claims.getExpiration();
    }

    /**
     * 根据用户信息生成token
     */
    public String generateToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
        claims.put(CLAIM_KEY_USERNAME, userDetails.getUsername());
        claims.put(CLAIM_KEY_CREATED, new Date());
        return generateToken(claims);
    }

    /**
     * 当原来的token没过期时是可以刷新的
     *
     * @param oldToken 带tokenHead的token
     */
    public String refreshHeadToken(String oldToken) {
        if (StrUtil.isEmpty(oldToken)) {
            return null;
        }
        String token = getPureToken(oldToken);
        if (StrUtil.isEmpty(token)) {
            return null;
        }

        //如果token已经过期，不支持刷新
        if (isTokenExpiredV2(token)) {
            return null;
        }

        //token校验不通过
        Claims claims = getClaimsFromToken(token);
        if (claims == null) {
            return null;
        }

        //如果token在30分钟之内刚刷新过，返回原token
        if (tokenRefreshJustBefore(token, 30 * 60)) {
            return token;
        } else {
            //旧token从redis移除
            // ttcRedisService.del(RedisTable.UmsAdminToken, token);
            ttcRedisService.expire(RedisTable.UmsAdminToken, token, 30);
            claims.put(CLAIM_KEY_CREATED, new Date());
            return generateToken(claims);
        }
    }

    /**
     * 从bearertoken中获取后面的token
     *
     * @param bearerToken
     * @return
     */
    public String getPureToken(String bearerToken) {
        String token = bearerToken.substring(tokenHead.length());
        return token;
    }

    /**
     * 判断token在指定时间内是否刚刚刷新过
     *
     * @param token 原token
     * @param time  指定时间（秒）
     */
    private boolean tokenRefreshJustBefore(String token, int time) {
        Claims claims = getClaimsFromToken(token);
        Date created = claims.get(CLAIM_KEY_CREATED, Date.class);
        Date refreshDate = new Date();
        //刷新时间在创建时间的指定时间内
        if (refreshDate.after(created) && refreshDate.before(DateUtil.offsetSecond(created, time))) {
            return true;
        }
        return false;
    }

    private String getTokenByUsername(String username) {
        return (String) ttcRedisService.get(RedisTable.UmsAdminUserToken, username);
    }

    public void destroyToken(String bearerToken) {
        String token = getPureToken(bearerToken);
        ttcRedisService.del(RedisTable.UmsAdminToken, token);
    }

}
