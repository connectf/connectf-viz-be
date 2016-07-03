package com.vizService.admin.dao;

import com.vc.vizcore.entity.share.DataSet;
import com.vc.vizcore.entity.share.DataSource;

import java.util.Vector;

/**
 * Created by sonny on 2015/11/24.
 */
public interface DataSourceDao {

    //get datasource list
    public Vector<DataSource> DataSourceList() throws Exception;

    //test the datasource connection
    public boolean CheckConn(String type,
                             String ip,
                             int port,
                             String databasename,
                             String username,
                             String password)throws Exception;

    //register the datasource
    public String registerDataSource(String type,
                                      String ip,
                                      int port,
                                      String databasename,
                                      String datasourcename,
                                      String username,
                                      String password) throws Exception;

    //get all datasets from datasource
    public Vector<String> getAllDataSets(String datasourceId) throws Exception;

    //unregister datasource
    public void unregisterDataSource(String datasourceId) throws Exception;

    public boolean registerDataSetsfromDataSource(String datasourceId,Vector<String> dataSets) throws Exception;

    public Vector<DataSet> getAllDataSetandDataSource() throws Exception;

    public Boolean delDataSet(String dataSetId) throws Exception;

    public DataSource getDataSourceById(String dataSourceId) throws Exception;

    public Vector<DataSet> getAllDataSetsById(String dataSourceId) throws Exception;
}
