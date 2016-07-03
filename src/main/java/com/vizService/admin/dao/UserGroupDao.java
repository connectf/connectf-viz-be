package com.vizService.admin.dao;

import com.vc.vizcore.entity.share.UserGroup;

import java.util.Vector;

/**
 * Created by sonny on 2015/11/27.
 */
public interface UserGroupDao {

    public String createUserGroup(String UGName,String UGDescription) throws Exception;

    public Vector<UserGroup> getAllUserGroupList() throws Exception;

    public Boolean deleteUserGroup(String usergroupId) throws Exception;
}
