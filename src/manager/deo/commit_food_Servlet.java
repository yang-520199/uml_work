package manager.deo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "commit_food_Servlet",urlPatterns = {"/commit_food.do"})
@MultipartConfig(location = "D:\\")
public class commit_food_Servlet extends HttpServlet {
    private String getFilename(Part part){
        String fname = null;
        String header = part.getHeader("content-disposition");
        fname = header.substring(header.lastIndexOf("=")+2,header.length()-1);
        return fname;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control","no-cache");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String food_name = request.getParameter("food_name");
        String food_class_name = request.getParameter("food_class");
        String restaurant_name = request.getParameter("restaurant_name");
        String food_description = request.getParameter("description");
        PrintWriter out = response.getWriter();
        int food_class_id = 0;
        int res_id = 0;
        String path = this.getServletContext().getRealPath("./");
        Part p = request.getPart("fileName");
        String message = "";
        if (p.getSize()>2048*2048){
            p.delete();
            message = "文件太大不能上传";
        }else {
            path = path+ "\\tmp\\";
            File f = new File(path);
            if (!f.exists()) {
                f.mkdirs();
            }
            String fname = getFilename(p);
            p.write(path+"\\"+fname);
            message = "上传成功";
            System.out.println(path+"\\"+fname);
        }
        food FOOD = new food();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement sta = con.createStatement();
            String sql = "select FOODCLASS_ID from FOODCLASS where FOODCLASS_NAME='"+food_class_name+"'";
            ResultSet rs = sta.executeQuery(sql);
            while (rs.next()){food_class_id=rs.getInt(1);System.out.println(food_class_id);}
            String sq = "select RES_ID from RESTAURANT where RES_NAME='"+restaurant_name+"'";
            ResultSet rst = sta.executeQuery(sq);
            while (rst.next()){res_id=rst.getInt(1);System.out.println(res_id);}
            FOOD.setFood_name(food_name);
            FOOD.setFoodclass_id(food_class_id);
            FOOD.setFood_photo(getFilename(p));
            FOOD.setRes_id(res_id);
            FOOD.setFood_directions(food_description);
            addFood add_food = new addFood();
            add_food.addfood(FOOD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

//        out.print("<script language='JavaScript'>alert('添加成功');location.href='manager.jsp';</script>");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('"+message+"');");
        out.println("location.href='manager.jsp';</script>");
//        request.setAttribute("message",message);
//        response.sendRedirect("manager.jsp");
//        RequestDispatcher rd = request.getRequestDispatcher("/manager.jsp");
//        rd.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
