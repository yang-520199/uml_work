package com;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;
@WebServlet(name = "LoginSerlet",urlPatterns =
        {"/LoginSerlet"})

public class LoginSerlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password =request.getParameter("password");
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        out.println("<! DOCTYPE html>");
//        out.println("<html><body>");
//        if("admin".equals(username)&&"admin".equals(password)){
////            out.println("登录成功！欢迎您，"+username);
//            RequestDispatcher rd =request.getRequestDispatcher("/1122.jsp");
//            rd.forward(request,response);
//        }
//        else {
////            out.println("对不起，您的用户名或者密码错误。");
//            RequestDispatcher rd =request.getRequestDispatcher("/111.jsp");
//            rd.forward(request,response);
//        }
//        out.println("</body></html>");
        request.setCharacterEncoding("UTF-8");
        String education=request.getParameter("education");
//        String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"UTF-8");
        String name =request.getParameter("name");
        String tikettype = request.getParameter("tikettype");
        response.setContentType("text/html;charset=UTF-8");
        Connection con;
        Statement sql;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("驱动失败");
        }
        try {

            con= DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            sql = con.createStatement();
            String sq =" insert into person values('"+name+"','"+education+"')";
//            String sq =" insert into person values('a','b')";
            sql.executeUpdate(sq);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("连接失败");
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<! DOCTYPE html>");
        out.println("<html><body>ok"+tikettype);
        out.println("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
}
