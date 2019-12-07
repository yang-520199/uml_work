<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/7 0007
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .food-box{
        height: 150px;
        background-color: white;
        display: flex;
    }

    .food-box-img {
        width: 150px;
        background-color: fuchsia;
    }

    .food-box-text {
        padding-left: 10px;
    }
</style>
<body>
<div class="food-box">
    <div class="food-box-img">
        <img src="/tmp/${sessionScope.food_photo}" height="150" width="150">
    </div>
    <div class="food-box-text">
        <h3>${sessionScope.food_name}</h3>
        <p >${sessionScope.food_description}</p>
    </div>
</div>
</body>
</html>
