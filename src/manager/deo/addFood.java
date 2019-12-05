package manager.deo;
import manager.deo.food;

import java.sql.Connection;
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
            String sql = "insert into FOOD values(?,?,?,?,?,?)";
            pstm = con.prepareStatement(sql);
            pstm.setInt(1,f.getFood_id());
            pstm.setString(2,f.getFood_name());
            pstm.setInt(3,f.getFoodclass_id());
            pstm.setString(4,f.getFood_photo());
            pstm.setInt(5,f.getRes_id());
            pstm.setString(6,f.getFood_directions());
            pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
