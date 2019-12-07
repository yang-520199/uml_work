package com.deo;

import java.io.IOException;
import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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
        response.setCharacterEncoding("UTF-8");
//        response.setHeader("Cache-Control","no-cache");
//        response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        denglu login = new denglu();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement sta = con.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        if (username.equals("admin")){
            if (password.equals("admin")){
                response.sendRedirect("manager.jsp");
            }
        }
        else {
            login.denglu(username, password);
            if (login.flag == 1) {
                var message = "登录成功,欢迎"+username+"用户登录";
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
                    Statement sta = con.createStatement();
                    String sql = "select * from USERR where USERR_NAME='"+username+"'";
                    ResultSet rs = sta.executeQuery(sql);
                    while (rs.next()){
                        HttpSession session = request.getSession();
                        session.setAttribute("name",username);
                        session.setAttribute("sex",rs.getString(4));
                        session.setAttribute("real_name",rs.getString(5));
                        session.setAttribute("email",rs.getString(6));
                        session.setAttribute("message",message);
                        response.sendRedirect("display.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
//                HttpSession session = request.getSession();
//                session.setAttribute("name",username);
//                session.setAttribute("message",message);
//                response.sendRedirect("display.jsp");

            } else {
                String message = "登录失败,请重新登录";
                HttpSession session = request.getSession();
                session.setAttribute("message",message);
                response.sendRedirect("display.jsp");
            }
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
            String message = "注册成功";
            HttpSession session = request.getSession();
            session.setAttribute("message_register",message);
            response.sendRedirect("display.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
