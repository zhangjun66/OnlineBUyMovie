package com.icss.entity;


public class ToutTicket {

  private String xho;
  private String uname;
  private String rid;
  private String seatno;
  private String realPay;
  private java.sql.Date paytime;
  private String state;


  public String getXho() {
    return xho;
  }

  public void setXho(String xho) {
    this.xho = xho;
  }


  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }


  public String getRid() {
    return rid;
  }

  public void setRid(String rid) {
    this.rid = rid;
  }


  public String getSeatno() {
    return seatno;
  }

  public void setSeatno(String seatno) {
    this.seatno = seatno;
  }


  public String getRealPay() {
    return realPay;
  }

  public void setRealPay(String realPay) {
    this.realPay = realPay;
  }


  public java.sql.Date getPaytime() {
    return paytime;
  }

  public void setPaytime(java.sql.Date paytime) {
    this.paytime = paytime;
  }


  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

}
