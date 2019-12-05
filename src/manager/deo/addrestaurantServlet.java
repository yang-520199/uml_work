package manager.deo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addrestaurantServlet",urlPatterns = {"/addrestaurant.do"})
public class addrestaurantServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-Control","no-cache");
            PrintWriter out = response.getWriter();
            String restaurant_name = request.getParameter("restaurant_name");
            String restaurant_address = request.getParameter("restaurant_address");
            String restaurant_phone = request.getParameter("restaurant_phone");
            restaurant res = new restaurant();
            res.setRes_name(restaurant_name);
            res.setRes_address(restaurant_address);
            res.setRes_photo(restaurant_phone);
            addRetaurant addres = new addRetaurant();
            addres.addrestaurant(res);
            String message = "成功添加:"+restaurant_name;
            out.println("<response>");
            out.println("<message>"+message+"</message>");
            out.println("</response>");
    }
}
