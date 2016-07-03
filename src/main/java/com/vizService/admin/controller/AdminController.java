package com.vizService.admin.controller;

import com.vizService.admin.dao.DataSourceDao;
import com.vizService.admin.service.DataSourceImpl;
import com.vizService.util.UserTools;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.StringMultipartFileEditor;

import javax.servlet.http.HttpSession;

/**
 * Created by sonny on 2015/11/13.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    private DataSourceDao addDataSource =new DataSourceImpl();
    private final Logger logger = Logger.getLogger(AdminController.class);
    private UserTools userTools;

    //数据源列表
    @RequestMapping(value = "/datasourcelist",method = RequestMethod.GET)
    public String getDataSourceList(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("datasourcelist");
            return "datasourcelist";
        }else {
            return "login";
        }

    }

    //新增数据源
    @RequestMapping(value = "/adddatasource",method = RequestMethod.GET)
    public String addDataSource(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("adddatasource");
            return "adddatasource";
        }else {
            return "login";
        }

    }

    //创建用户
    @RequestMapping(value = "/createuser",method = RequestMethod.GET)
    public String createUser(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("createuser");
            return "createuser";
        }else {
            return "login";
        }

    }

    //创建用户
    @RequestMapping(value = "/createusergroup",method = RequestMethod.GET)
    public String createUserGroup(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("createusergroup");
            return "createUserGoup";
        }else {
            return "login";
        }

    }

    //用户列表
    @RequestMapping(value = "/userlist",method = RequestMethod.GET)
    public String getUserList(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("userlist");
            return "userlist";
        }else {
            return "login";
        }

    }

    //用户组列表
    @RequestMapping(value = "/usergrouplist",method = RequestMethod.GET)
    public String getUserGroupList(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("usergrouplist");
            return "usergrouplist";
        }else {
            return "login";
        }

    }

    //填写数据源信息
    @RequestMapping(value = "/datasourceinfo",method = RequestMethod.GET)
    public String getDataSourceInfo(@RequestParam("type")String type,HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            session.setAttribute("dbtype",type);
            logger.info("datasourceinfo");
            return "datasourceinfo";
        }else {
            return "login";
        }

    }

    //显示数据集列表
    @RequestMapping(value = "/datasetlist",method = RequestMethod.GET)
    public String getDataSetList(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("datasetlist");
            return "datasetlist";
        }else {
            return "login";
        }

    }

    //显示数据集下一步列表
    @RequestMapping(value = "/datasetlistnext",method = RequestMethod.GET)
    public String getDataSetListNext(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("datasetlistnext");
            return "datasetlistnext";
        }else {
            return "login";
        }

    }

    @RequestMapping(value = "/adminprivilege",method = RequestMethod.GET)
    public String gotoPrivilege(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("adminprivilege");
            return "adminprivilege";
        }else {
            return "login";
        }

    }

    @RequestMapping(value = "/gotodataSourcelist",method = RequestMethod.GET)
    public String gotoDataSourcelist(HttpSession session){
        Boolean result = userTools.checkUserSession(session);
        if (result){
            logger.info("gotodataSourcelist");
            return "datasourceop";
        }else {
            return "login";
        }

    }
}
