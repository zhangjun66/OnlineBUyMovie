package com.icss.biz;

import com.icss.dao.CinemaDao;
import com.icss.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service("cinemaBiz")
public class CinemaBiz {

    @Autowired
    private CinemaDao cinemaDao;


    /**
     * 影院管理员登陆
     * @param uname
     * @param pwd
     * @return
     */
    @Transactional(readOnly = true)
    public Tcinemaadmin login(String uname, String pwd)throws Exception{

        if(uname.length() < 20) {
            if (pwd.length() < 20) {
                return cinemaDao.login(uname.trim(), pwd.trim());
            }else{
                throw new Exception("密码过长，请重新输入！！");
            }
        }else{
            throw new Exception("用户名过长，请重新输入！！");
        }

    }

    /**
     * 增加影厅和影厅的座位
     * @param hall
     * @param seats
     * @throws Exception
     */
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void addHall(Tmoviehall hall, String seats) throws Exception{
        cinemaDao.addHall(hall);
        List<Tseat> listSeat  = this.getseat(hall, seats);
        Iterator<Tseat> iter = listSeat.iterator();
        while(iter.hasNext()){
            cinemaDao.addSeat(iter.next());
        }
    }

    /**
     * 得到一个影厅的座位
     * @param hall
     * @param seats
     * @return
     * @throws Exception
     */
    public List<Tseat> getseat(Tmoviehall hall,String seats)throws Exception{
        List<Tseat> seatList = new ArrayList<Tseat>();
        int a = 0;

        for(Integer i = 1;i <= hall.getAllrow();i++){
            for(Integer j = 1;j <= hall.getAllcol();j++){
                Tseat seat = new Tseat();
                seat.setSeatno(hall.getHno()+"-"+i.toString()+"-"+j.toString());
                seat.setHno(hall.getHno());
                seat.setRowno(i.toString());
                seat.setColno(j.toString());
                seat.setState(seats.charAt(a++));
                seatList.add(seat);
            }
        }
        return seatList;
    }

    /**
     * 得到影厅
     * @param hno
     * @return
     * @throws Exception
     */
    @Transactional(readOnly = true)
    public Tmoviehall getHall(String hno)throws Exception{
        return cinemaDao.getHall(hno);
    }

    /**
     * 得到所以影厅
     * @return
     * @throws Exception
     */
    @Transactional(readOnly = true)
    public List<Tmoviehall> getHalls(String cid)throws Exception{
        return cinemaDao.getHalls(cid);
    }

    /**
     * 得到一个影厅的座位
     * @param hno
     * @return
     * @throws Exception
     */
    public List<Tseat> getSeat(String hno) throws Exception{
        return cinemaDao.getSeat(hno);
    }

    /**
     * 增加场次
     * @param ronda
     * @throws Exception
     */
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void addRonda(Tronda ronda)throws Exception{
        cinemaDao.addRonda(ronda);
        List<Tseat> seats = cinemaDao.getSeat(ronda.getHno());
        Iterator<Tseat> iter = seats.iterator();
        while (iter.hasNext()){
            Tseat seat = iter.next();
            Trondaseat ticket = new Trondaseat();
            ticket.setAid(ronda.getAid());
            ticket.setSeatno(seat.getSeatno());
            if (seat.getState() == '1')
                ticket.setState(1);
            else
                ticket.setState(0);
            cinemaDao.addTicket(ticket);
        }
    }

    /**
     * 得到正在上映的电影
     * @return
     * @throws Exception
     */
    @Transactional(readOnly = true)
    public List<Tmovie> getMoive(String state)throws Exception{
        return cinemaDao.getMoive(state);
    }


}
