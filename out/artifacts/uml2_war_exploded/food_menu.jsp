<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/7 0007
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><%=request.getParameter("name")%>的菜单如下：</p>
<table>
    <tr><td>菜品名称</td><td>菜品描述</td></tr>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection= DriverManager.getConnection("jdbc:oracle:thin:shuju/123456@localhost:1521:orcl");
    Statement statement=connection.createStatement();
    String sql="SELECT * from FOOD LEFT OUTER JOIN RESTAURANT ON(FOOD.RES_ID=RESTAURANT.RES_ID) WHERE RESTAURANT.RES_ID="+id;
    ResultSet rs=statement.executeQuery(sql);
    while (rs.next()){
%>
    <tr><td><%=rs.getString(2)%></td><td><%=rs.getString(6)%></td></tr>
    <%
        }
    rs.close();
    statement.close();
    connection.close();
    %>
</table>
</body>
</html>
