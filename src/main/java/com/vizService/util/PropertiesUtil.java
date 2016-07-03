package com.vizService.util;

import java.io.*;
import java.util.*;

/**
 * Created by sonny on 2016/5/20.
 */
public class PropertiesUtil {

    public Map<String,String> readPropertiesFromlocal(InputStream filePath) {
        Properties pps = new Properties();
//        InputStream in = this.getClass().getResourceAsStream(filePath);
        try {
            pps.load(filePath);
            filePath.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Enumeration en = pps.propertyNames(); //得到配置文件的名字
        Map<String,String> params = new HashMap<String,String>();
        while(en.hasMoreElements()) {
            String strKey = (String) en.nextElement();
            String strValue = pps.getProperty(strKey);
            params.put(strKey,strValue);
        }

        return params;
    }
}
