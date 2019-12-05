<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26 0026
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
</head>
<body>
<form action="LoginSerlet"method="post">
    <fieldset>
        <legend>用户登录</legend>
        <p><label>用户名：<input type="text"name="username"/></label></p>
        <p><label>密 &nbsp;&nbsp;码：<input type="password"name="password"/></label></p>
        <p><label><input type="submit"value="登录"/><input type="reset"value="取消"/></label></p>
    </fieldset>
</form>
<%--<jsp:include page="123.jsp" flush="true" />--%>
</body>
</html>