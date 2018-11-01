package com.icss.biz;

import com.icss.dao.AdminDao;
import com.icss.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("adminBiz")
public class AdminBiz {


    @Autowired
    private AdminDao adminDao;


    /**
     * 管理员登陆
     * @param uname
     * @param pwd
     * @return
     */
    @Transactional(readOnly = true)
    public TAdmin login(String uname, String pwd)throws Exception{

        if(uname.length() < 20) {
            if (pwd.length() < 20) {
                return adminDao.login(uname.trim(), pwd.trim());
            }else{
                throw new Exception("密码过长，请重新输入！！");
            }
        }else{
            throw new Exception("用户名过长，请重新输入！！");
        }

    }

    /**
     * 添加电影
     * @param movie
     * @throws Exception
     */
    @Transactional(readOnly=false,rollbackFor = Throwable.class)
    public void addmovies(Tmovie movie, String[] types)throws  Exception{
        adminDao.addmovies(movie);
        for(int i=0;i<types.length;i++){
            Tfilm film = new Tfilm();
            film.setMid(movie.getMid());
            film.setTyno(types[i]);
            adminDao.addFilm(film);
        }
    }

    /**
     * 添加类型
     * @param type
     * @throws Exception
     */
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void addType(Type type)throws Exception{
        adminDao.addType(type);
    }

    /**
     * 得到所有类型
     * @return
     * @throws Exception
     */
    @Transactional(readOnly = true)
    public List<Type> selectTypes()throws Exception{
        return adminDao.selectTypes();
    }

    /**
     * 增加城市
     * @param city
     */
    public void addCity(TCity city)throws Exception{
        adminDao.addCity(city);
    }

    /**
     * 得到城市
     * @return
     */
    public List<TCity> getCity()throws Exception{
        return adminDao.getCity();
    }

    /**
     * 增加区域
     * @param area
     */
    public void addArea(TDistrict area)throws Exception{
        adminDao.addArea(area);
    }

    /**
     * 得到区域
     * @param cid
     * @return
     */
    public List<TDistrict> getArea(String cno)throws Exception{
        return adminDao.getArea(cno);
    }

    /**
     * 增加电影院
     * @param cinema
     */
    public void addCinema(TCinema cinema)throws Exception{
        adminDao.addCinema(cinema);
    }

    /**
     * 得到电影院
     * @return
     */
    public List<TCinema> getCinema()throws Exception{
        return adminDao.getCinema();
    }

    /**
     * 增加电影院管理员
     * @param cinemaadmin
     */
    public void addCinemaAdmin(Tcinemaadmin cinemaadmin)throws Exception{
        adminDao.addCinemaAdmin(cinemaadmin);
    }

}
