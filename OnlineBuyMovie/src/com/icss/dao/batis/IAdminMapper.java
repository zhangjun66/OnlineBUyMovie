package com.icss.dao.batis;

import com.icss.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAdminMapper {

    public TAdmin login(@Param("uname") String uname, @Param("pwd") String pwd);
    public void addmoives(@Param("movie") Tmovie movie)throws Exception;
    public void addType(@Param("type") Type type)throws Exception;
    public List<Type> selectTypes()throws Exception;
    public void addFilm(@Param("film") Tfilm film)throws  Exception;
    public void addCity(@Param("city") TCity city)throws Exception;
    public List<TCity> getCity()throws Exception;
    public void addArea(@Param("area") TDistrict area)throws Exception;
    public List<TDistrict> getArea(@Param("cno") String cno)throws Exception;
    public void addCinema(@Param("cinema") TCinema cinema)throws Exception;
    public List<TCinema> getCinema()throws Exception;
    public void addCinemaAdmin(@Param("cinemaadmin") Tcinemaadmin cinemaadmin)throws Exception;

}
