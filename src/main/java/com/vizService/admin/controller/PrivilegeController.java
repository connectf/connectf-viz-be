package com.vizService.admin.controller;

import com.vc.vizcore.common.UserGroupPrivilegeType;
import com.vc.vizcore.entity.share.DataSource;
import com.vc.vizcore.entity.share.UserGroup;
import com.vc.vizcore.entity.share.UserGroupPrivilege;
import com.vizService.admin.dao.DataSourceDao;
import com.vizService.admin.dao.PrivilegeDao;
import com.vizService.admin.dao.UserGroupDao;
import com.vizService.admin.service.DataSourceImpl;
import com.vizService.admin.service.PrivilegeImpl;
import com.vizService.admin.service.UserGroupImpl;
import com.vizService.util.PrivilegeUtil;
import org.apache.log4j.Logger;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

/**
 * Created by sonny on 2015/12/15.
 */
@Controller
@RequestMapping(value = "/admin")
public class PrivilegeController {

    private PrivilegeDao privilegeDao = new PrivilegeImpl();
    private DataSourceDao DataSourceDao =new DataSourceImpl();
    private UserGroupDao userGroupDao =new UserGroupImpl();

    private static final Logger logger = Logger.getLogger(PrivilegeController.class);

    /**
     *get all Privilege for datasource
     * @return
     */
    @RequestMapping(value = "/getAllPrivileges",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ArrayList<HashMap<String,String>> getAllPrivileges(){
        Vector<UserGroupPrivilege> list = null;
        ArrayList<HashMap<String,String>> PrivilegesHash = new ArrayList<HashMap<String,String>>();
        HashMap<String,String> map = null;
        try {
            list = privilegeDao.getAllPrivilege();
            for (int i = 0; i < list.size(); i++) {
                map = new HashMap<String, String>();
                String dataSourceName = list.get(i).getDataSourceName();
                String dataSourceId = list.get(i).getDataSourceId();
                String userGroupName = list.get(i).getUserGroupName();
                String userGroupId = list.get(i).getUserGroupId();
                String privilege = list.get(i).getPrivilege();
                privilege = PrivilegeUtil.ParsePrivilegeToChinese(privilege);
                String privilegeId = list.get(i).getId();
                map.put("dataSourceName",dataSourceName);
                map.put("dataSourceId",dataSourceId);
                map.put("userGroupName",userGroupName);
                map.put("userGroupId",userGroupId);
                map.put("privilege",privilege);
                map.put("privilegeId",privilegeId);
                PrivilegesHash.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in PrivilegeController::getAllPrivileges", e);
        }


        return PrivilegesHash;
    }

    /**
     * get some datasource information
     * @return
     */
    @RequestMapping(value = "/getDataSourcePrivilege",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ArrayList<HashMap<String,String>> getDataSourcePrivilege(){
        Vector<DataSource> dataSources = null;
        ArrayList<HashMap<String,String>> dataSourceHash = new ArrayList<HashMap<String,String>>();
        HashMap<String,String> map = null;
        try {
            dataSources = DataSourceDao.DataSourceList();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in PrivilegeController::getDataSourcePrivilege", e);
        }

        for (int i = 0; i < dataSources.size(); i++) {
            String dataSourceName = dataSources.get(i).getName();
            String dataSourceId = dataSources.get(i).getId();
            map = new HashMap<String, String>();
            map.put("dataSourceName",dataSourceName);
            map.put("dataSourceId",dataSourceId);
            dataSourceHash.add(map);
        }
        return dataSourceHash;
    }

    /**
     * get some usergroup information
     * @return
     */
    @RequestMapping(value = "/getUserGroupPrivilege",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ArrayList<HashMap<String,String>> getUserGroupPrivilege(){
        Vector<UserGroup> usergroups = null;
        HashMap<String,String> map = null;
        ArrayList<HashMap<String,String>> dataGroupHash = new ArrayList<HashMap<String,String>>();
        try {
            usergroups = userGroupDao.getAllUserGroupList();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in PrivilegeController::getUserGroupPrivilege", e);
        }

        for (int i = 0; i < usergroups.size(); i++) {
            map = new HashMap<String, String>();
            String userGroupName = usergroups.get(i).getName();
            String userGroupId = usergroups.get(i).getId();
            map.put("userGroupName",userGroupName);
            map.put("userGroupId",userGroupId);
            dataGroupHash.add(map);
        }
        return dataGroupHash;
    }

    /**
     * add userGroupPrivilege
     * @param dataSourceSel
     * @param userGroupSel
     * @param userPrivilegeSel
     * @param userGroupName
     * @param dataSourceName
     * @return
     */
    @RequestMapping(value = "/addUserGroupPrivilege",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Boolean addUserGroupPrivilege(@RequestParam("dataSourceSel")String dataSourceSel,
                                        @RequestParam("userGroupSel")String userGroupSel,
                                        @RequestParam("userPrivilegeSel")String userPrivilegeSel,
                                        @RequestParam("userGroupName")String userGroupName,
                                        @RequestParam("dataSourceName")String dataSourceName){
        String PrivilegeSel = "";
        Boolean result = false;
        if(userPrivilegeSel.equals("Access")){
            PrivilegeSel = UserGroupPrivilegeType.Analysis;
        }else if(userPrivilegeSel.equals("NoAccess")){
            PrivilegeSel = UserGroupPrivilegeType.NoAccess;
        }

        try {
            String UserGroupPrivilegeId = privilegeDao.AddUserGroupPrivilege(userGroupSel,userGroupName,dataSourceSel,dataSourceName,PrivilegeSel);
            if(UserGroupPrivilegeId != null || UserGroupPrivilegeId.length() > 0){
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in PrivilegeController::addUserGroupPrivilege", e);
        }
        return result;
    }

    /**
     * delete userGroupPrivilege by id
     * @param userGroupPrivilegeId
     * @return
     */
    @RequestMapping(value = "/delUserGroupPrivilege",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Boolean delUserGroupPrivilege(@RequestParam("privilegeId")String userGroupPrivilegeId){
        Boolean result = false;
        try {
            result = privilegeDao.DelUserGroupPrivilege(userGroupPrivilegeId);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in PrivilegeController::delUserGroupPrivilege", e);
        }
        return result;
    }

    /**
     * modify userGroupPrivilege by id and type
     * @param privilegeId
     * @param privilegeType
     * @return
     */
    @RequestMapping(value = "/updateUserGroupPrivilege",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Boolean updateUserGroupPrivilege(@RequestParam("privilegeId")String privilegeId,
                                            @RequestParam("privilegeType")String privilegeType){
        Boolean result = false;
        try {
            result = privilegeDao.UpdateUserGroupPrivilege(privilegeId,privilegeType);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in PrivilegeController::updateUserGroupPrivilege",e);
        }
        return result;
    }

}
