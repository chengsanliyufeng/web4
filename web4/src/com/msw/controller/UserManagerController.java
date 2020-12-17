package com.shm.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shm.dao.UserDao;
import com.shm.dao.UserManagerDao;
import com.shm.tools.JsonMapUtils;
import com.shm.vo.User;
import com.shm.vo.UserPage;
import com.shm.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * function: 用户管理操作（管理员）
 */
@WebServlet("/userManager.do")
public class UserManagerController extends HttpServlet {
    UserManagerDao userDao = new UserManagerDao();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String query = request.getParameter("queryParams");
        String page = request.getParameter("pageParams");
        System.out.println("查询参数:" +query);
        System.out.println("分页参数:" +page);
        //将json字符串参数值转换为java对象
        Gson gson = new GsonBuilder().serializeNulls().create();
        UserPage userPage = gson.fromJson(page,UserPage.class);

        UserVO user = new UserVO();
        if (query != null){
             user = gson.fromJson(query, UserVO.class);
        }
        //调用dao执行处理
        List<UserVO> rows = userDao.query(user, userPage);
        int total = userDao.count(user);

        //转换为json数据
        Map<String,Object> mapReturn = new HashMap<>();
        mapReturn.put("rows",rows);
        mapReturn.put("total",total);

        //调用陪你过json转换工具类 向页面响应json字符串
        JsonMapUtils.getJson(mapReturn,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/main/userManager.jsp").forward(request, response);
   }
}
