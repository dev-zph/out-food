package com.food.out.page;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author Steven.Qin
 */
public class SelfPage<T> {
    public static final int DEFAULT_PAGE_SIZE = 20;

    public static final int DEFAULT_SERIES_SIZE = 5;

    public static final String DEFAULT_TOPAGE_FUN = "get";

    public int pageSize = DEFAULT_PAGE_SIZE;

    public int seriesSize = DEFAULT_SERIES_SIZE;

    public String toPageFun = DEFAULT_TOPAGE_FUN;

    public int firstPageNo = 1;

    public int prePageNo = 1;

    public int pageNo = 1;

    public int nextPageNo = 1;

    public int lastPageNo = 1;

    public int totalPageNo = 1;

    public List<T> records = new ArrayList<T>();

    public String pageUrl = "";

    public String pageBar = "";

    public Map<String, Object> conditions = null;

    public void initPageBar() {
        if (seriesSize < 3) {
            seriesSize = 5;
        }
        if (totalPageNo > 0) {
            StringBuffer pb = new StringBuffer();
            pb.append("<ul class=\"pagination pull-right no-margin\">");
            pb.append("<li><a href=\"javascript:void(0)\" class=\"previous\" onclick=\"toPage('"
                    + this.firstPageNo + "','" + this.pageUrl + "');\">首页</a></li>");
            pb.append("<li><a href=\"javascript:void(0)\"  onclick=\"toPage('"
                    + this.prePageNo + "','" + this.pageUrl + "');\">上一页</a></li>");
            if (totalPageNo <= seriesSize) {
                for (int i = 1; i <= totalPageNo; i++) {
                    if (this.pageNo == i) {
                        pb.append("<li class=\"active\"><a href=\"javascript:void(0)\" >"
                                + i + "</a></li>");
                    } else {
                        pb.append("<li><a href=\"javascript:void(0)\" onclick=\"toPage('"
                                + i
                                + "','"
                                + this.pageUrl
                                + "');\">"
                                + i
                                + "</a></li>");
                    }
                }
            } else {
                int[] series = new int[seriesSize];
                int j = 0;
                if (seriesSize % 2 != 0) {
                    j = 0;
                    for (int i = pageNo - seriesSize / 2; i <= pageNo
                            + seriesSize / 2; i++) {
                        series[j] = i;
                        j++;
                    }
                } else {
                    j = 0;
                    for (int i = pageNo - seriesSize / 2; i <= pageNo
                            + seriesSize / 2 - 1; i++) {
                        series[j] = i;
                        j++;
                    }
                }
                j = 0;
                if (series[seriesSize - 1] > totalPageNo) {
                    for (int i = totalPageNo - seriesSize + 1; i <= totalPageNo; i++) {
                        series[j] = i;
                        j++;
                    }
                } else if (series[0] < 1) {
                    for (int i = 1; i <= seriesSize; i++) {
                        series[j] = i;
                        j++;
                    }
                }
                for (int i = 0; i < seriesSize; i++) {
                    if (this.pageNo == series[i]) {
                        pb.append("<li class=\"active\"><a href=\"javascript:void(0)\">"
                                + series[i] + "</a></li>");
                    } else {
                        pb.append("<li><a href=\"javascript:void(0)\" onclick=\"toPage('"
                                + series[i]
                                + "','"
                                + this.pageUrl
                                + "');\">"
                                + series[i] + "</a></li>");
                    }
                }
            }
            pb.append("<li><a href=\"javascript:void(0)\" onclick=\"toPage('"
                    + this.nextPageNo + "','" + this.pageUrl + "');\">下一页</a</li>");
            pb.append("<li><a href=\"javascript:void(0)\"  onclick=\"toPage('"
                    + this.lastPageNo + "','" + this.pageUrl + "');\">末页</a></li>");
            pb.append("</div>");
            StringBuffer inputs = new StringBuffer();
            if (null != conditions) {
                Iterator iter = conditions.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry<String, Object> entry = (Map.Entry<String, Object>) iter.next();
                    String key = entry.getKey();
                    Object value = entry.getValue();
                    inputs.append("<input type=\\\"hidden\\\" name=\\\"" + key
                            + "\\\" value=\\\"" + (null == value ? "" : value)
                            + "\\\"/>");
                }
            }
            //
            pb.append("<script type=\"text/javascript\">");
            pb.append("function toPage(pageNo,pageUrl){");
            pb.append("if(parseInt(pageNo,10)==-1){return false;}else{");
            pb.append("if(pageUrl.indexOf(\"?\")>-1){pageUrl+=\"&\\pageNo=\"+pageNo;}else{pageUrl+=\"?\\pageNo=\"+pageNo;}");
            pb.append(this.toPageFun + "(pageUrl);");
            pb.append("}}");
            pb.append("</script>");
            this.pageBar = pb.toString();
        } else {
            StringBuffer pb = new StringBuffer();
            pb.append("<div align=\"center\" class=\"norecord\">");
            pb.append("未搜索到相关记录！");
            pb.append("</div>");
            this.pageBar = pb.toString();
        }
    }

    public SelfPage() {
    }

    /**
     * 2016-11-03 by yhq
     *
     * @param totalRecords
     * @param reqPageNo
     * @param pageUrl
     * @param conditions
     * @param toPageFun
     */
    public SelfPage(int totalRecords, int reqPageNo, String pageUrl,
                    Map<String, Object> conditions, String toPageFun) {
        this.conditions = conditions;
        this.toPageFun = toPageFun;
        initPage(totalRecords, reqPageNo, pageUrl);
    }

    /**
     * @param totalRecords
     * @param reqPageNo
     */
    public SelfPage(int totalRecords, int reqPageNo, String pageUrl) {
        initPage(totalRecords, reqPageNo, pageUrl);
    }

    /**
     * @param totalRecords
     * @param reqPageNo
     */
    public SelfPage(int totalRecords, int reqPageNo, String pageUrl,
                    Map<String, Object> conditions) {
        this.conditions = conditions;
        initPage(totalRecords, reqPageNo, pageUrl);
    }

    /**
     * @param totalRecords
     * @param reqPageNo
     * @param pageUrl
     */
    public void initPage(int totalRecords, int reqPageNo, String pageUrl) {
        totalPageNo = (totalRecords % pageSize > 0) ? totalRecords / pageSize
                + 1 : totalRecords / pageSize;
        if (totalPageNo <= 0) {
            totalPageNo = -1;
        } else {
            if (reqPageNo < 1) {
                reqPageNo = 1;
            }
            if (reqPageNo > totalPageNo) {
                reqPageNo = totalPageNo;
            }
            pageNo = reqPageNo;
            firstPageNo = (pageNo - 1 == 0) ? -1 : 1;
            prePageNo = (pageNo - 1 > 0) ? pageNo - 1 : -1;
            nextPageNo = (pageNo + 1 <= totalPageNo) ? pageNo + 1 : -1;
            lastPageNo = (pageNo == totalPageNo) ? -1 : totalPageNo;
        }
        this.pageUrl = pageUrl;
        initPageBar();
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getFirstPageNo() {
        return firstPageNo;
    }

    public void setFirstPageNo(int firstPageNo) {
        this.firstPageNo = firstPageNo;
    }

    public int getPrePageNo() {
        return prePageNo;
    }

    public void setPrePageNo(int prePageNo) {
        this.prePageNo = prePageNo;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getNextPageNo() {
        return nextPageNo;
    }

    public void setNextPageNo(int nextPageNo) {
        this.nextPageNo = nextPageNo;
    }

    public int getLastPageNo() {
        return lastPageNo;
    }

    public void setLastPageNo(int lastPageNo) {
        this.lastPageNo = lastPageNo;
    }

    public List<T> getRecords() {
        return records;
    }

    public void setRecords(List<T> records) {
        this.records = records;
    }

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }

    public String getPageBar() {
        return pageBar;
    }

    public void setPageBar(String pageBar) {
        this.pageBar = pageBar;
    }

    public int getSeriesSize() {
        return seriesSize;
    }

    public void setSeriesSize(int seriesSize) {
        this.seriesSize = seriesSize;
    }

    public int getTotalPageNo() {
        return totalPageNo;
    }

    public void setTotalPageNo(int totalPageNo) {
        this.totalPageNo = totalPageNo;
    }

    public Map<String, Object> getConditions() {
        return conditions;
    }

    public void setConditions(Map<String, Object> conditions) {
        this.conditions = conditions;
    }

    public String getToPageFun() {
        return toPageFun;
    }

    public void setToPageFun(String toPageFun) {
        this.toPageFun = toPageFun;
    }
}
