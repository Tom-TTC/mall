package com.macro.mall.dao;

import com.macro.mall.domain.dto.OmsOrderHandleParam;
import com.macro.mall.domain.dto.OmsOrderDetail;
import com.macro.mall.domain.dto.OmsOrderQueryParam;
import com.macro.mall.model.OmsOrder;
import com.macro.mall.model.vo.OrderDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 订单查询自定义Dao
 * Created by macro on 2018/10/12.
 */
@Component
public interface OmsOrderDao {
    /**
     * 条件查询订单
     */
    List<OmsOrder> getList(@Param("queryParam") OmsOrderQueryParam queryParam);

    List<OrderDetail> getOrderList(@Param("queryParam") OmsOrderQueryParam queryParam);

    int countMyOrder(@Param("handleParam") OmsOrderHandleParam handleParam);

    /**
     * 批量发货
     */
    int delivery(@Param("handleParam") OmsOrderHandleParam handleParam);

}
