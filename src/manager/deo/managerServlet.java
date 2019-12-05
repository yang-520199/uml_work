package manager.deo;
import manager.deo.foodclass;
import manager.deo.addfoodclass;
import org.jetbrains.annotations.NotNull;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "managerServlet",urlPatterns = {"/manager.do"})
public class managerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control","no-cache");
        PrintWriter out = response.getWriter();
        String foodclassname = request.getParameter("foodclass");
        try {
            foodclass fc = new foodclass();
            fc.setFoodclass_name(foodclassname);
            addfoodclass add = new addfoodclass();
            add.addclass(fc);
            String message = "成功添加"+foodclassname;
            out.println("<response>");
            out.println("<message>"+message+"</message>");
            out.println("</response>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
