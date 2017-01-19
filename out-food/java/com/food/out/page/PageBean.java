package com.food.out.page;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页封装类（用于bootstrap table）
 * 用于做分页查询的基础类，封装了一些分页的相关属性
 * Created by yhq on 2016-11-16.
 */
public class PageBean<T> {
    // 总条数
    private int total;

    // 记录
    private List<T> rows = new ArrayList<T>();

    public PageBean() {
    }

    public PageBean(int total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
