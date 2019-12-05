
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/19 0019
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<p>用户注册</p>
<form action="denglu.do"method="get">
    <table>
        <tr><td>用户名：</td><td><input type="text"name="username"required="true"placeholder="此项不为空"id="name"onchange="validate()"><span id="user"></span></td></tr>
        <tr><td>密码：</td><td><input type="password"name="password" required="true"placeholder="此项必填"></td></tr>
        <tr><td>性别：</td><td><input type="radio"name="sex"value="男"style="size: 30px;"><label>男</label><input type="radio"name="sex"value="女"style="size: 30px;"><label>女</label></td></tr>
        <tr><td>真实姓名：</td><td><input type="text"name="realname"required="true"placeholder="此项不为空"></td></tr>
        <tr><td>邮箱：</td><td><input type="text"name="email"required="true"placeholder="此项不为空"id="email"><span id="em"></span></td></tr>

    </table>

<div id="results"></div>
            <input type="submit"value="提交">
            <input type="reset"value="重置">

</form><br>
<%--<%=request.getAttribute("result")%>--%>
${result}
<script>
    email.onchange = function(){
        var email = this.value;
        var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if(reg.test(email)){
            // alert("邮箱格式正确");
            document.getElementById('em').innerHTML="邮箱可用";
        }else{
            // alert("邮箱格式不正确");
            document.getElementById('em').innerHTML="邮箱格式错误";
        }
    }
</script>
<script type="text/javascript">
    var xmlHTTP;
    function createXMLHttpRequest() {
        if(window.XMLHttpRequest){
            xmlHTTP = new XMLHttpRequest();
        }
        else {
            xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP")
        }
    }
    function validate() {
        createXMLHttpRequest();
        var username = document.getElementById("name");
        var url = "yanzheng.do?username="+ escape(username.value);
        console.log(url);
        xmlHTTP.open("GEt",url,true);
        xmlHTTP.onreadystatechange = handleStateChange;
        xmlHTTP.send(null);
    }
    function handleStateChange() {
        if(xmlHTTP.readyState == 4){
            if(xmlHTTP.status == 200){
                document.getElementById("user").innerHTML=xmlHTTP.responseText;
            }
        }
    }
</script>
</body>
</html>
