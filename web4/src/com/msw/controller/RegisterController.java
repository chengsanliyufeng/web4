package com.shm.controller;

import com.google.gson.Gson;
import com.shm.dao.RegisterDao;
import com.shm.tools.MD5Util;
import com.shm.vo.User;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/Register.do")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setUserName(request.getParameter("userName"));
        user.setPassword(MD5Util.md5(request.getParameter("userPassword")));
        user.setChrName(request.getParameter("chrName"));
        user.setEmailAddress(request.getParameter("emailAddress"));
        user.setProvince(Integer.parseInt(request.getParameter("province")));
        user.setCity(Integer.parseInt(request.getParameter("city")));

        System.out.println("注册："+user);

        RegisterDao registerDao = new RegisterDao();
        int update = registerDao.addUser(user);

        String jsonStr = "success";
        if(update == 0) {
            jsonStr = "注册失败！";
        }

        jsonStr = new Gson().toJson(jsonStr);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(jsonStr);
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
