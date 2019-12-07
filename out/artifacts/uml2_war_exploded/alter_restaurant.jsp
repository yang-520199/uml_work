<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/4 0004
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
        <%request.setCharacterEncoding("UTF-8");
            int id = Integer.parseInt(request.getParameter("id"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con =DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement sta =con.createStatement();
            String sql = "select * from RESTAURANT where RES_ID='"+id+"'";
            ResultSet rs = sta.executeQuery(sql);
            while (rs.next()){
        %>
    <h2>请修改您想要修改的内容，然后提交</h2>
    <table>
         <tr><td><label>饭店ID：</label></td><td><input type="text"value="<%=rs.getInt(1)%>"name="restaurant_id"id="res_id"readonly="readonly"></td></tr>
        <tr><td><label>饭店名称：</label></td><td><input type="text"name="restaurant_name"value="<%=rs.getString(2)%>"id="res_name"></td></tr>
        <tr><td><label>饭店地址：</label></td><td><input type="text"name="restaurant_address" value="<%=rs.getString(3)%>"id="res_address"></td></tr>
        <tr><td><label>饭店电话：</label></td><td><input type="text"name="restaurant_phone"value="<%=rs.getString(4)%>"id="res_phone"></td></tr>

        <%
            }
            rs.close();
            sta.close();
            con.close();
        %>
</table>
    <input type="button"value="提交"onclick="alter_restaurant()"/>
</div>
</body>
<script type="text/javascript">
    var xmlHTTP;
    function createXMLHttpRequest() {
        if (window.XMLHttpRequest){
            xmlHTTP=new XMLHttpRequest();
        }
        else {
            xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    function fixedEncodeURI (str) {
        return encodeURI(str).replace(/%5B/g, '[').replace(/%5D/g, ']');
    }
    function alter_restaurant() {
        createXMLHttpRequest();
        var res_id = document.getElementById("res_id");
        var res_name = document.getElementById("res_name");
        var res_address = document.getElementById("res_address");
        var res_phone = document.getElementById("res_phone");
        var url = "alter_restaurant.do?restaurant_name=" + fixedEncodeURI(res_name.value) +"&restaurant_address=" + fixedEncodeURI(res_address.value)+"&restaurant_phone=" + fixedEncodeURI(res_phone.value)+"&restaurant_id="+ fixedEncodeURI(res_id.value);
        console.log(url);
        xmlHTTP.open("GET",url,true);
        xmlHTTP.onreadystatechange = handleStateChange;
        xmlHTTP.send(null);
    }
    function handleStateChange() {
        if (xmlHTTP.readyState == 4){
            if (xmlHTTP.status == 200){
                alert("修改成功");
                document.getElementById("res_id").vale='';
                document.getElementById("res_name").vale='';
                document.getElementById("res_address").vale='';
                document.getElementById("res_phone").vale='';

            }
        }

    }

</script>
</html>
