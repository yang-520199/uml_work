package manager.deo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import manager.deo.restaurant;
public class addRetaurant {
    Connection con = null;
    PreparedStatement pstm = null;
    public void addrestaurant(restaurant res){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            String sql = "insert into RESTAURANT values(null,?,?,?)";
            pstm = con.prepareStatement(sql);
//            pstm.setInt(1,res.getRes_id());
            pstm.setString(1,res.getRes_name());
            pstm.setString(2,res.getRes_address());
            pstm.setString(3,res.getRes_photo());
            pstm.executeUpdate();
        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
