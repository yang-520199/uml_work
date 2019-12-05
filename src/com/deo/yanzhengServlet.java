package com.deo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "yanzhengServlet",urlPatterns = {"/yanzheng.do"})
public class yanzhengServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        Statement sta = null;
        ResultSet rs = null;
        String message = null;
        PreparedStatement pstm=null;
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control","no-cache");
        String username = request.getParameter("username");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("驱动启动失败");
        }
        try {
            con=DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            sta = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String sql = "select * from userr where USERR_NAME='"+username+"'";
            rs = sta.executeQuery(sql);
            if(rs.next()){

                message = "用户名已经存在";
                System.out.println(message);
            }
            else {

                message = "用户名可以使用";
                System.out.println(message);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(message);
        PrintWriter out = response.getWriter();
        out.println("<response>");
        out.println("<message>"+message+"</message>");
        out.println("</response>");
    }
}
