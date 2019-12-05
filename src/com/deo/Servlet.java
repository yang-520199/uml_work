package com.deo;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

import com.deo.user;
import com.deo.userdao;

@WebServlet(name = "Servlet", urlPatterns = {"/denglu.do"})
public class Servlet extends javax.servlet.http.HttpServlet {
    Connection con = null;
    Statement sta = null;
    ResultSet rt;

    public Servlet() throws SQLException {
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        denglu login = new denglu();
        login.denglu(username, password);
        if (login.flag == 1) {
            RequestDispatcher rt = request.getRequestDispatcher("/index.html");
            rt.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        user user = new user();
        userdao dao = new userdao();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("驱动启动失败");
        }
        try {
            con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            String sq = "SELECT count(*) FROM userr";
            sta = con.createStatement();
            rt = sta.executeQuery(sq);
            rt.next();

            int row = rt.getInt(1);
            int usrid = 1706300000 + row;
            user.setUserid(usrid);
            String name = request.getParameter("username");
            user.setUsername(name);
            user.setPassword(request.getParameter("password"));
            user.setSex(request.getParameter("sex"));
            user.setRealname(request.getParameter("realname"));
            user.setEmail(request.getParameter("email"));
            dao.adduser(user);
            String message = "插入成功";
            request.setAttribute("result", message);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
