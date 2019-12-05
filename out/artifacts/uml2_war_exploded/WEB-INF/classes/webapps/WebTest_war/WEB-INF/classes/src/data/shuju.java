package data;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;


@WebServlet(name = "shuju",urlPatterns = {"/shuju"})
public class shuju extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String education=request.getParameter("education");
//        String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"UTF-8");
        String name =request.getParameter("name");
        String department = request.getParameter("department");
        String area = request.getParameter("area");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String identity = request.getParameter("identity");
        String articlenumber = request.getParameter("articlenumber");
        String articletitle = request.getParameter("articletitle");
        String page = request.getParameter("page");
        String resgisterFee = request.getParameter("resgisterFee");
        String extendfee = request.getParameter("extendfee");
        String sum = request.getParameter("sum");
        String tikettype = request.getParameter("tikettype");
        String departmentname = request.getParameter("departmentname");
        String pastenumber = request.getParameter("pastenumber");
        String departmentname2 = request.getParameter("departmentname2");
        String pastenumber2 = request.getParameter("pastenumber2");
        String adress  = request.getParameter("adress");
        String phonenumber = request.getParameter("phonenumber");
        String bankname = request.getParameter("bankname");
        String banknumber =request.getParameter("banknumber");
        response.setContentType("text/html;charset=UTF-8");
        Connection con;
        Statement sql;
        ResultSet rs;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Çý¶¯Ê§°Ü");
        }
        try {

            con= DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            sql = con.createStatement();
            String sd = "select user_id from  customer where create_by='"+name+"'";
            rs = sql.executeQuery(sd);
            String yonghuid = request.getParameter("userid");
            System.out.println(yonghuid);
            if("0".equals(identity)&&"1".equals(tikettype)){
                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','"+articlenumber+"','"+articletitle+"','"+page+"','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname+"','"+pastenumber+"','','','','')";
                sql.executeUpdate(sa);
            }
            else if("0".equals(identity)&&"2".equals(tikettype)){
                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','"+articlenumber+"','"+articletitle+"','"+page+"','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname2+"','"+pastenumber2+"','"+adress+"','"+phonenumber+"','"+bankname+"','"+banknumber+"')";
                sql.executeUpdate(sa);
            }
            else if("0".equals(identity)&&"0".equals(tikettype)){
                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','"+articlenumber+"','"+articletitle+"','"+page+"','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','','','','','','')";
                sql.executeUpdate(sa);
            }
            else if("1".equals(identity)&&"1".equals(tikettype)){
                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','','','','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname+"','"+pastenumber+"','','','','')";
                sql.executeUpdate(sa);
            }
            else if("1".equals(identity)&&"2".equals(tikettype)){
                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','','','','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname2+"','"+pastenumber2+"','"+adress+"','"+phonenumber+"','"+bankname+"','"+banknumber+"')";
                sql.executeUpdate(sa);
            }
            else {
                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','','','','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','','','','','','')";
                sql.executeUpdate(sa);
            }


//            while (rs.next()){
//            String yonghuid = rs.getString(1);
//            System.out.println(yonghuid);
//            if("0".equals(identity)&&"1".equals(tikettype)){
//                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','"+articlenumber+"','"+articletitle+"','"+page+"','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname+"','"+pastenumber+"','','','','')";
//                sql.executeUpdate(sa);
//            }
//            else if("0".equals(identity)&&"2".equals(tikettype)){
//                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','"+articlenumber+"','"+articletitle+"','"+page+"','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname2+"','"+pastenumber2+"','"+adress+"','"+phonenumber+"','"+bankname+"','"+banknumber+"')";
//                sql.executeUpdate(sa);
//            }
//            else if("0".equals(identity)&&"0".equals(tikettype)){
//                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','"+articlenumber+"','"+articletitle+"','"+page+"','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','','','','','','')";
//                sql.executeUpdate(sa);
//            }
//            else if("1".equals(identity)&&"1".equals(tikettype)){
//                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','','','','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname+"','"+pastenumber+"','','','','')";
//                sql.executeUpdate(sa);
//            }
//            else if("1".equals(identity)&&"2".equals(tikettype)){
//                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','','','','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','"+departmentname2+"','"+pastenumber2+"','"+adress+"','"+phonenumber+"','"+bankname+"','"+banknumber+"')";
//                sql.executeUpdate(sa);
//            }
//            else {
//                String sa = "insert into PERSON values('"+yonghuid+"','"+name+"','"+education+"','"+department+"','"+area+"','"+email+"','"+phone+"','"+identity+"','','','','"+resgisterFee+"','"+extendfee+"','"+sum+"','"+tikettype+"','','','','','','')";
//                sql.executeUpdate(sa);
//            }
//
//
//            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Á¬½ÓÊ§°Ü");
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<! DOCTYPE html>");
        out.println("<html><body>ok");
        RequestDispatcher rd = request.getRequestDispatcher("/fanhui.jsp");
        rd.forward(request,response);
        out.println("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
