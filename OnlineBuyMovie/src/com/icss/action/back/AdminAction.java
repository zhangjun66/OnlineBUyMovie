package com.icss.action.back;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.icss.biz.AdminBiz;
import com.icss.entity.*;
import com.icss.util.Log;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import net.sf.json.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/back")
public class AdminAction {

    @Autowired
    private AdminBiz adminBiz;

    @RequestMapping(path = "/login.do",method = RequestMethod.GET)
    public  String login(){
        return "back/login.jsp";
    }

    /**
     * 管理员登陆
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
                    TAdmin admin = adminBiz.login(uname.trim(), pwd.trim());
                    if(admin != null) {
                        session.setAttribute("admin", admin);
                        strRet = "back/main.jsp";
                    }else{
                        model.addAttribute("msg","用户名或者密码不正确，请重新输入！！");
                        model.addAttribute("uname",uname);
                        strRet = "back/login.jsp";
                    }
                }catch (Exception e){
                    Log.logger.error(e.getMessage(),e);
                    model.addAttribute("msg","网络错误，请与管理员联系！！！！");
                    strRet = "error/error.jsp";
                }
            }else{
                model.addAttribute("msg","密码过长，请重新输入！！");
                model.addAttribute("uname",uname);
                strRet = "back/login.jsp";
            }
        }else{
            model.addAttribute("msg","用户名过长，请重新输入！！");
            strRet = "back/login.jsp";
        }
        return strRet;
    }

    /**
     * 增加影片
     * @return
     */
    @RequestMapping(path="/addMovie.do",method = RequestMethod.GET)
    public String addmovies(Model model){
        String strRet;

        try{
            List<Type> types = adminBiz.selectTypes();
            model.addAttribute("types",types);
            strRet = "back/movieAdd.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "/error/error.jsp";
        }

        return strRet;
    }

    /**
     * 增加影片
     * @param movie
     * @param date
     * @param model
     * @return
     */
    @RequestMapping(path="/addMovie.do",method = RequestMethod.POST)
    public String addmovies(@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date date,
                            String[] types, Model model, Tmovie movie){
        String strRet;

        try{
            movie.setBgdate(date);
            adminBiz.addmovies(movie,types);
            model.addAttribute("msg",movie.getMname()+"添加成功！！");
            strRet = "back/movieAdd.jsp";
        }catch(Exception e){
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
            Log.logger.error(e.getMessage(),e);
        }

        return strRet;
    }

    /**
     * 上传图片
     * @param pic
     * @return
     */
    @RequestMapping(value = "/upPic.do")
    @ResponseBody
    public String  uploadPic(@RequestParam("pic") MultipartFile pic) {

        // 图片名称生成策略
        UUID uuid = UUID.randomUUID();
        // 获取图片的扩展名
        String extension = FilenameUtils.getExtension(pic.getOriginalFilename());
        // 实例化一个jersey
        Client client = new Client();
        // 保存到数据库的path
        String path =  uuid + "." + extension;
        // 另一台tomcat的URL
        String url = "http://10.0.8.16:9090/img/fangou/" + path;
        // 设置请求路径
        WebResource resource = client.resource(url);

        // 发送开始post get put（基于put提交）
        try {
            resource.put(String.class, pic.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String,String> map = new HashMap<>();
        map.put("url", url);
        map.put("path", path);
        JSONArray jsonArray = JSONArray.fromObject(map);
        return jsonArray.toString();
    }

    /**
     * 增加类型
     * @return
     */
    @RequestMapping(path="/addtype.do",method = RequestMethod.GET)
    public String addType(){
        return "back/addtype.jsp";
    }

    /**
     * 增加类型
     * @param type
     */
    @RequestMapping(path="/addtype.do",method = RequestMethod.POST)
    public String addType(Type type, Model model){
        String strRet;
        try{
            adminBiz.addType(type);
            model.addAttribute("msg",type.getTyname()+"添加成功!!");
            strRet = "back/addtype.jsp";
        }catch(Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }

        return strRet;
    }

    /**
     * 增加城市
     * @return
     */
    @RequestMapping(path = "/addcity.do",method = RequestMethod.GET)
    public String addcity(){
        return "back/addcity.jsp";
    }

    /**
     * 增加城市
     * @return
     */
    @RequestMapping(path = "/addcity.do",method = RequestMethod.POST)
    public String addcity(TCity city, Model model){
        String strRet;

        try{
            adminBiz.addCity(city);
            model.addAttribute("msg","城市"+city.getCityname()+"增加成功!!");
            strRet = "back/addcity.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }

    /**
     * 增加城市区域
     * @param model
     * @return
     */
    @RequestMapping(path = "/addarea.do",method = RequestMethod.GET)
    public String addarea(Model model){
        String strRet;

        try{
            List<TCity> citys = adminBiz.getCity();
            model.addAttribute("citys",citys);
            strRet = "back/addarea.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }

    /**
     * 增加城市区域
     * @param model
     * @return
     */
    @RequestMapping(path = "/addarea.do",method = RequestMethod.POST)
    public String addarea(Model model,TDistrict area){
        String strRet;

        try{
            adminBiz.addArea(area);
            List<TCity> citys = adminBiz.getCity();
            model.addAttribute("citys",citys);
            model.addAttribute("msg",area.getDname()+"区域，增加成功！！");
            strRet = "back/addarea.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }

    @RequestMapping("/getarea.do")
    @ResponseBody
    public String getarea(String cno){
        String strRet = null;
        try {
            ObjectMapper mapper = new ObjectMapper();
            strRet = mapper.writeValueAsString(adminBiz.getArea(cno));
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
        }
        return strRet;
    }

    /**
     * 增加电影院
     * @param model
     * @return
     */
    @RequestMapping(path = "/addcinema.do",method = RequestMethod.GET)
    public String addcinema(Model model){
        String strRet;

        try{
            List<TCity> citys = adminBiz.getCity();
            model.addAttribute("citys",citys);
            strRet = "back/addcinema.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }

    /**
     * 增加电影院
     * @param model
     * @return
     */
    @RequestMapping(path = "/addcinema.do",method = RequestMethod.POST)
    public String addcinema(Model model,TCinema cinema){
        String strRet;

        try{
            adminBiz.addCinema(cinema);
            List<TCity> citys = adminBiz.getCity();
            model.addAttribute("citys",citys);
            model.addAttribute("msg",cinema.getCname()+"影院，增加成功！！");
            strRet = "back/addcinema.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }

    /**
     * 增加电影院管理员
     * @param model
     * @return
     */
    @RequestMapping(path = "/addcinemaadmin.do",method = RequestMethod.GET)
    public String addcinemaAdmin(Model model){
        String strRet;

        try{
            List<TCinema> cinemas = adminBiz.getCinema();
            model.addAttribute("cinemas",cinemas);
            strRet = "back/addcinemaadmin.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }

    @RequestMapping(path = "/addcinemaadmin.do",method = RequestMethod.POST)
    public String addcinemaAdmin(Model model,Tcinemaadmin cinemaadmin){
        String strRet;

        try{
            adminBiz.addCinemaAdmin(cinemaadmin);
            List<TCinema> cinemas = adminBiz.getCinema();
            model.addAttribute("cinemas",cinemas);
            model.addAttribute("msg",cinemaadmin.getUname()+"管理员，增加成功！！");
            strRet = "back/addcinemaadmin.jsp";
        }catch (Exception e){
            Log.logger.error(e.getMessage(),e);
            model.addAttribute("msg","网络错误，请与管理员联系！！！！");
            strRet = "error/error.jsp";
        }
        return strRet;
    }


}

