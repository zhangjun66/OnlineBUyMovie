package com.icss.dao;

import com.icss.dao.batis.ICinemaMapper;
import com.icss.dto.MovieSeat;
import com.icss.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository("cinemaDao")
public class CinemaDao {

    @Autowired
    private ICinemaMapper cinemaMapper;

    /**
     * 影院管理员登陆
     * @param uname
     * @param pwd
     * @return
     */
    public Tcinemaadmin login(String uname, String pwd){
        return cinemaMapper.login(uname, pwd);
    }

    /**
     * 增加影厅
     *
     * @param hall
     */
    public void addHall(Tmoviehall hall) throws Exception {
        cinemaMapper.addHall(hall);
    }

    /**
     * 增加影厅的座位
     *
     * @param seat
     */
    public void addSeat(Tseat seat) throws Exception {
        cinemaMapper.addSeat(seat);
    }

    /**
     * 增加场次
     *
     * @param ronda
     * @throws Exception
     */
    public void addRonda(Tronda ronda) throws Exception {
        cinemaMapper.addRonda(ronda);
    }

    /**
     * 得到一个影厅的详细信息
     *
     * @param hno
     * @return
     * @throws Exception
     */
    public Tmoviehall getHall(String hno) throws Exception {
        return cinemaMapper.getHall(hno);
    }

    /**
     * 得到所有的影厅
     *
     * @return
     * @throws Exception
     */
    public List<Tmoviehall> getHalls(String cid) throws Exception {
        return cinemaMapper.getHalls(cid);
    }

    /**
     * 得到所有的影片
     *
     * @return
     * @throws Exception
     */
    public List<Tmovie> getMoive(String state) throws Exception {
        return cinemaMapper.getMoive(state);
    }

    /**
     * 得到一个影厅的座位信息
     *
     * @param hno
     * @return
     * @throws Exception
     */
    public List<Tseat> getSeat(String hno) throws Exception {
        return cinemaMapper.getSeat(hno);
    }

    /**
     * 增加场次的票
     *
     * @param ticket
     * @throws Exception
     */
    public void addTicket(Trondaseat ticket) throws Exception {
        cinemaMapper.addTicket(ticket);
    }



}
