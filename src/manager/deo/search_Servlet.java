package manager.deo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "search_Servlet",urlPatterns = {"/search.do"})
public class search_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control","no-cache");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        String search_name = request.getParameter("search_name");
        int search_restaurant = Integer.parseInt(request.getParameter("search_restaurant"));
        int search_class = Integer.parseInt(request.getParameter("search_class"));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement statement = connection.createStatement();
            String sql = "SELECT * from FOOD where RES_ID="+search_restaurant+" AND FOODCLASS_ID="+search_class+" AND FOOD_NAME='"+search_name+"'";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()){
                HttpSession session=request.getSession();
                session.setAttribute("food_name",rs.getString(2));
                session.setAttribute("food_photo",rs.getString(4));
                session.setAttribute("food_description",rs.getString(6));
                response.sendRedirect("search_show.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
