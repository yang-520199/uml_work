package manager.deo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import manager.deo.foodclass;
public class addfoodclass {
    Connection con = null;
    PreparedStatement pstm;
    public void addclass(foodclass foodclass){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("驱动失败");
        }
        try {
            con= DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            String sql = "insert into FOODCLASS values(null,?)";
            pstm = con.prepareStatement(sql);
//            pstm.setInt(1,foodclass.getFoodclass_id());
            pstm.setString(1,foodclass.getFoodclass_name());
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("错误");
            e.printStackTrace();
        }
    }
}
