<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/7 0007
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
    <fieldset style="width: 500px;height: 300px;border-style: ridge;border-radius: 10px;border-color: silver;margin: auto;">
        <form action="Servlet" method="post" style="display: inline-table">
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
            <form action="zhuce.jsp" method="get" style="display: inline-table">
                <input type="submit" name="signup" value="注册" style="width: 160px;height: 30px;display: inline-table">

            </form>
        </div>
    </fieldset>
<script>
    (function(window,document,undefined){
        var hearts = [];
        window.requestAnimationFrame = (function(){
            return window.requestAnimationFrame ||
                window.webkitRequestAnimationFrame ||
                window.mozRequestAnimationFrame ||
                window.oRequestAnimationFrame ||
                window.msRequestAnimationFrame ||
                function (callback){
                    setTimeout(callback,1000/60);
                }
        })();
        init();
        function init(){
            css(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: absolute;}.heart:after{top: -5px;}.heart:before{left: -5px;}");
            attachEvent();
            gameloop();
        }
        function gameloop(){
            for(var i=0;i<hearts.length;i++){
                if(hearts[i].alpha <=0){
                    document.body.removeChild(hearts[i].el);
                    hearts.splice(i,1);
                    continue;
                }
                hearts[i].y--;
                hearts[i].scale += 0.004;
                hearts[i].alpha -= 0.013;
                hearts[i].el.style.cssText = "left:"+hearts[i].x+"px;top:"+hearts[i].y+"px;opacity:"+hearts[i].alpha+";transform:scale("+hearts[i].scale+","+hearts[i].scale+") rotate(45deg);background:"+hearts[i].color;
            }
            requestAnimationFrame(gameloop);
        }
        function attachEvent(){
            var old = typeof window.οnclick==="function" && window.onclick;
            window.onclick = function(event){
                old && old();
                createHeart(event);
            }
        }
        function createHeart(event){
            var d = document.createElement("div");
            d.className = "heart";
            hearts.push({
                el : d,
                x : event.clientX - 5,
                y : event.clientY - 5,
                scale : 1,
                alpha : 1,
                color : randomColor()
            });
            document.body.appendChild(d);
        }
        function css(css){
            var style = document.createElement("style");
            style.type="text/css";
            try{
                style.appendChild(document.createTextNode(css));
            }catch(ex){
                style.styleSheet.cssText = css;
            }
            document.getElementsByTagName('head')[0].appendChild(style);
        }
        function randomColor(){
            return "rgb("+(~~(Math.random()*255))+","+(~~(Math.random()*255))+","+(~~(Math.random()*255))+")";
        }
    })(window,document);
</script>
    <script>

        //取出传回来的参数error并与yes比较
        var errori ='<%=request.getParameter("error")%>';
        if(errori=='yes'){
            alert("用户名或者密码错误，请重新登录");
        }
    </script>
</body>
</html>
