package com.vizService.admin.service;

import com.vc.vizcore.admin.AdminService;
import com.vc.vizcore.entity.share.UserGroupPrivilege;
import com.vizService.admin.dao.PrivilegeDao;

import java.util.Vector;

/**
 * Created by sonny on 2015/12/15.
 */
public class PrivilegeImpl implements PrivilegeDao {

    private AdminService service = new AdminService();

    public Vector<UserGroupPrivilege> getAllPrivilege() throws Exception {
        return service.getUserGroupPrivileges();
    }

    public String AddUserGroupPrivilege(String userGroupId,String userGroupName, String dataSourceId,String dataSourceName, String privilege) throws Exception {
        return service.registerUserGroupPrivilege(userGroupId,userGroupName,dataSourceId,dataSourceName,privilege);
    }

    public boolean DelUserGroupPrivilege(String userGroupPrivilegeId) throws Exception {
        return service.unregisterUserGroupPrivilege(userGroupPrivilegeId);
    }

    public boolean UpdateUserGroupPrivilege(String userGroupPrivilegeId, String userGroupPrivilegeType) throws Exception {
        return service.updateUserGroupPrivilege(userGroupPrivilegeId,userGroupPrivilegeType);
    }

}
