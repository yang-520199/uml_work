<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/25 0025
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>新的一天</title>
    <title>用户注册</title>
  </head>
  <body>
  <form action ="user-register"method="post">
    <p>用户注册</p>
    <p>姓名：<input type="text" name="name" size="15"></p>
    <p>年龄：<input type="text" name="age" size="5"></p>
    <p>性别：<input type="radio" name="sex" value="male">男
            <input type="radio"name="sex" value="female">女</p>
    <p>兴趣：<input type="checkbox" name="hobby" value="read">文学
            <input type="checkbox" name="hobby" value="sport">体育
            <input type="checkbox" name="hobby" value="computer">电脑</p>
    <p>学历：<select name="education">
      <option value="bachelor">学士</option>
      <option value="master">硕士</option>
      <option value="doctor">博士</option>
    </select>
    </p>
    <p>邮件地址：<input type="text" name="email" size="20"></p>
    <p><input type="submit" name="submit" value="提交">
    <input type="reset" name="reset" value="重置" ></p>

  </form>
  hello word!
  </body>
</html>
<html>
<head>
<meta charset="UTF-8">
  <title>百思特电子商城</title>
  <link herf ="css\style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">
  <div id="header"><img alt="Here is a logo."src="images/head.jpg">
  </div>
  <div id="topenu">
    <form action="LoginServlet"method="post" name="login">
      <p>用户名<input tyle="text"name="username" size="13"/>密码<input type="text"name="password"size="13"/>
      <input type="submit"name="Submit"value="登录">
        <input type="button"name="register"value="注册"onclick="check();">
        <input type="button"name="myloder"value="我的订单"/><input type="button"name="shopcart"value="查看购物车"/>
      </p>
    </form>
  </div>
  <div id="middle">
    <div id="leftmenu">
      <p align="center"><b>商品分类</b></p>
      <ul>
        <li><a herf="goods.do?catlog=mobilephone">手机数码</a></li>
        <li><a herf="goods.do?catlog=electrical">家用电器</a></li>
      </ul>
    </div>
    <div id="content">
      <table>
        <tr><td><img src="images/tomcat.jpg"><td><p>三星S5830领取手机节优惠券，立减100元！再送：200移动卡！
          派价：2068元</p></td>
      </table>
    </div>
  </div>
  <div id="footer">
    <hr size="1"color="blue"/>
    版本所有 &copy;2018 百思特电子商城有限责任公司，8899123.
  </div>
</div>
</body>
</html>
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
<form action="index.jsp"
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
</body>
</html>