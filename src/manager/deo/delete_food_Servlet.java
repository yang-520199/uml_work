package manager.deo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
@javax.servlet.annotation.WebServlet(name = "delete_food_Servlet",urlPatterns = {"/delete_food.do"})
public class delete_food_Servlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            String sql = "delete from FOOD where FOOD_ID='"+id+"'";
            Statement sta = con.createStatement();
            sta.executeUpdate(sql);
            response.sendRedirect("manager.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
