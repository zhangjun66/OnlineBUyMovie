package com.icss.dao.batis;

import com.icss.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICinemaMapper {

    public Tcinemaadmin login(@Param("uname") String uname, @Param("pwd") String pwd);
    public void addHall(@Param("hall") Tmoviehall hall)throws Exception;
    public void addSeat(@Param("seat") Tseat seat)throws Exception;
    public Tmoviehall getHall(@Param("hno") String hno) throws Exception;
    public List<Tmoviehall> getHalls(@Param("cid") String cid)throws Exception;
    public List<Tmovie> getMoive(@Param("state") String state)throws Exception;
    public void addRonda(@Param("ronda") Tronda ronda)throws Exception;
    public List<Tseat> getSeat(@Param("hno") String hno) throws Exception;
    public void addTicket(@Param("ticket") Trondaseat ticket)throws Exception;

}
