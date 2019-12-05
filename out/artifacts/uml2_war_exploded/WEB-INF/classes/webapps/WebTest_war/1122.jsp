<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26 0026
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <script type="text/javascript">
        function custCheck(){
            var custName = document.getElementById("custName");
            var email = document.getElementById("email");
            var phone = document.getElementById("phone");
            if(custName.value==""){
                alter("客户名不能为空！");
                return false;
            }
            else  if(email.value.indexOf("@")==-1){
                alter("电子邮箱应该包含@字符");
                return false;
            }
            else if(phone.value.length!=11){
                alter("手机号应该是11位数字！");
                return false;
            }
        }
    </script>
    <style type="text/css">
        *,input{font-size: 11pt;color: black}
    </style>
</head>
<body>
<form action="/WebTest/123.jsp"
      method="post" onsubmit="return custCheck()">
    请输入客户信息：
    <table>
        <tr><td>客户名：</td><td><input type="text"name="custName" id="custName"></td></tr>
        <tr><td>email地址：</td><td><input type="text"name="email"id="email"></td></tr>
        <tr><td>电话：</td><td><input type="text"name="phone"id="hone"></td></tr>
    </table>
    <input type="submit"value="确定">
    <input type="reset"value="重置">
</form>
<%
    out.print("123465423478454");
%>
</body>
</html>