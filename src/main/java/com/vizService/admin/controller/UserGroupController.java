package com.vizService.admin.controller;

import com.google.gson.Gson;
import com.vc.vizcore.entity.SystemEntityManager;
import com.vc.vizcore.entity.share.UserGroup;
import com.vizService.admin.dao.UserGroupDao;
import com.vizService.admin.service.UserGroupImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Vector;

/**
 * Created by sonny on 2015/11/27.
 */
@Controller
@RequestMapping(value = "/admin")
public class UserGroupController {

    private UserGroupDao ugi =new UserGroupImpl();
    private Gson gson = new Gson();
    private final Logger logger = Logger.getLogger(UserGroupController.class);

    /**
     * add user group
     * @param name
     * @param desc
     * @return
     */
    @RequestMapping(value = "/usergroupadd",method = RequestMethod.POST)
    @ResponseBody
    public String UserGroupAdd(@RequestParam(value = "userGroup") String name,
                               @RequestParam(value = "desc") String desc){
        String usergroupId = "";
        try {
            usergroupId = ugi.createUserGroup(name, desc);
        } catch (Exception e) {
            logger.error("error in UserGroupController::UserGroupAdd",e);
            e.printStackTrace();
        }
        if(usergroupId != null){
            return "true";
        }else{
            return "false";
        }
    }

    /**
     * get user group info
     * @return
     */
    @RequestMapping(value = "/getusergrouplist",method = RequestMethod.POST)
    @ResponseBody
    public String getAllUsrGroupList(){
        Vector<UserGroup> list = null;
        try {
            list = ugi.getAllUserGroupList();
        } catch (Exception e) {
            logger.error("error in UserGroupController::getAllUsrGroupList",e);
            e.printStackTrace();
        }
        return gson.toJson(list);
    }

    /**
     * delete user group by user group id
     * @param usergroupId
     * @return
     */
    @RequestMapping(value = "/deleteusergroup",method = RequestMethod.POST)
    @ResponseBody
    public String deleteUserGroup(@RequestParam(value = "usergroupId")String usergroupId){
        Boolean result = null;
        try {
            result = ugi.deleteUserGroup(usergroupId);
        }catch(Exception e){
            logger.error("error in UserGroupController::deleteUserGroup",e);
            e.printStackTrace();
        }
        return gson.toJson(result);
    }
}
