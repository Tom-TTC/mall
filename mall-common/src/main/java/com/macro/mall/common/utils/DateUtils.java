package com.macro.mall.common.utils;

import org.apache.tomcat.jni.Local;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * Created by ttc on 2022/7/17.
 */
public class DateUtils {

    public static final Logger logger = LoggerFactory.getLogger(DateUtils.class);
    /**
     * 日期格式
     */
    public static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

    private static long startTime = -1;
    private static long endTime = -1;
    private static DateTimeFormatter DEFAULT_TIME_PATTERN = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    /**
     * 序列型日期
     */
    private static DateTimeFormatter SERIAL_TIME_PATTERN = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
    private static DateTimeFormatter ORDINARY_TIME_PATTERN = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    private static String CHINESE_MONTH_AND_DAY_PATTERN = "%d月%d日";

    public static void tick() {
        startTime = System.currentTimeMillis();
    }

    public static void tok(String info) {
        endTime = System.currentTimeMillis();
        float execTime = (float) (endTime - startTime) / 1000;
        logger.info(info + " ============== " + execTime + "s");
    }

    /**
     * 获取当天的开始时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getDayBegin() {
        Date date = new Date();
        return getDayStartTime(date);
    }

    /**
     * 获取当天的结束时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getDayEnd() {
        Date date = new Date();
        return getDayEndTime(date);
    }

    /**
     * 获取昨天的开始时间
     *
     * @return 默认格式 Wed May 31 14:47:18 CST 2017
     */
    public static Date getBeginDayOfYesterday() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayBegin());
        cal.add(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }

    /**
     * 获取昨天的结束时间
     *
     * @return 默认格式 Wed May 31 14:47:18 CST 2017
     */
    public static Date getEndDayOfYesterDay() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayEnd());
        cal.add(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }

    /**
     * 获取明天的开始时间
     *
     * @return 默认格式 Wed May 31 14:47:18 CST 2017
     */
    public static Date getBeginDayOfTomorrow() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayBegin());
        cal.add(Calendar.DAY_OF_MONTH, 1);

        return cal.getTime();
    }

    /**
     * 获取明天的结束时间
     *
     * @return 默认格式 Wed May 31 14:47:18 CST 2017
     */
    public static Date getEndDayOfTomorrow() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayEnd());
        cal.add(Calendar.DAY_OF_MONTH, 1);
        return cal.getTime();
    }

    /**
     * 获取本周的开始时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getBeginDayOfWeek() {
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
        if (dayofweek == 1) {
            dayofweek += 7;
        }
        cal.add(Calendar.DATE, 2 - dayofweek);
        return getDayStartTime(cal.getTime());
    }

    /**
     * 获取本周的结束时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getEndDayOfWeek() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(getBeginDayOfWeek());
        cal.add(Calendar.DAY_OF_WEEK, 6);
        Date weekEndSta = cal.getTime();
        return getDayEndTime(weekEndSta);
    }

    /**
     * 获取本月的开始时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getBeginDayOfMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(getNowYear(), getNowMonth() - 1, 1);
        return getDayStartTime(calendar.getTime());
    }

    /**
     * 获取本月的结束时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getEndDayOfMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(getNowYear(), getNowMonth() - 1, 1);
        int day = calendar.getActualMaximum(5);
        calendar.set(getNowYear(), getNowMonth() - 1, day);
        return getDayEndTime(calendar.getTime());
    }

    /**
     * 获取本年的开始时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getBeginDayOfYear() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, getNowYear());
        // cal.set
        cal.set(Calendar.MONTH, Calendar.JANUARY);
        cal.set(Calendar.DATE, 1);

        return getDayStartTime(cal.getTime());
    }

    /**
     * 获取本年的结束时间
     *
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Date getEndDayOfYear() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, getNowYear());
        cal.set(Calendar.MONTH, Calendar.DECEMBER);
        cal.set(Calendar.DATE, 31);
        return getDayEndTime(cal.getTime());
    }

    /**
     * 获取某个日期的开始时间
     *
     * @param d
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Timestamp getDayStartTime(Date d) {
        TimeZone timeZone = TimeZone.getTimeZone("GMT+8:00");
//        Calendar c = Calendar.getInstance(timeZone);
        Calendar calendar = Calendar.getInstance(timeZone);
        if (null != d) calendar.setTime(d);
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return new Timestamp(calendar.getTimeInMillis());
    }

    /**
     * 获取某个日期的结束时间
     *
     * @param d
     * @return yyyy-MM-dd HH:mm:ss  格式
     */
    public static Timestamp getDayEndTime(Date d) {
        TimeZone timeZone = TimeZone.getTimeZone("GMT+8:00");
        Calendar calendar = Calendar.getInstance(timeZone);
        if (null != d) calendar.setTime(d);
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        return new Timestamp(calendar.getTimeInMillis());
    }

    /**
     * 获取某年某月的第一天
     *
     * @param year
     * @param month
     * @return
     */
    public static Date getStartMonthDate(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);
        return calendar.getTime();
    }

    /**
     * 获取某年某月的最后一天
     *
     * @param year
     * @param month
     * @return
     */
    public static Date getEndMonthDate(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);
        int day = calendar.getActualMaximum(5);
        calendar.set(year, month - 1, day);
        return calendar.getTime();
    }

    /**
     * 获取今年是哪一年
     *
     * @return
     */
    public static Integer getNowYear() {
        Date date = new Date();
        GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
        gc.setTime(date);
        return Integer.valueOf(gc.get(1));
    }

    /**
     * 获取本月是哪一月
     *
     * @return
     */
    public static int getNowMonth() {
        Date date = new Date();
        GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
        gc.setTime(date);
        return gc.get(2) + 1;
    }

    /**
     * 两个日期相减得到的天数
     *
     * @param beginDate
     * @param endDate
     * @return
     */
    public static int getDiffDays(Date beginDate, Date endDate) {

        if (beginDate == null || endDate == null) {
            throw new IllegalArgumentException("getDiffDays param is null!");
        }

        long diff = (endDate.getTime() - beginDate.getTime())
                / (1000 * 60 * 60 * 24);

        int days = new Long(diff).intValue();

        return days;
    }

    public static int getDiffDaysByDay(Date beginDate, Date endDate) {

        if (beginDate == null || endDate == null) {
            throw new IllegalArgumentException("getDiffDays param is null!");
        }
        beginDate = getDayStartTime(beginDate);
        endDate = getDayStartTime(endDate);

        long diff = (endDate.getTime() - beginDate.getTime())
                / (1000 * 60 * 60 * 24);

        int days = new Long(diff).intValue();

        return days;
    }


    /**
     * 两个日期相减得到的毫秒数
     *
     * @param beginDate
     * @param endDate
     * @return
     */
    public static long dateDiff(Date beginDate, Date endDate) {
        long date1ms = beginDate.getTime();
        long date2ms = endDate.getTime();
        return date2ms - date1ms;
    }

    /**
     * 获取两个日期中的最大日期
     *
     * @param beginDate
     * @param endDate
     * @return
     */
    public static Date max(Date beginDate, Date endDate) {
        if (beginDate == null) {
            return endDate;
        }
        if (endDate == null) {
            return beginDate;
        }
        if (beginDate.after(endDate)) {
            return beginDate;
        }
        return endDate;
    }

    /**
     * 获取两个日期中的最小日期
     *
     * @param beginDate
     * @param endDate
     * @return
     */
    public static Date min(Date beginDate, Date endDate) {
        if (beginDate == null) {
            return endDate;
        }
        if (endDate == null) {
            return beginDate;
        }
        if (beginDate.after(endDate)) {
            return endDate;
        }
        return beginDate;
    }

    /**
     * 返回某月该季度的第一个月
     *
     * @param date
     * @return
     */
    public static Date getFirstSeasonDate(Date date) {
        final int[] SEASON = {1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4};
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int sean = SEASON[cal.get(Calendar.MONTH)];
        cal.set(Calendar.MONTH, sean * 3 - 3);
        return cal.getTime();
    }

    /**
     * 返回某个日期下几天的日期
     *
     * @param date
     * @param i
     * @return
     */
    public static Date getNextDay(Date date, int i) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.DATE, cal.get(Calendar.DATE) + i);
        return cal.getTime();
    }

    /**
     * 返回某个日期前几天的日期
     *
     * @param date
     * @param i
     * @return
     */
    public static Date getFrontDay(Date date, int i) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.DATE, cal.get(Calendar.DATE) - i);
        return cal.getTime();
    }

    /**
     * 获取某年某月到某年某月按天的切片日期集合（间隔天数的日期集合）
     *
     * @param beginYear
     * @param beginMonth
     * @param endYear
     * @param endMonth
     * @param k
     * @return
     */
    public static List<List<Date>> getTimeList(int beginYear, int beginMonth, int endYear,
                                               int endMonth, int k) {
        List<List<Date>> list = new ArrayList<List<Date>>();
        if (beginYear == endYear) {
            for (int j = beginMonth; j <= endMonth; j++) {
                list.add(getTimeList(beginYear, j, k));

            }
        } else {
            {
                for (int j = beginMonth; j < 12; j++) {
                    list.add(getTimeList(beginYear, j, k));
                }

                for (int i = beginYear + 1; i < endYear; i++) {
                    for (int j = 0; j < 12; j++) {
                        list.add(getTimeList(i, j, k));
                    }
                }
                for (int j = 0; j <= endMonth; j++) {
                    list.add(getTimeList(endYear, j, k));
                }
            }
        }
        return list;
    }

    /**
     * 获取某年某月按天切片日期集合（某个月间隔多少天的日期集合）
     *
     * @param beginYear
     * @param beginMonth
     * @param k
     * @return
     */
    public static List<Date> getTimeList(int beginYear, int beginMonth, int k) {
        List<Date> list = new ArrayList<Date>();
        Calendar begincal = new GregorianCalendar(beginYear, beginMonth, 1);
        int max = begincal.getActualMaximum(Calendar.DATE);
        for (int i = 1; i < max; i = i + k) {
            list.add(begincal.getTime());
            begincal.add(Calendar.DATE, k);
        }
        begincal = new GregorianCalendar(beginYear, beginMonth, max);
        list.add(begincal.getTime());
        return list;
    }

    /**
     * 格式化日期
     * yyyy-MM-dd HH:mm:ss
     *
     * @param @param  date
     * @param @return
     * @Description:
     */
    public static Date format(Date date) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = sd.parse(sd.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String timeFormat(Date date) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sd.format(date);
    }

    /**
     * 字符串日期格式转换
     * 如 2018年10月20日 转为 2018-10-20
     *
     * @param dateString
     * @return
     */
    public static String format1(String dateString) {

        SimpleDateFormat fromFormat = new SimpleDateFormat("yyyy年MM月dd日");
        fromFormat.setTimeZone(TimeZone.getTimeZone("GMT+8:00"));
        SimpleDateFormat toFormat = new SimpleDateFormat("yyyy-MM-dd");
        toFormat.setTimeZone(TimeZone.getTimeZone("GMT+8:00"));
        String result = null;
        try {
            Date date = fromFormat.parse(dateString);
            result = toFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 字符串日期格式转换
     * 如 2018-10-20 转为 2018年10月20日
     *
     * @param dateString
     * @return
     */
    public static String format2(String dateString) {

        SimpleDateFormat toFormat = new SimpleDateFormat("yyyy年MM月dd日");
        toFormat.setTimeZone(TimeZone.getTimeZone("GMT+8:00"));
        SimpleDateFormat fromFormat = new SimpleDateFormat("yyyy-MM-dd");
        fromFormat.setTimeZone(TimeZone.getTimeZone("GMT+8:00"));
        String result = "";
        try {
            Date date = fromFormat.parse(dateString);
            result = toFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    private static List<String> dateExlcudeKeywords = new ArrayList<>();

    {
        dateExlcudeKeywords.add("时");
        dateExlcudeKeywords.add("分");
        dateExlcudeKeywords.add("秒");
    }

    public static Date string2Date(String dateString) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日");
        try {
            String finalDateString = dateString;
            long count = DateUtils.dateExlcudeKeywords.stream().filter(o -> !finalDateString.contains(o)).count();
            if (count > 0) {
                dateString = dateString.substring(0, dateString.indexOf("日"));
            }
            return dateFormat.parse(dateString);
        } catch (ParseException e) {
            //e.printStackTrace();
            throw e;
        }
    }

    public static String addDateStr(String dateString, Integer num) throws ParseException {
        logger.info(dateString);
        logger.info(num + "");

        if (StringUtils.isEmpty(dateString)) {
            return "";
        }

        if (null == num) {
            num = 0;
        }

        if (0 > num) {
            return "";
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日");
        try {
            String finalDateString = dateString;
            long count = DateUtils.dateExlcudeKeywords.stream().filter(o -> !finalDateString.contains(o)).count();
            if (count > 0) {
                dateString = dateString.substring(0, dateString.indexOf("日"));
            }
            Date dateTime = dateFormat.parse(dateString);
            Calendar c = Calendar.getInstance();
            c.setTime(dateTime);
            c.add(Calendar.DAY_OF_MONTH, num);
            return dateFormat.format(c.getTime());

        } catch (ParseException e) {
            e.getErrorOffset();
            throw e;
        }
    }

    /**
     * 获取GMT+8当前时间
     */
    public static LocalDateTime getCurrentTime() {
        return LocalDateTime.now(ZoneOffset.ofHours(8));
    }

    /**
     * 将格式为yyyyMMdd的字符串转为时间
     *
     * @param time
     * @return
     */
    public static String formatTime(LocalDateTime time) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        return formatter.format(time);
    }

    public static String formatLocalDateTimeToString(LocalDateTime dateTime) {
        return dateTime.format(DEFAULT_TIME_PATTERN);
    }

    /**
     * 时间戳转LocalDateTime
     *
     * @param timestamp
     * @return
     */
    public static LocalDateTime fromTimestamp(Long timestamp) {
        return LocalDateTime.ofEpochSecond(timestamp / 1000, 0, ZoneOffset.ofHours(8));
    }

    /**
     * 将LocalDateTime转成指定格式
     */
    public static String formatDateTime(LocalDateTime localDateTime, DateTimeFormatter formatter) {
        return localDateTime.format(formatter);
    }

    /**
     * 将LocalDateTime转成yyyy.MM.dd HH:mm
     */
    public static String formatDateTimeOfPattern1(LocalDateTime localDateTime) {
        return formatDateTime(localDateTime, DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm"));
    }

    public static long toTimestamp(LocalDateTime localDateTime) {
        return localDateTime.toInstant(ZoneOffset.ofHours(8)).toEpochMilli();
    }

    /**
     * 获取当前秒级时间戳
     *
     * @return
     */
    public static int getTimestampOfSecond() {
        return (int) (System.currentTimeMillis() / 1000);
    }

    /**
     * 获取GMT+8 当前时间 并以yyyy-MM-dd HH:mm:ss格式返回
     *
     * @return
     */
    public static String formatCurrentTime() {
        return DateUtils.getCurrentTime().format(DEFAULT_TIME_PATTERN);
    }

    /**
     * yyyy-MM-dd HH:mm 转换成LocalDateTime
     *
     * @param dateTime
     * @return
     */
    public static LocalDateTime parseTime(String dateTime) {
        return LocalDateTime.parse(dateTime, ORDINARY_TIME_PATTERN);
    }

    /**
     * 获取 yyyy-MM-dd HH:mm 格式时间字符串
     *
     * @param localDateTime
     * @return
     */
    public static String getStandardTimePatternWithoutSec(LocalDateTime localDateTime) {
        return localDateTime.format(ORDINARY_TIME_PATTERN);
    }

    /**
     * 获取 xx月xx日
     *
     * @param localDateTime
     * @return
     */
    public static String getChineseMonthAndDay(LocalDateTime localDateTime) {
        return String.format(CHINESE_MONTH_AND_DAY_PATTERN, localDateTime.getMonthValue(), localDateTime.getDayOfMonth());
    }

}
