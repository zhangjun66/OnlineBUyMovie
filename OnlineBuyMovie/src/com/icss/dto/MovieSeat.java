package com.icss.dto;

import com.icss.entity.Trondaseat;

import java.util.Date;
import java.util.List;

public class MovieSeat {

    private String mid;
    private String mname;
    private String length;
    private String hno;
    private Date beginTime;
    private String language;
    private double price;
    private double allrow;
    private double allcol;
    private String cover;
    private List<Trondaseat> states;

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getHno() {
        return hno;
    }

    public void setHno(String hno) {
        this.hno = hno;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getAllrow() {
        return allrow;
    }

    public void setAllrow(double allrow) {
        this.allrow = allrow;
    }

    public double getAllcol() {
        return allcol;
    }

    public void setAllcol(double allcol) {
        this.allcol = allcol;
    }

    public List<Trondaseat> getStates() {
        return states;
    }

    public void setStates(List<Trondaseat> states) {
        this.states = states;
    }
}
