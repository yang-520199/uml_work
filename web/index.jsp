<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/19 0019
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
    ${sessionScope.result}

  <fieldset style="width: 500px;height: 300px;border-style: ridge;border-radius: 10px;border-color: silver;margin: auto;">
    <form action="denglu.do" method="post" style="display: inline-table">
      <p style="text-align: center"><b>欢迎登录</b></p>
      <div style="text-align: center">
        <label >用户名：</label><input type="text" name="username" id="user" style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 20px"/><br>
        <label >密 &nbsp 码：</label><input type="password" name="password" id="maima"  style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 20px"/><br>


        <div style="text-align: center;display: inline-table">
          <br>
          <br>
          <br>
          <input type="submit" name="login" value="登录" style="width: 80px;height: 30px;display:inline-table;" >
          <input type="reset" name="reset" value="重置" style="width: 80px;height: 30px;display:inline-table;">
        </div>
      </div>
    </form>
    <div style="text-align: center ;position: absolute;left: 570px" >
      <form action="a.jsp" method="get" style="display: inline-table">
        <input type="submit" name="signup" value="注册" style="width: 160px;height: 30px;display: inline-table">
      </form>
    </div>
  </fieldset>
  </body>
</html>
