package com.icss.dao;

import com.icss.dao.batis.IAdminMapper;
import com.icss.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminDao")
public class AdminDao {

    @Autowired
    private IAdminMapper adminMapper;

    /**
     * 管理员登陆
     * @param uname
     * @param pwd
     * @return
     */
    public TAdmin login(String uname, String pwd){
        return adminMapper.login(uname, pwd);
    }

    /**
     * 增加影片
     * @param movie
     * @throws Exception
     */
    public void  addmovies(Tmovie movie)throws Exception{
        adminMapper.addmoives(movie);
    }

    /**
     * 增加类型
     * @param type
     * @throws Exception
     */
    public void addType(Type type)throws Exception{
        adminMapper.addType(type);

    }

    /**
     * 得到所有类型
     * @return
     * @throws Exception
     */
    public List<Type> selectTypes()throws Exception{
        return adminMapper.selectTypes();
    }

    /**
     * 增加影片类型
     * @param film
     * @throws Exception
     */
    public void addFilm(Tfilm film)throws  Exception{
        adminMapper.addFilm(film);
    }

    /**
     * 增加城市
     * @param city
     */
    public void addCity(TCity city)throws Exception{
        adminMapper.addCity(city);
    }

    /**
     * 得到城市
     * @return
     */
    public List<TCity> getCity()throws Exception{
        return adminMapper.getCity();
    }

    /**
     * 增加区域
     * @param area
     */
    public void addArea(TDistrict area)throws Exception{
        adminMapper.addArea(area);
    }

    /**
     * 得到区域
     * @param cno
     * @return
     */
    public List<TDistrict> getArea(String cno)throws Exception{
        return adminMapper.getArea(cno);
    }

    /**
     * 增加电影院
     * @param cinema
     */
    public void addCinema(TCinema cinema)throws Exception{
        adminMapper.addCinema(cinema);
    }

    /**
     * 得到电影院
     * @return
     */
    public List<TCinema> getCinema()throws Exception{
        return adminMapper.getCinema();
    }

    /**
     * 增加电影院管理员
     * @param cinemaadmin
     */
    public void addCinemaAdmin(Tcinemaadmin cinemaadmin)throws Exception{
        adminMapper.addCinemaAdmin(cinemaadmin);
    }

}
