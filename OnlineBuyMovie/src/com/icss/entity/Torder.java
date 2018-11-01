package com.icss.entity;


import java.util.Date;

public class Torder {

  private String oid;
  private String aid;
  private double allmoney;
  private Date ordertime;
  private String seatinfos;
  private char state;
  private String seatnos;

  @Override
  public String toString() {
    return "Torder{" +
            "oid='" + oid + '\'' +
            ", aid='" + aid + '\'' +
            ", allmoney=" + allmoney +
            ", ordertime=" + ordertime +
            ", seatinfos='" + seatinfos + '\'' +
            ", state='" + state + '\'' +
            ", seatnos='" + seatnos + '\'' +
            '}';
  }

  public String getOid() {
    return oid;
  }

  public void setOid(String oid) {
    this.oid = oid;
  }

  public String getAid() {
    return aid;
  }

  public void setAid(String aid) {
    this.aid = aid;
  }

  public double getAllmoney() {
    return allmoney;
  }

  public void setAllmoney(double allmoney) {
    this.allmoney = allmoney;
  }

  public Date getOrdertime() {
    return ordertime;
  }

  public void setOrdertime(Date ordertime) {
    this.ordertime = ordertime;
  }

  public String getSeatinfos() {
    return seatinfos;
  }

  public void setSeatinfos(String seatinfos) {
    this.seatinfos = seatinfos;
  }

  public char getState() {
    return state;
  }

  public void setState(char state) {
    this.state = state;
  }

  public String getSeatnos() {
    return seatnos;
  }

  public void setSeatnos(String seatnos) {
    this.seatnos = seatnos;
  }
}