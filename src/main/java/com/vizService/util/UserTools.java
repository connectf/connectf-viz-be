package com.vizService.util;

import javax.servlet.http.HttpSession;

/**
 * Created by sonny on 2015/12/8.
 */
public class UserTools {

    public static Boolean checkUserSession(HttpSession session){
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        if(username != null && password != null && username != "" && password != ""){
            if (session.getAttribute("username") != null && session.getAttribute("password") != null
                    && session.getAttribute("username") != "" && session.getAttribute("password") != ""){
                return true;
            }else {
                return false;
            }
        }else{
            return false;
        }
    }
}
