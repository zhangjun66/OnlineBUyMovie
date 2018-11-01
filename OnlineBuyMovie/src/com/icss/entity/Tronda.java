package com.icss.entity;


import java.util.Date;

public class Tronda {

  private String aid;
  private String hno;
  private String mid;
  private Date beginTime;
  private String language;
  private String price;
  private Date endTime;
  private Date playtime;

  public Date getPlaytime() {
    return playtime;
  }

  public void setPlaytime(Date playtime) {
    this.playtime = playtime;
  }

  public String getAid() {
    return aid;
  }

  public void setAid(String aid) {
    this.aid = aid;
  }


  public String getHno() {
    return hno;
  }

  public void setHno(String hno) {
    this.hno = hno;
  }


  public String getMid() {
    return mid;
  }

  public void setMid(String mid) {
    this.mid = mid;
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


  public String getPrice() {
    return price;
  }

  public void setPrice(String price) {
    this.price = price;
  }


  public Date getEndTime() {
    return endTime;
  }

  public void setEndTime(Date endTime) {
    this.endTime = endTime;
  }

}
