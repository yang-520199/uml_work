<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/4 0004
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>管理界面</title>
    <style>
        .topnav{
            overflow: hidden;
            background-color: #333;
        }
        .topnav a{
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
<div class="topnav">
    <a herf="#"onclick="document.getElementById('alterfoodclass').style.display='none';document.getElementById('addfoodclass').style.display='';document.getElementById('addrestaurant').style.display='none';document.getElementById('alterrestaurant').style.display='none';document.getElementById('addfood').style.display='none';document.getElementById('alterfood').style.display='none'">添加菜品类型</a>
    <a herf="#"onclick="document.getElementById('alterfoodclass').style.display='';document.getElementById('addfoodclass').style.display='none';document.getElementById('addrestaurant').style.display='none';document.getElementById('alterrestaurant').style.display='none';document.getElementById('addfood').style.display='none';document.getElementById('alterfood').style.display='none'">修改菜品类型</a>
    <a herf="#"onclick="document.getElementById('alterfoodclass').style.display='none';document.getElementById('addfoodclass').style.display='none';document.getElementById('addrestaurant').style.display='';document.getElementById('alterrestaurant').style.display='none';document.getElementById('addfood').style.display='none';document.getElementById('alterfood').style.display='none'">增加饭店</a>
    <a herf="#"onclick="document.getElementById('alterfoodclass').style.display='none';document.getElementById('addfoodclass').style.display='none';document.getElementById('addrestaurant').style.display='none';document.getElementById('alterrestaurant').style.display='';document.getElementById('addfood').style.display='none';document.getElementById('alterfood').style.display='none'">修改饭店信息</a>
    <a herf="#"onclick="document.getElementById('alterfoodclass').style.display='none';document.getElementById('addfoodclass').style.display='none';document.getElementById('addrestaurant').style.display='none';document.getElementById('alterrestaurant').style.display='none';document.getElementById('addfood').style.display='';document.getElementById('alterfood').style.display='none'">增加菜品</a>
    <a herf="#"onclick="document.getElementById('alterfoodclass').style.display='none';document.getElementById('addfoodclass').style.display='none';document.getElementById('addrestaurant').style.display='none';document.getElementById('alterrestaurant').style.display='none';document.getElementById('addfood').style.display='none';document.getElementById('alterfood').style.display=''">修改菜品信息</a>
</div>
<div id="addfoodclass" style="display: none;position:relative;top: 50px;">

    <label style="font-size: 25px">请输入菜品类别名称：</label><input type="text"style="width: 250px;height: 30px;"name="foodclass"id="foodclassname"><input type="button"value="添加"style="height: 30px;" onclick="addfoodclass()"><br>
    <span id="showresult"></span>
</div>
<div id="alterfoodclass"style="display: none">
    <table>
        <tr><td>食品类别名称</td><td>操作</td></tr>
        <%
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
                Statement sta = con.createStatement();
                String sql = "select * from FOODCLASS";
                ResultSet rs = sta.executeQuery(sql);
                while (rs.next()){
        %>
        <tr><td><%=rs.getString(2)%>></td><td><a href="delete?id=<%=rs.getInt(1)%>" onclick="showresult()">删除</a><label>|</label><a href="alter_foodclass.jsp?id=<%=rs.getInt(1)%>"target="iframe_b" onclick="document.getElementById('changeshow1').style.display=''">修改</a></td></tr>
        <%
                }
                rs.close();
                sta.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <div id="changeshow1"style="display: none"/>
         <iframe src="alter_foodclass.jsp"name="iframe_b"width="500"height="300"></iframe>
    </div>
</div>
<div id="addrestaurant"style="display: none">
    <table>
        <tr><td>请输入饭店名称：</td><td><input type="text"name="restaurant_name"id="restaurant_name"></td></tr>
        <tr><td>请输入饭店地址：</td><td><input type="text"name="restaurant_address"id="restaurant_address"></td></tr>
        <tr><td>请输入饭店电话：</td><td><input type="text"name="restaurant_phone"id="restaurant_phone"></td></tr>
    </table>
    <span id="add_restaurant_result"></span><br>
    <input type="button"onclick="addrestaurant()"value="提交">
</div>
<div id="alterrestaurant"style="display: none">
    <table>
        <tr><td>饭店名称</td><td>操作</td></tr>
        <%
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
                Statement sta = con.createStatement();
                String sql = "select * from RESTAURANT";
                ResultSet rs = sta.executeQuery(sql);
                while(rs.next()){
                    %>
        <tr><td><%=rs.getString(2)%></td><td><a href="delete_restaurant?res_id=<%=rs.getInt(1)%>"onclick="document.getElementById('changeshow').style.display=''">删除</a><label>|</label><a onclick="document.getElementById('changeshow').style.display=''"href="alter_restaurant.jsp?id=<%=rs.getInt(1)%>" target="iframe_a" id="<%=rs.getInt(1)%>">修改</a></td></tr>

                <% }
                rs.close();
                sta.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <div id="changeshow"style="display: none">
        <iframe src="alter_restaurant.jsp"name="iframe_a"width="500"height="300"></iframe>
    </div>
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

    function addfoodclass() {
        createXMLHttpRequest();
        var foodname = document.getElementById("foodclassname");
        console.log(foodname.value);
        var url = "manager.do?foodclass=" + fixedEncodeURI(foodname.value);
        console.log(url);

        xmlHTTP.open("GET",url,true);
        xmlHTTP.onreadystatechange = handleStateChange;
        xmlHTTP.send(null);
    }
    function handleStateChange() {
        if(xmlHTTP.readyState == 4){
            if(xmlHTTP.status == 200){
                document.getElementById("showresult").innerHTML=xmlHTTP.responseText;
            }
        }
    }
    function addrestaurant() {
        createXMLHttpRequest();
        var restaurant_name = document.getElementById("restaurant_name");
        var restaurant_address = document.getElementById("restaurant_address");
        var restaurant_phone = document.getElementById("restaurant_phone");
        var url="addrestaurant.do?restaurant_name=" + fixedEncodeURI(restaurant_name.value) + "&restaurant_address=" + fixedEncodeURI(restaurant_address.value)+"&restaurant_phone=" + fixedEncodeURI(restaurant_phone.value);
        xmlHTTP.open("GET",url,true);
        xmlHTTP.onreadystatechange = handleStateChange1;
        xmlHTTP.send(null);
    }
    function handleStateChange1() {
        if(xmlHTTP.readyState == 4){
            if(xmlHTTP.status == 200){
                document.getElementById("add_restaurant_result").innerHTML=xmlHTTP.responseText;
                document.getElementById("restaurant_name").value="";
                document.getElementById("restaurant_address").value="";
                document.getElementById("restaurant_phone").value="";
            }
        }
    }
    function change_restaurant() {


    }
</script>
<script>
    function showresult() {
        alert("删除成功");
    }
</script>
</html>
