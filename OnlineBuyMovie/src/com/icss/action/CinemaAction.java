package com.icss.action;

import com.icss.biz.CinemaBiz;
import com.icss.entity.Tcinemaadmin;
import com.icss.entity.Tmovie;
import com.icss.entity.Tmoviehall;
import com.icss.entity.Tronda;
import com.icss.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/cinema")
public class CinemaAction {

    @Autowired
    private CinemaBiz cinemaBiz;

    @RequestMapping(path = "/login.do",method = RequestMethod.GET)
    public  String login(){
        return "main/login.jsp";
    }

    /**
     * 影院管理员登陆
     * @param uname
     * @param pwd
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(path = "/login.do",method = RequestMethod.POST)
    public  String login(String uname, String pwd, Model model, HttpSession session){
        String strRet;

        if(uname.length() < 20){
            if(pwd.length() < 20){
                try {
                        Tcinemaadmin admin = cinemaBiz.login(uname.trim(), pwd.trim());                if(admin != null) {
                        session.setAttribute("admin", admin);
                        strRet = "main/main.jsp";
                    }else{
                        model.addAttribute("msg","用户名或者密码不正确，请重新输入！！");
                        model.addAttribute("uname",uname);
                        strRet = "main/login.jsp";
                    }
                }catch (Exception e){
                    Log.logger.error(e.getMessage(),e);
                    model.addAttribute("msg","网络错误，请与管理员联系！！！！");
                    strRet = "error/error.jsp";
                }
            }else{
                model.addAttribute("msg","密码过长，请重新输入！！");
                model.addAttribute("uname",uname);
                strRet = "main/login.jsp";
            }
        }else{
            model.addAttribute("msg","用户名过长，请重新输入！！");
            strRet = "main/login.jsp";
        }
        return strRet;
    }


    @RequestMapping(path = "addhall.do",method = RequestMethod.GET)
    public String addhall(){
        return "main/addhall.jsp";
    }


    /**
     * 增加影厅
     * @param hall
     * @param seats
     * @param model
     * @return
     */
    @RequestMapping(path = "addhall.do",method = RequestMethod.POST)
    public String addhall(Tmoviehall hall, String seats, Model model,HttpSession session){
        String strRet;
        try {
            Tcinemaadmin admin = (Tcinemaadmin) session.getAttribute("admin");
            hall.setCid(admin.getCid());
            cinemaBiz.addHall(hall, seats);
            model.addAttribute("msg","影厅"+hall.getHno()+"增加成功！！");
            strRet = "main/addhall.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误,添加失败,请与管理员联系！！！");
            strRet = "error.error.jsp";
        }
        return strRet;
    }

    /**
     * 增加场次
     * @param model
     * @return
     */
    @RequestMapping(path = "addronda.do",method = RequestMethod.GET)
    public String addronda(Model model,HttpSession session){
        String strRet;
        try{
            Tcinemaadmin admin = (Tcinemaadmin) session.getAttribute("admin");
            List<Tmoviehall> halls = cinemaBiz.getHalls(admin.getCid());
            List<Tmovie> movies = cinemaBiz.getMoive("1");
            model.addAttribute("halls",halls);
            model.addAttribute("movies",movies);
            strRet = "main/addronda.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误,请与管理员联系！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }

    /**
     * 增加场次
     * @param model
     * @return
     */
    @RequestMapping(path = "addronda.do",method = RequestMethod.POST)
    public String addronda(@DateTimeFormat(pattern = "yyyy-MM-dd") Date playtimes,
                           @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") Date begintime,
                           @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") Date endtime,
                           Tronda ronda, Model model,HttpSession session){
        String strRet;
        try{
            Tcinemaadmin admin = (Tcinemaadmin) session.getAttribute("admin");
            ronda.setBeginTime(begintime);
            ronda.setEndTime(endtime);
            ronda.setPlaytime(playtimes);
            ronda.setAid(new Long(new Date().getTime()).toString());
            cinemaBiz.addRonda(ronda);
            model.addAttribute("msg","添加成功！！");
            List<Tmoviehall> halls = cinemaBiz.getHalls(admin.getCid());
            List<Tmovie> movies = cinemaBiz.getMoive("1");
            model.addAttribute("halls",halls);
            model.addAttribute("movies",movies);
            strRet = "main/addronda.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误,添加失败,请与管理员联系！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }


}
