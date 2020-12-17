package com.shm.tools;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class JsonMapUtils {

    public static void getJson(Object o, HttpServletResponse response) throws IOException {
        //转换为json数据
        Gson gson = new Gson();
        String toJson = gson.toJson(o);
        //字符流输出
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        System.out.println(toJson);
        out.print(toJson);
        out.flush();
        out.close();
    }

}
