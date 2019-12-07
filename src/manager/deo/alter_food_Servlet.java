package manager.deo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "alter_food_Servlet",urlPatterns = {"/alter_food.do"})
public class alter_food_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control","no-cache");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");

        String description = request.getParameter("description");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement sta = con.createStatement();
            String sql = "update food set FOOD_NAME='"+name+"',FOOD_DIRECTIONS='"+description+"' where FOOD_ID="+id;
            sta.executeUpdate(sql);
            response.sendRedirect("manager.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
