package com.shm.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shm.dao.RegisterDao;
import com.shm.dao.UserManagerDao;
import com.shm.tools.JsonMapUtils;
import com.shm.tools.MD5Util;
import com.shm.vo.User;
import com.shm.vo.UserPage;
import com.shm.vo.UserVO;

import javax.naming.Name;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/userCRUDServlet.do")
public class UserCRUDServlet extends HttpServlet {
    private UserManagerDao userManagerDao = new UserManagerDao();
    private RegisterDao registerDao = new RegisterDao();
    private String ids = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取操作符
        String oper = req.getParameter("oper");
        System.out.println("操作符：" + oper);
        if ("delete".equals(oper)) {
            //执行删除方法
            delete(req, resp);
        }else if ("update".equals(oper)){
            //执行修改方法
            update(req, resp);
        }else if ("getUser".equals(oper)){
            getUser(req,resp);
        }else if ("add".equals(oper)){
            addUser(req,resp);
        }
        else {
            System.out.println("没有该操作符！");
        }

    }

    /**
     * 添加一个用户
     * @param request
     * @param resp
     */
    private void addUser(HttpServletRequest request, HttpServletResponse resp) throws IOException {

        String updateUser = request.getParameter("updateUser");

        //将json字符串参数值转换为java对象
        Gson gson = new GsonBuilder().serializeNulls().create();
        User user = gson.fromJson(updateUser,User.class);
        System.out.println(user);

        System.out.println("添加："+user);

        RegisterDao registerDao = new RegisterDao();
        Map<String, Object> map = new HashMap<>();

        int i = registerDao.addUser(user);
        if (i > 0) {
            //修改成功
            map.put("msg", "添加成功！");
            map.put("code", 0);
        } else {
            //修改失败
            map.put("msg", "添加失败！");
            map.put("code", 1);
        }
        JsonMapUtils.getJson(map,resp);
    }

    /**
     * 查看当前用户信息
     * @param req
     * @param resp
     */
    private void getUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ids = req.getParameter("ids");
        UserVO user = userManagerDao.getUser(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("user",user);
        //转换为json数据
        JsonMapUtils.getJson(map,resp);
    }

    /**
     * 修改一用户信息
     * @param request
     * @param response
     */
    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String updateUser = request.getParameter("updateUser");
        //解析Json对象
        Gson gson =  new GsonBuilder().serializeNulls().create();
        User user = gson.fromJson(updateUser, User.class);
        System.out.println("修改用户信息："+user);
        Map<String, Object> map = new HashMap<>();
        //admin为管理员账号 不能被删除
        if ("admin".equals(ids)) {
            map.put("info", "admin为管理员账号 不能被修改");
            map.put("code", 2);
        } else {
            int i = userManagerDao.updateUser(user, ids);
            if (i > 0) {
                //修改成功
                map.put("info", "修改成功！");
                map.put("code", 0);
            } else {
                //修改失败
                map.put("info", "修改失败！");
                map.put("code", 1);
            }
        }
        //转换为json数据
        JsonMapUtils.getJson(map,response);
    }
    /**
     * 删除一个用户
     *
     * @param request
     * @param response
     */
    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("ids");

        Map<String, Object> map = new HashMap<>();
        //admin为管理员账号 不能被删除
        if ("admin".equals(username)) {
            map.put("info", "admin为管理员账号 不能被删除");
            map.put("code", 2);
        } else {
            int i = userManagerDao.deleteUser(username);
            if (i > 0) {
                //删除成功
                map.put("info", "删除成功！");
                map.put("code", 0);
            } else {
                //删除失败
                map.put("info", "删除失败！");
                map.put("code", 1);
            }
        }
        //转换为json数据
        JsonMapUtils.getJson(map,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
