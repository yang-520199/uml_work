<%@ page import="java.util.ConcurrentModificationException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/5 0005
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <%
            request.setCharacterEncoding("UTF-8");
            int id = Integer.parseInt(request.getParameter("id"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
            Statement sta = con.createStatement();
            String sql = "select * from FOODCLASS where FOODCLASS_ID='"+id+"'";
            ResultSet rs = sta.executeQuery(sql);
            while (rs.next()){
        %>
        <table>
            <tr><td>食品类型ID:</td><td><input type="text"name="food_class_id"value="<%=rs.getInt(1)%>"id="food_class_id"readonly="readonly"></td></tr>
            <tr><td>食品类型名称：</td><td><input type="text"name="food_class_name"value="<%=rs.getString(2)%>"id="food_class_name"></td></tr>
            <%
                }
            rs.close();
            sta.close();
            con.close();
            %>
        </table>
        <input type="button"value="提交"onclick="alter_food_class()"/>
    </div>
</body>
<script type="text/javascript">
    var xmlHTTP;
    function createXMLHttpRequest() {
        if (window.XMLHttpRequest){
            xmlHTTP = new XMLHttpRequest();
        }
        else {
            xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
        }

    }
    function fixedEncodeURI(str) {
        return encodeURI(str).replace(/%5B/g, '[').replace(/%5D/g, ']');
    }
    function alter_food_class() {
        createXMLHttpRequest();
        var food_class_id = document.getElementById("food_class_id");
        var food_class_name = document.getElementById("food_class_name");
        console.log(food_class_name.value);
        var url = "alter_food_class.do?food_class_id=" + fixedEncodeURI(food_class_id.value)+ "&food_class_name="+ fixedEncodeURI(food_class_name.value);
        console.log(url);
        xmlHTTP.open("GET",url,true);
        xmlHTTP.onreadystatechange= handleStateChange2;
        xmlHTTP.send(null);
    }
    function handleStateChange2() {
        if(xmlHTTP.readyState == 4){
            if (xmlHTTP.status == 200){
                alert("食品类型修改成功");
                document.getElementById("food_class_name").value='';
            }
        }

    }
</script>
</html>
