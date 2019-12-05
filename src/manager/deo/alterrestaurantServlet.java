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

@WebServlet(name = "alterrestaurantServlet",urlPatterns = {"/alter_restaurant.do"})
public class alterrestaurantServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control","no-cache");
        int id = Integer.parseInt(request.getParameter("restaurant_id"));
        String res_name = request.getParameter("restaurant_name");
        String res_address = request.getParameter("restaurant_address");
        String res_phone = request.getParameter("restaurant_phone");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement sta = con.createStatement();
            String sql = "update RESTAURANT set RES_NAME='"+res_name+"',RES_ADRESS='"+res_address+"',RES_PHOTO='"+res_phone+"' where RES_ID="+id;
            sta.executeUpdate(sql);
            response.sendRedirect("manager.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
