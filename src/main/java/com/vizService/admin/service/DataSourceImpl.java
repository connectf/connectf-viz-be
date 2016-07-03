package com.vizService.admin.service;

import com.vc.vizcore.admin.AdminService;
import com.vc.vizcore.entity.share.DataSet;
import com.vc.vizcore.entity.share.DataSource;
import com.vizService.admin.dao.DataSourceDao;

import java.util.HashMap;
import java.util.Vector;

/**
 * Created by sonny on 2015/11/24.
 */
public class DataSourceImpl implements DataSourceDao {

    private AdminService as = new AdminService();

    //get datasource list
    public Vector<DataSource> DataSourceList() throws Exception{
        Vector<DataSource> dataSources = as.getDataSources();
        return dataSources;
    }

    //test connection
    public boolean CheckConn(String type,
                             String ip,
                             int port,
                             String databasename,
                             String username,
                             String password) throws Exception {
        return as.verifyDataSource(
                type,
                ip,
                port,
                databasename,
                username,
                password);
    }

    //register the datasource
    public String registerDataSource(String type,
                                      String ip,
                                      int port,
                                      String databasename,
                                      String datasourcename,
                                      String username,
                                      String password) throws Exception {
        return as.registerDataSource(type,ip,port,databasename,username,password,datasourcename,"test",new HashMap<String, String>());

    }

    //get all datasets from the datasource
    public Vector<String> getAllDataSets(String datasourceId) throws Exception {
        return as.getDataSetCandidateNames4DataSource(datasourceId);
    }

    //ungister datasource
    public void unregisterDataSource(String datasourceId) throws Exception {
        as.unregisterDataSource(datasourceId);
    }

    //register dataset from datasource
    public boolean registerDataSetsfromDataSource(String datasourceId, Vector<String> dataSets) throws Exception {
        return as.registerDataSets(datasourceId,dataSets);
    }

    public Vector<DataSet> getAllDataSetandDataSource() throws Exception {
        return as.getDataSets();
    }

    public Boolean delDataSet(String dataSetId) throws Exception {
        return as.unregisterDataSet(dataSetId);
    }

    public DataSource getDataSourceById(String dataSourceId) throws Exception {
        return as.getDataSource(dataSourceId);
    }

    /**
     * getAllDataSetsById
     * @param dataSourceId
     * @return
     * @throws Exception
     */
    public Vector<DataSet> getAllDataSetsById(String dataSourceId) throws Exception {
        return as.getDataSets(dataSourceId);
    }


}
