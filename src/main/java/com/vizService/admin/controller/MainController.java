package com.vizService.admin.controller;


import com.vizService.admin.dao.UserDao;
import com.vizService.admin.service.UserImpl;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by sonny on 2015/11/3.
 */
@Controller
public class MainController {

    UserDao userDao = new UserImpl();
    /**
     * the index page for administrator logined successfully
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView indexPage(){
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
    }

    //the login page
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView model = new ModelAndView();
        model.setViewName("login");
        return model;
    }

    /**
     * check user if logined or not
     * select name,password, enabled from user where name= 'alex' and userRole='ROLE_ADMIN';
     * @return
     */
    @RequestMapping(value = "/useraccess",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String UserAcl(@RequestParam String username,
                                @RequestParam String password,
                                HttpSession session){
        int result = -1;
        if (username != null && password !=null){
            try {
                result = userDao.checkUserStatus(username,password);
                if (result != -1){
                    session.setAttribute("username",username);
                    session.setAttribute("password",password);
                    session.setMaxInactiveInterval(1800);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return String.valueOf(result);
    }


}
