package com.shm.dao;

import com.shm.tools.JdbcUtils;
import com.shm.vo.User;
import com.shm.vo.UserPage;


import java.nio.channels.NonWritableChannelException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public User getUser(String name) {
        User user = new User();
        ResultSet resultSet;
        try {
            resultSet = JdbcUtils.query("select * from t_user where userName=?", name);
            while (resultSet.next()) {
                user.setUserName(resultSet.getString(1));
                user.setPassword(resultSet.getString(2));
                user.setChrName(resultSet.getString(3));
                user.setEmailAddress(resultSet.getString(4));
                user.setProvince(resultSet.getInt(5));
                user.setCity(resultSet.getInt(6));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.err.println("查询用户失败！");
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByEmail(String email) {
        User user = new User();
        ResultSet resultSet;
        try {
            resultSet = JdbcUtils.query("select * from t_user where emailAddress=?", email);
            while (resultSet.next()) {
                user.setUserName(resultSet.getString(1));
                user.setPassword(resultSet.getString(2));
                user.setChrName(resultSet.getString(3));
                user.setEmailAddress(resultSet.getString(4));
                user.setProvince(resultSet.getInt(5));
                user.setCity(resultSet.getInt(6));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.err.println("查询用户失败！");
            e.printStackTrace();
        }
        return user;
    }

}
