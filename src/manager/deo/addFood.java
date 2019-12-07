package manager.deo;
import manager.deo.food;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class addFood {
    Connection con = null;
    PreparedStatement pstm = null;
    public void addfood(food f){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            String sql = "insert into FOOD values(null ,?,?,?,?,?)";
            pstm = con.prepareStatement(sql);
//            pstm.setInt(1,f.getFood_id());
            pstm.setString(1,f.getFood_name());
            pstm.setInt(2,f.getFoodclass_id());
            pstm.setString(3,f.getFood_photo());
            pstm.setInt(4,f.getRes_id());
            pstm.setString(5,f.getFood_directions());
            pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
