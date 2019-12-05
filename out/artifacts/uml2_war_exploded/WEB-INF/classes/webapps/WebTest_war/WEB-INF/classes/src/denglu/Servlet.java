package denglu;

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
import java.util.Date;
import java.util.Random;


@WebServlet(name = "Servlet",urlPatterns = {"/Servlet"})
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            response.setContentType("text/html;charset=UTF-8");
            Connection con;
            Statement sql;
            ResultSet rs,rt;
            PrintWriter out = response.getWriter();
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
            } catch (Exception e) {
                System.out.println("驱动失败");
                e.printStackTrace();
            }
            try {
                con= DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
                sql = con.createStatement();
                String sq = "select login_password,user_id from  customer where login_name='"+username+"'";
                rs = sql.executeQuery(sq);
                while (rs.next()){
                    String mima = rs.getNString(1);
                    String id = rs.getString(2);
                    if (mima.equals(password)){
                        String sd = "select * from person where user_id='"+id+"'";
                        rt = sql.executeQuery(sd);
                        while (rt.next()){
                            String user_id = rt.getString(1);
                            String person_title = rt.getString(2);
                            String person_name = rt.getString(3);
                            String affiliation = rt.getString(4);
                            String country_region = rt.getString(5);
                            String email = rt.getString(6);
                            String mobile = rt.getString(7);
                            String registration_type = rt.getString(8);
                            String paper_id = rt.getString(9);
                            String paper_title = rt.getString(10);
                            String extra_page = rt.getString(11);
                            String registration_fee = rt.getString(12);
                            String extra_page_fee = rt.getString(13);
                            String total_fee = rt.getString(14);
                            String invoice_type = rt.getString(15);
                            String invoice_name = rt.getString(16);
                            String invoice_id = rt.getString(17);
                            String invoice_address = rt.getString(18);
                            String invoice_phone = rt.getString(19);
                            String invoice_bank = rt.getString(20);
                            String invoice_account = rt.getString(21);
                            response.setContentType("text/html;charset=UTF-8");
                            out.println("<! DOCTYPE html>");
                            out.println("<html><body><table>");
                            out.println("<style>");
                            out.println("table{border-collapse: collapse;}");
                            out.println("table,td,th{border: 1px solid red;}");
                            out.println("</style>");
                            out.println("<p><b>"+"亲爱的"+username+"用户，您填写的表单如下：");
                            out.print("</b></p>");
                            out.println("<tr>");
                            out.println("<th>"+"提交人ID"+"</th><th>"+"称谓"+"</th><th>"+"姓名"+"</th><th>"+"单位"+"</th><th>"+"国家或地区"+"</th><th>"+
                                    "电子邮箱"+"</th><th>"+"手机号码"+"</th><th>"+"注册类型（0：作者；1：参会者）"+"</th><th>"+"论文编号"+"</th><th>"+"论文题目"+"</th><th>"
                                    +"超页页数"+"</th><th>"+"注册费"+"</th><th>"+"超页费"+"</th><th>"+"总计"+"</th><th>"+"发票类型（0：不需发票；1：普通发票；2:专用发票）"+"</th><th>"+
                                    "单位名称"+"</th><th>"+"纳税人识别号"+"</th><th>"+"注册地址"+"</th><th>"+"注册号码"+"</th><th>"+"开户银行"+"</th><th>"+"开户账号"+"</th>");
                            out.println("</tr>");
                            out.println("<tr>");
                            out.println("<td>"+user_id+"</td><td>"+person_title+"</td><td>"+person_name+"</td><td>"+affiliation+"</td><td>"+country_region+"</td><td>"+email+"</td><td>"
                                    +mobile+"</td><td>"+registration_type+"</td><td>"+paper_id+"</td><td>"+paper_title+"</td><td>"+extra_page+"</td><td>"+registration_fee+"</td><td>"
                                    +extra_page_fee+"</td><td>"+total_fee+"</td><td>"+invoice_type+"</td><td>"+invoice_name+"</td><td>"+invoice_id+"</td><td>"+invoice_address+"</td><td>"
                                    +invoice_phone+"</td><td>"+invoice_bank+"</td><td>"+invoice_account+"</td>");
                            out.println("</tr>");
                            out.println("</table></body></html>");
                        }

                    }
                    else {
//                        RequestDispatcher rd = request.getRequestDispatcher("/usercreate.jsp");
//                            rd.forward(request,response);
                        response.sendRedirect("usercreate.jsp?error=yes");

                    }
                }

            } catch (Exception e) {
                System.out.println("连接失败");
                e.printStackTrace();
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String realname = request.getParameter("realname");
        Date d =new Date();
        response.setContentType("text/html;charset=UTF-8");
        Connection con;
        Statement sql;
        ResultSet rt = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            System.out.println("驱动失败");
            e.printStackTrace();
        }
        try {
            con= DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            sql = con.createStatement();
            String sq = "SELECT count(*) FROM customer";
            sql = con.createStatement();
            rt = sql.executeQuery(sq);
            rt.next();

            int row = rt.getInt(1);
            int user_id = 1706300000 + row;
            String sd = "insert into customer values('"+user_id+"','"+username+"','"+password+"','"+email+"','"+realname+"')";
            sql.executeUpdate(sd);
            request.setAttribute("result",user_id);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/CSS注册.jsp");
        } catch (Exception e) {
            System.out.println("连接失败");
            e.printStackTrace();
        }
    }
}
