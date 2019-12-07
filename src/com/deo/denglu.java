package com.deo;
import java.sql.*;
public class denglu {
    public int flag;
    public void denglu(String username,String realpassword){
        Connection con = null;
        Statement sql = null;
        ResultSet rt;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("驱动启动失败");
        }
        try {
            con=DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            String sq="select USERR_PASSWORD from USERR where USERR_NAME ='"+username+"'";
            sql=con.createStatement();
            rt=sql.executeQuery(sq);
            while (rt.next()){
                String password = rt.getString(1);
                if(password.equals(realpassword)){
                    flag = 1;
                }
                else {flag= 0;}
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
