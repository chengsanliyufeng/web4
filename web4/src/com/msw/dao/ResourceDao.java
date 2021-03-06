package com.shm.dao;


import com.shm.tools.JdbcUtils;
import com.shm.vo.Resource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: ResourceDao
 * @CreateTime: 2020/10/14 13:46
 * @Description: 用于读取数据库中资源
 */

public class ResourceDao {

    public List<Resource> getResource(String userName) {
        List<Resource> resourceList = new ArrayList<Resource>();
        ResultSet resultSet;
        try {
            resultSet = JdbcUtils.query("SELECT * FROM t_resource WHERE resourceId IN (" +
                    "SELECT  resourceId FROM t_role_resource WHERE roleId IN (" +
                    "SELECT roleId FROM t_user_role WHERE userName = ?))",userName);
            while (resultSet.next()) {
                Resource resource = new Resource();
                resource.setResourceId(resultSet.getInt(1));
                resource.setResourceName(resultSet.getString(2));
                resource.setUrl(resultSet.getString(3));
                resourceList.add(resource);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.err.println("资源在数据库中读取失败！");
        }
        return resourceList;
    }


}
