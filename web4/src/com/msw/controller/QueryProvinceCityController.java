package com.shm.controller;

import com.google.gson.Gson;
import com.shm.dao.ProvinceCiteDao;
import com.shm.vo.City;
import com.shm.vo.Province;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;



@WebServlet("/queryProvinceCity.do")
public class QueryProvinceCityController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String provinceCode = request.getParameter("provinceCode");
        String jsonStr = "";
        ProvinceCiteDao provinceCiteDao = new ProvinceCiteDao();
        if(provinceCode == null) {
            List<Province> list = provinceCiteDao.queryProvince();
            jsonStr = new Gson().toJson(list);
        } else {
            List<City> list = provinceCiteDao.queryCity(Integer.parseInt(provinceCode));
            jsonStr = new Gson().toJson(list);
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(jsonStr);
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
