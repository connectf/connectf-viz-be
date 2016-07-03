package com.vizService.admin.dao;

import com.vc.vizcore.entity.share.User;
import com.vc.vizcore.entity.share.UserGroup;

import java.util.Vector;

/**
 * Created by sonny on 2015/11/27.
 */
public interface UserDao {

    //get all userGroup that registed
    public Vector<UserGroup> getAllUserGroup() throws Exception;

    //register the user
    public String createUser(String username,
                             String password,
                             String emails,
                             String usergroupId,
                             String description) throws Exception;

    //check user wether registed
    public Boolean checkUserRegisted(String username) throws Exception;

    public Vector<User> getAllUsers() throws Exception;

    public Boolean deleteUser(String userId) throws Exception;

    public int checkUserStatus(String username, String password) throws Exception;
}
