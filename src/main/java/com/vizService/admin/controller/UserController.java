package com.vizService.admin.controller;

import com.google.gson.Gson;
import com.vc.vizcore.entity.share.User;
import com.vc.vizcore.entity.share.UserGroup;
import com.vizService.admin.dao.UserDao;
import com.vizService.admin.service.UserImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Vector;

/**
 * Created by sonny on 2015/11/27.
 */
@Controller
@RequestMapping(value = "/admin")
public class UserController {

    private UserDao user =new UserImpl();
    private Gson gson = new Gson();
    private Vector<UserGroup> ug = null;
    private final Logger logger = Logger.getLogger(UserController.class);

    /**
     * register the user
     * @return
     */
    @RequestMapping(value = "/getallusergroup",method = RequestMethod.POST)
    @ResponseBody
    public String getAllUserGroup(){
        try {
            ug = user.getAllUserGroup();
        } catch (Exception e) {
            logger.error("error in UserController::getAllUserGroup",e);
            e.printStackTrace();
        }

        if(ug == null){
            return "0";
        }
        return gson.toJson(ug);
    }

    /**
     * add user
     * @param username
     * @param password
     * @param emails
     * @param sel_usergroup
     * @param desc
     * @return
     */
    @RequestMapping(value = "/adduser",method = RequestMethod.POST)
    @ResponseBody
    public String addUser(@RequestParam(value = "username") String username,
                          @RequestParam(value = "password") String password,
                          @RequestParam(value = "emails") String emails,
                          @RequestParam(value = "sel_usergroup") String sel_usergroup,
                          @RequestParam(value = "desc") String desc){
        String userId = "";
        Boolean checkuser = null;
        try {
            checkuser = user.checkUserRegisted(username);
        } catch (Exception e) {
            logger.error("error in UserController::addUser::checkUserRegisted",e);
            e.printStackTrace();
        }

        if(!checkuser){
            try {
                userId = user.createUser(username,password,emails,sel_usergroup,desc);
                if(userId == null){
                    return "false";
                }
            } catch (Exception e) {
                logger.error("error in UserController::addUser::createUser",e);
                e.printStackTrace();
            }
        }else{
            return "false";
        }

        return "true";
    }

    /**
     * get all users
     * @return
     */
    @RequestMapping(value = "/getuserlist",method = RequestMethod.POST)
    @ResponseBody
    public String getAllUsers(){
        Vector<User> users = null;
        try {
            users = user.getAllUsers();
        } catch (Exception e) {
            logger.error("error in UserController::getAllUsers",e);
            e.printStackTrace();
        }
        return gson.toJson(users);
    }

    /**
     * delete user by userid
     * @param userId
     * @return
     */
    @RequestMapping(value = "/deleteuser",method = RequestMethod.POST)
    @ResponseBody
    public String deleteuserById(@RequestParam(value = "userId")String userId){
        Boolean result = null;
        try {
            result = user.deleteUser(userId);
        } catch (Exception e) {
            logger.error("error in UserController::deleteuserById",e);
            e.printStackTrace();
        }
        return gson.toJson(result);
    }
}
