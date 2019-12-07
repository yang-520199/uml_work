<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/6 0006
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="index.css">
    <title>餐饮评价系统</title>
</head>
<body>
<div id="all">

    <div id="header">
        <div id="header-left">
            <div>
                <p style="font-size: 15px">餐饮评价系统</p>
            </div>
        </div>
        <div id="header-right">
            <div class="header-right-a"><a href="display.jsp" class="pink">首页</a></div>
            <div class="header-right-a"><a href="stars.html" class="pink">菜品之星</a></div>
            <div class="header-right-a"><a href="ranking.html" class="pink">菜品排名</a></div>
        </div>
    </div>

    <div id="wrapper">
        <div id="left-bar">
            <div id="search-wrapper">
                <table>
                    <tbody>
                    <tr>
                        <td>食品名称:</td>
                        <td><input type="text"id="search_name"></td>
                    </tr>
                    <tr>
                        <td>饭店：</td>
                        <td>
                            <select id="search_restaurant">
                                <%
                                    Class.forName("oracle.jdbc.driver.OracleDriver");
                                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
                                    Statement sta = con.createStatement();
                                    String sq = "select * from RESTAURANT";
                                    ResultSet rst = sta.executeQuery(sq);
                                    while (rst.next()){
                                %>
                                <option value="<%=rst.getString(1)%>"><%=rst.getString(2)%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>食品类型：</td>
                        <td>
                            <select id="search_class">
                                <%
                                String sql = "select * from FOODCLASS";
                                ResultSet rs = sta.executeQuery(sql);
                                while(rs.next()){
                                %>
                                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                <%}
                                rs.close();
                                rst.close();
                                sta.close();
                                con.close();
                                %>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <p style="text-align: center"><input type="button" id="search-btn" onclick="search()"value="搜索"></p>
            </div>
<%--            <div id="search">--%>
<%--            </div>--%>

`                <div id="restaurant-list" >
                    <div id="enter" style="background-color: aquamarine">
                        <p style="font-size: xx-large; text-align: center; height: 45px">饭店列表</p>
                    </div>
                    <div style="text-align: center; position: relative; margin:0 auto">
                        <%
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection connection1 = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
                            Statement statement = connection1.createStatement();
                            String sql4 = "SELECT * FROM RESTAURANT  WHERE ROWNUM <= 10";
                            ResultSet rs3=statement.executeQuery(sql4);
                            while (rs3.next()){
                        %>
                        <p style="height: 25px; background-color: aquamarine; align-self: center"><a href="food_menu.jsp?id=<%=rs3.getInt(1)%>&name=<%=rs3.getString(2)%>"target="iframe_menu"onclick="document.getElementById('food_menu').style.display='';document.getElementById('right-content').style.display='none';"><%=rs3.getString(2)%></a></p>
                        <%
                            }
                            rs3.close();
                            statement.close();
                            connection1.close();
                        %>
                    </div>
                </div>

            <div id="personal-info">
                <form action="denglu.do"method="post">
                <label style="font-size: medium">用户名：</label><input type="text" name="username" id="user" style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 30px"/><br>
                <label style="font-size: medium">密 &nbsp 码：</label><input type="password" name="password" id="maima"style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 30px"/><br>
                <input type="submit" name="login" value="登录" style="width: 80px;height: 30px;display:inline-table;">
                <input type="reset" name="reset" value="重置" style="width: 80px;height: 30px;display:inline-table;">
                </form>
                <form action="register.jsp" method="get" style="display: inline-table">
                    <input type="submit" name="signup" value="注册" style="width: 160px;height: 30px;display: inline-table">
                </form>
            </div>
            ${sessionScope.message_register}
            ${sessionScope.message}
            <div>
                <p>用户名：${sessionScope.name}</p>
                <p>性别:${sessionScope.sex}</p>
                <p>真实姓名:${sessionScope.real_name}</p>
                <p>邮箱:${sessionScope.email}</p>

            </div>
        </div>

        <div id="right-content">
            <%
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection connection = DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
                Statement sta2 = connection.createStatement();
                String sql3 = "select * from food";
                ResultSet rs2 = sta2.executeQuery(sql3);
                while (rs2.next()){
            %>
            <div class="food-box">
                <div class="food-box-img">
                    <img src="/tmp/<%=rs2.getString(4)%>" height="150" width="150">
                </div>
                <div class="food-box-text">
                    <h3><%=rs2.getString(2)%></h3>
                    <p ><%=rs2.getString(6)%></p>
                </div>
            </div>
            <%
                }
                rs2.close();
                sta2.close();
                connection.close();
            %>
        </div>
        <div id="search">
        </div>
        <div id="food_menu"style="display: none">
            <iframe name="iframe_menu" src="food_menu.jsp" marginwidth=0 marginheight=0 width="800"height="500"></iframe>
        </div>
    </div>
    <div id="footer">
        winnerwinter
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
    function search() {
        createXMLHttpRequest();
        var search_name = document.getElementById("search_name");
        var search_restaurant = document.getElementById("search_restaurant");
        var search_class = document.getElementById("search_class");
        var url = "search.do?search_name=" + fixedEncodeURI(search_name.value) +"&search_restaurant=" + fixedEncodeURI(search_restaurant.value)+"&search_class=" + fixedEncodeURI(search_class.value);
        console.log(url);
        xmlHTTP.open("GET",url,true);
        xmlHTTP.onreadystatechange = handleStateChange;
        xmlHTTP.send(null);
    }
    function handleStateChange() {
        if (xmlHTTP.readyState == 4){
            if (xmlHTTP.status == 200){
                document.getElementById("right-content").style.display='none';
                document.getElementById("search").innerHTML="<p style='font-size: x-large;color: red '>搜索结果如下</p><iframe name=\"content_frame\" marginwidth=0 marginheight=0 width=\"500\"height=\"300\" src=\"search_show.jsp\" frameborder=0></iframe> "
            }
        }
    }
</script>
</html>
