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

@WebServlet(name = "alter_food_classServlet",urlPatterns = {"/alter_food_class.do"})
public class alter_food_classServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control","no-cache");
        response.setContentType("text/html");
        int id = Integer.parseInt(request.getParameter("food_class_id"));
        String food_class_name = request.getParameter("food_class_name");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement sta = con.createStatement();
            String sql = "update FOODCLASS set FOODCLASS_NAME='"+food_class_name+"' where FOODCLASS_ID="+id;
            sta.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
