package com.icss.entity;


import java.util.Date;

public class Trondaseat {

  private String rsid;
  private String aid;
  private String rid;
  private String seatno;
  private int state;
  private Date selectTime;

  public String getAid() {
    return aid;
  }

  public void setAid(String aid) {
    this.aid = aid;
  }

  public String getRsid() {
    return rsid;
  }

  public void setRsid(String rsid) {
    this.rsid = rsid;
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


  public int getState() {
    return state;
  }

  public void setState(int state) {
    this.state = state;
  }


  public Date getSelectTime() {
    return selectTime;
  }

  public void setSelectTime(Date selectTime) {
    this.selectTime = selectTime;
  }

}
