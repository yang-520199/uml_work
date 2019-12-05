<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/7 0007
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="Servlet"method="get">
<fieldset style="width: 500px;height: 400px;margin: auto;border-style: ridge;border-color: #99cc66;border-radius: 10px;background: silver">
<div style="text-align: center">
    <p><b>欢迎注册！</b></p>
    <label><b>用户名 &nbsp;：</b></label><input type="text"name="username"style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 40px"required="true"placeholder="此项必填"id="username"/><span id="name"></span>
    <br>
    <label><b>密 &nbsp;&nbsp;&nbsp;码 :&nbsp;&nbsp;&nbsp;</b></label><input type="password"name="password"style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 40px"required="true"placeholder="此项必填"/>
    <br>
    <label><b>邮 &nbsp;&nbsp;&nbsp; 箱 :&nbsp;&nbsp;</b></label><input type="text"name="email"style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 40px"required="true"placeholder="此项必填"/>
    <br>
    <label><b>姓 &nbsp;&nbsp;&nbsp;名 :&nbsp;&nbsp;&nbsp;</b></label><input type="text"name="realname"style="border-style: ridge;border-color: red;border-radius: 6px;width: 200px;height: 40px"required="true"placeholder="此项必填，必须是真实姓名"/>
    <br>

</div>
    <div style="text-align: center">
        <br>
        <br>
        <br>
        <br>
        <input type="submit"name="submit"value="提交"style="width: 100px;height: 30px;display: inline-table">
    </div>
</fieldset>
</form>
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
        var username = document.getElementById("username");
        var url = "yanzheng.do?username="+escape(username.value);

        xmlHTTP.open("GEt",url,true);
        xmlHTTP.onreadystatechange = handleStateChange;
        xmlHTTP.send(null);
    }
    function handleStateChange() {
        if(xmlHTTP.readyState == 4){
            if(xmlHTTP.status == 200){
                document.getElementById("name").innerHTML=xmlHTTP.responseText;
            }
        }
    }
</script>
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
</body>
</html>
