package com.deo;
import java.sql.*;
import java.util.*;
import com.deo.user;
public class userdao {
    Connection con;
    Statement sql;
    PreparedStatement pstmt;
    public void adduser(user us){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            con= DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");

            String sql = "insert into userr values(?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,us.getUserid());
            pstmt.setString(2,us.getUsername());
            pstmt.setString(3,us.getPassword());
            pstmt.setString(4,us.getSex());
            pstmt.setString(5,us.getRealname());
            pstmt.setString(6,us.getEmail());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
