package com.vizService.admin.service;

import com.vc.vizcore.admin.AdminService;
import com.vc.vizcore.entity.share.UserGroup;
import com.vizService.admin.dao.UserGroupDao;

import java.util.Vector;

/**
 * Created by sonny on 2015/11/27.
 */
public class UserGroupImpl implements UserGroupDao {

    private AdminService as = new AdminService();

    public String createUserGroup(String UGName,String UGDescription) throws Exception {
        return as.registerUserGroup(UGName,UGDescription);
    }

    public Vector<UserGroup> getAllUserGroupList() throws Exception {
        return as.getUserGroups();
    }

    public Boolean deleteUserGroup(String usergroupId) throws Exception {
        return as.unregisterUserGroup(usergroupId);
    }
}
