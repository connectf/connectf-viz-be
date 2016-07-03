package com.vizService.admin.dao;

import com.vc.vizcore.entity.share.UserGroupPrivilege;
import com.vc.vizcore.exception.ExceptionBase;

import java.util.Vector;

/**
 * Created by sonny on 2015/12/15.
 */
public interface PrivilegeDao {

    public Vector<UserGroupPrivilege> getAllPrivilege() throws Exception;

    public String AddUserGroupPrivilege(String userGroupId,String userGroupName, String dataSourceId,String dataSourceName, String privilege) throws Exception;

    public boolean DelUserGroupPrivilege(String userGroupPrivilegeId) throws Exception;

    public boolean UpdateUserGroupPrivilege(String userGroupPrivilegeId, String userGroupPrivilegeType) throws Exception;
}
