package com.vizService.util;

import com.vizService.util.*;

/**
 * Created by sonny on 2015/12/17.
 */
public class PrivilegeUtil {

    public static String ParsePrivilegeToChinese(String flag){
        String result = null;
        if (flag.equals(PrivilegeType.Analysis)) {
            result = Constant.Acccess;
        } else if (flag.equals(PrivilegeType.NoAccess)) {
            result = Constant.NoAcccess;
        }
        return result;
    }

    public static  String ParsePrivilegeToEnglish(String flag){
        String result = null;
        if (flag.equals(Constant.Acccess)) {
            result = PrivilegeType.Analysis;
        } else if (flag.equals(Constant.NoAcccess)) {
            result = PrivilegeType.NoAccess;
        }
        return result;
    }
}
