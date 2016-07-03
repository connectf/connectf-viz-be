package com.vizService.admin.service;

import com.vc.vizcore.admin.AdminService;
import com.vc.vizcore.common.UserRole;
import com.vc.vizcore.entity.share.User;
import com.vc.vizcore.entity.share.UserGroup;
import com.vizService.admin.dao.UserDao;
import com.vizService.util.PropertiesUtil;

import java.sql.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Created by sonny on 2015/11/27.
 */
public class UserImpl implements UserDao {

    private AdminService as = new AdminService();


    //get all usergroup that registed
    public Vector<UserGroup> getAllUserGroup() throws Exception {
        return as.getUserGroups();
    }

    //create user
    public String createUser(String username, String password, String emails, String usergroupId, String description) throws Exception {
        return as.registerUser(username,password,emails,description,UserRole.UserRole,usergroupId);
    }

    public Boolean checkUserRegisted(String username) throws Exception {
        return as.checkUser(username);
    }

    public Vector<User> getAllUsers() throws Exception {
        return as.getUsers();
    }

    public Boolean deleteUser(String userId) throws Exception {
        return as.unregisterUser(userId);
    }

    //login status for user
    public int checkUserStatus(String username, String password){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        int result = -1;
        Map<String,String> params = new HashMap<String,String>();
        PropertiesUtil pu = new PropertiesUtil();
        String sql = "select name,password, enabled from user where name= '"+username+"' and password='"+password+"' and userRole='ROLE_ADMIN'";
        try {
            params = pu.readPropertiesFromlocal(Thread.currentThread().getContextClassLoader().getResourceAsStream("jdbc.properties"));
            Class.forName(params.get("jdbc.driverClassName"));
            //"jdbc:mysql://localhost:3306/javademo?user=root&password=root&useUnicode=true&characterEncoding=UTF8";
            conn = DriverManager.getConnection(params.get("jdbc.url"),params.get("jdbc.username"),params.get("jdbc.password"));
            stmt = conn.createStatement() ;
            rs = stmt.executeQuery(sql) ;
            rs.last();
            if (rs.getRow() > 0){
                result = rs.getRow();
            }else{
                result = -1;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if (rs != null){
                    rs.close();
                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(stmt != null){
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(conn != null){
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
