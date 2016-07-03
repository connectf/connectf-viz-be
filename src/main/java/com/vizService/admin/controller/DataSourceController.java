package com.vizService.admin.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.vc.vizcore.common.DataSourceType;
import com.vc.vizcore.entity.share.DataSet;
import com.vc.vizcore.entity.share.DataSource;
import com.vizService.admin.dao.DataSourceDao;
import com.vizService.admin.service.DataSourceImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Vector;


/**
 * Created by sonny on 2015/11/24.
 */
@Controller
@RequestMapping(value = "/admin")
public class DataSourceController {

    private DataSourceDao addDataSource =new DataSourceImpl();
    private Gson gson = new Gson();
    private final Logger logger = Logger.getLogger(DataSourceController.class);

    /**
     * get all dataSOurce
     * @return
     */
    @RequestMapping(value = "/showdatasourcelist",method = RequestMethod.POST)
    @ResponseBody
    public String DataSourceGetList(){
        Vector<DataSource> vectorlist = null;
        try {
            vectorlist = addDataSource.DataSourceList();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::showdatasourcelist",e);
        }
        System.out.println(gson.toJson(vectorlist));
        return gson.toJson(vectorlist);
    }


    /**
     * getdataSources
     * @return
     */
    @RequestMapping(value = "/getdatasources",method = RequestMethod.POST)
    @ResponseBody
    public String getDataSources(){
        Vector<DataSource> vectorlist = null;
        JsonObject jsonobj = null;
        JsonArray jsonArr = new JsonArray();
        try {
            vectorlist = addDataSource.DataSourceList();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::getdatasources",e);
        }


        for (int i = 0; i < vectorlist.size(); i++) {
            jsonobj = new JsonObject();
            jsonobj.addProperty("dataSourceName",vectorlist.get(i).getName());
            jsonobj.addProperty("dataSourceId",vectorlist.get(i).getId());
            jsonArr.add(jsonobj);
        }

        return gson.toJson(jsonArr);
    }


    /**
     * test datasource connection
     * @param ip
     * @param port
     * @param username
     * @param password
     * @param datasourcename
     * @param databasename
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/showcheckdatasource",method = RequestMethod.POST)
    @ResponseBody
    public String DataSourceCheckConn(@RequestParam(value = "ip") String ip,
                            @RequestParam(value = "port") String port,
                            @RequestParam(value = "username") String username,
                            @RequestParam(value = "password") String password,
                            @RequestParam(value = "datasourcename") String datasourcename,
                            @RequestParam(value = "databasename") String databasename,
                            HttpSession httpSession){
        Boolean result = null;
        String info = "";
        String type = httpSession.getAttribute("dbtype").toString();
        System.out.println(type+"="+ip+"="+port+"="+username+"="+password+"="+databasename+"="+datasourcename);
        if(type.equals("MySQL")){
            type = DataSourceType.MySQL;
        }
        try {
            result = addDataSource.CheckConn(type, ip, Integer.parseInt(port), databasename, username, password);
            if (result){
                info = "true";
            }else if(!result){
                info = "false";
            }
            return info;
        }catch(NullPointerException e){
            e.printStackTrace();
            logger.error("error in the function DataSourceController::getdatasources with NullPointerException",e);
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::getdatasources with Exception",e);
            return "false";
        }
    }

    /**
     * save datasourceinfo to session
     * @param ip
     * @param port
     * @param username
     * @param password
     * @param databasename
     * @param datasourcename
     * @param session
     * @return
     */
    @RequestMapping(value = "/showsubmitdatasourceinfo",method = RequestMethod.POST)
    @ResponseBody
    public String DataSourceSaveinfo(@RequestParam(value = "ip")String ip,
                                     @RequestParam(value = "port")String port,
                                     @RequestParam(value = "username")String username,
                                     @RequestParam(value = "password")String password,
                                     @RequestParam(value = "databasename")String databasename,
                                     @RequestParam(value = "datasourcename")String datasourcename,
                                     HttpSession session){
        Boolean result = null;
        String type = session.getAttribute("dbtype").toString();
        if(type.equals("MySQL")){
            type = DataSourceType.MySQL;
        }
        try {
            result = addDataSource.CheckConn(type, ip, Integer.parseInt(port), databasename, username, password);
            if(result){
                String dataSourceId = addDataSource.registerDataSource(type,ip,Integer.parseInt(port),databasename,datasourcename,username,password);
                System.out.println(dataSourceId);
                session.setAttribute("dataSourceId",dataSourceId);
                if(dataSourceId != null){
                    return "1"; //register the datasource successfully
                }else{
                    return "0"; //register the datasource failed
                }
            }else{
                return "-1"; // connect the database failed
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::showsubmitdatasourceinfo with Exception",e);
            return "-2";  //Exeption
        }

    }

    /**
     * get datasets from datasource
     * @param session
     * @return
     */
    @RequestMapping(value = "/showgetdatasets",method = RequestMethod.POST)
    @ResponseBody
    public String DataSetGetDataSets(HttpSession session){
        String datasourceId = session.getAttribute("dataSourceId").toString();
        System.out.println(datasourceId);
        Vector<String> datasets = null;
        try {
            datasets = addDataSource.getAllDataSets(datasourceId);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::showgetdatasets with Exception",e);
        }
        return gson.toJson(datasets);
    }

    /**
     * unregister datasource
     * @param session
     * @return
     */
    @RequestMapping(value = "/showunregisterdatasource",method = RequestMethod.POST)
    @ResponseBody
    public String DataSourceUnregister(HttpSession session){
        String datasourceId = session.getAttribute("dataSourceId").toString();
        try {
            addDataSource.unregisterDataSource(datasourceId);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::showunregisterdatasource",e);
        }
        return "true";
    }

    /**
     * unregisterDatasourceId
     * @param dataSourceId
     * @return
     */
    @RequestMapping(value = "/unregisterDatasourceById",method = RequestMethod.POST)
    @ResponseBody
    public String unregisterDatasourceById(@RequestParam("dataSourceId")String dataSourceId){
        try {
            addDataSource.unregisterDataSource(dataSourceId);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::unregisterDatasourceById",e);
        }
        return "true";
    }

    /**
     * register dataset
     * @param param
     * @param session
     * @return
     */
    @RequestMapping(value = "/registerdataset",method = RequestMethod.POST)
    @ResponseBody
    public String DataSetRegister(@RequestParam(value = "param") String param,HttpSession session){
        Vector<String> datasetnames = new Vector<String>();
        Boolean result = null;
        String datasourceId = session.getAttribute("dataSourceId").toString();
        String[] params = param.split(",");
        for (String name:params) {
            datasetnames.add(name);
        }
        try {
            result = addDataSource.registerDataSetsfromDataSource(datasourceId,datasetnames);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::registerdataset",e);
        }

        return String.valueOf(result);
    }

    /**
     * show datasets and datasourceName
     * @return
     */
    @RequestMapping(value = "/datasetNext",method = RequestMethod.POST)
    @ResponseBody
    public String DataSetsNext(HttpSession session){
        Vector<DataSet> list = new Vector<DataSet>();
        JsonArray jsonarr = null;
        JsonObject jsonObj = null;
        String datasourceId = session.getAttribute("dataSourceId").toString();
        DataSource ds = null;
        String dataSourceName = null;
        try {
            ds = addDataSource.getDataSourceById(datasourceId);
            dataSourceName = ds.getName();
            list = addDataSource.getAllDataSetsById(datasourceId);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::datasetNext",e);
        }
        jsonarr = new JsonArray();
        for (int i = 0; i < list.size(); i++) {
            jsonObj = new JsonObject();
            DataSet dataset = list.get(i);
            jsonObj.addProperty("DataSourceId", dataset.getDataSourceId());
            jsonObj.addProperty("DataSourceName", dataset.getDataSourceName());
            jsonObj.addProperty("DataSetName", dataset.getName());
            jsonObj.addProperty("DataSetId", dataset.getId());
            jsonObj.addProperty("DataSetType", dataset.getDataSetType());
            jsonarr.add(jsonObj);
        }
        System.out.println(jsonarr);
        return jsonarr.toString();
    }

    /**
     *get all the dataset and datasource
     * @return
     */
    @RequestMapping(value = "/datasetanddatasource",method = RequestMethod.POST)
    @ResponseBody
    public String DataSetAndDataSource(){
        Vector<DataSet> list = null;
        try {
            list = addDataSource.getAllDataSetandDataSource();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::datasetanddatasource",e);
        }
        return gson.toJson(list);
    }

    /**
     * delete the dataset by datasetId
     * @param dataSetId
     * @return
     */
    @RequestMapping(value = "/deletedataset",method = RequestMethod.POST)
    @ResponseBody
    public String DeleteDataSet(@RequestParam(value = "dataSetId")String dataSetId){
        Boolean result = null;
        try {
            result = addDataSource.delDataSet(dataSetId);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error in the function DataSourceController::deletedataset",e);
        }
        return gson.toJson(result);
    }
}
