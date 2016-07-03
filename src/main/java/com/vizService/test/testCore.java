package com.vizService.test;
/*
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.io.*;

import org.apache.http.HttpEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
*/
/**
 * Created by sonny on 2015/11/24.
 */
public class testCore {

    /*
    public static void main(String[] args){
        String url = "http://localhost:8080/common/getUserIdByUserName";
        submitPostData(url);
    }

    public static void submitPostData(String url){
        Gson gson = new Gson();

        //step 1 create HttpPost object
        HttpPost httpPost = new HttpPost(url);

        //step 2
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("request1","rhrh");
        jsonObject.addProperty("rerwf","dnvoer");
        params.add(new BasicNameValuePair("request",jsonObject.toString()));
        HttpResponse httpResponse = null;
        try {
                // 设置httpPost请求参数
                httpPost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
                httpResponse = new DefaultHttpClient().execute(httpPost);
                //System.out.println(httpResponse.getStatusLine().getStatusCode());
                if (httpResponse.getStatusLine().getStatusCode() == 200) {
                // 第三步，使用getEntity方法活得返回结果
                String result = EntityUtils.toString(httpResponse.getEntity());
                System.out.println("result:" + result);
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("end url...");
    }*/

}

