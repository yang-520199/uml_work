<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26 0026
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<html>
<head>
    <title>CSS 2019 注册表</title>
</head>
<body style="background: lightslategray;background-image: url(/Saved_Pictures/1111.jpg);">
<style>
    fieldset.border{
        border-style: ridge;
        border-color: silver;
        border: 2px ;
        border-radius: 15px;
    }
</style>
<fieldset class="border
" style="width: 500px; margin:auto;border-color: aqua;background: beige;max-height: max-content">
    <fieldset style="width: 600px;margin-bottom: 30px;background: aqua;"></fieldset>
<%--    <hr color="aqua" size="15"width="600px">--%>
<form action="shuju" method="post">
    <a href="http://www.baidu.com/">百度</a>
    <p>基本信息</p>
    <div><label id="userid">${result}</label></div>
    <div>
        <div  style="display:inline-block">
        <p>称谓*</p>

        <select name="education" style="width: 280px;height: 22px">
            <option value="教授">教授</option>
            <option value="博士">博士</option>
            <option value="女士">女士</option>
            <option value="gentleman">男士</option>
        </select>
        </div>
        <div style="display: inline;float:right">
        <p>姓名*</p>
        <input style="width: 280px "type="text"name="name"placeholder="此处不为空"required="true"/>
         </div>
    </div><br>
    <div >
        <div style="float: left;display:inline-block " >
        <p>单位*</p>
        <input style="width: 280px" type="text"name="department"placeholder="此处必填"required="true"/>
        </div>
        <div style="display: inline; float: right">
        <p>国家或地区<label style="color: red">*</label>
        </p>
            <input style="width: 280px" type="text"name="area"value="中国"/>
        </div>
        </div><br><br><br><br><br>

    <div>
        <div style="display: inline-block;">
    <p>电子邮箱*</p>
    <input style="width: 280px" type="text"name="email"placeholder="此处必填"required="true"/>
        </div>
        <div style="display: inline;float: right">
    <p>手机号码</p>
    <input style="width: 280px" type="text"name="phone"pattern="[0-9]{11}"placeholder="请输入11位的手机号"required="true"/>
        </div>
    </div>

    <p >注册类型*</p>
    <input type="radio"name="identity"id="r1" onclick="document.getElementById('opt').style.display='';changeInput()" required="true" value="0"/><label>作者</label><br>
    <input type="radio"name="identity" id="r2" onclick="document.getElementById('opt').style.display='none';newinput()" required="true"value="1"/><label>参会者</label>
    <div id="opt" style="display:none;">
        <p style="color: aqua">论文信息</p>
        <p>论文编号*</p>
        <input style="width: 640px" type="text"name="articlenumber"/>
        <p>论文题目*</p>
        <input style="width: 640px;" type="text"name="articletitle"/>
        <p>超页页数</p>
        <select onchange="detail()" style="width: 640px" id="page"name="page">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
        </select>
    </div>
    <div id="opt2" >
    <p style="color: aqua">付款信息</p>
        <div style="display: inline-table">
        <p>注册费（人民币）<label style="color: red">*</label> </p>
        <input style="width: 280px"type="text" placeholder="暂无内容" id="resgisterFee"name="resgisterFee"/>
        </div>
        <div style="display: inline-table;float: right">
        <p>超页费(人民币)<label style="color: red">*</label> </p>
        <input type="text"value="0"style="width: 280px" id="extendfee"name="extendfee"/>
        </div>
        <p>总计(人民币)<label style="color: red">*</label> </p>
        <input id="sum" type="text"value="0"style="width: 640px"name="sum">
    </div>
    <div>
        <p>请上传付款凭证<label style="color: red">*</label> </p>
        <input type="file"name="filename" value="选择文件" placeholder="此处必填"required="true">
    </div>
    <div>
        <p style="color: dodgerblue">发票信息</p>
        <p>发票类型<label style="color: red">*</label> </p>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket1').style.display='';document.getElementById('tiket2').style.display='none'"value="1"/><label>增值税普通发票</label><br>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket2').style.display='';document.getElementById('tiket1').style.display='none'"value="2"/><label>增值税专用发票</label><br>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket1').style.display='none';document.getElementById('tiket2').style.display='none'"value="0"/><label>不需要发票</label><br>

    <div id="tiket1" style="display: none;">
        <div style="display: inline-table">
            <p>单位名称<label style="color: red">*</label></p>
            <input style="width: 280px" type="text"name="departmentname"/>
        </div>
        <div style="display: inline-table;float: right">
            <p>纳税人识别号<label style="color: red">*</label></p>
            <input style="width: 280px" type="text"name="pastenumber"/>
        </div>

    </div>

    <div id="tiket2" style="display: none;">
        <div style="display: inline-table;float: left">
        <p>单位名称<label style="color: red">*</label> </p>
        <input style="width: 280px" type="text"name="departmentname2"/>
        </div>
        <div style="display: inline-table;float: right">
        <p>纳税人识别号<label style="color: red">*</label> </p>
        <input style="width: 280px" type="text"name="pastenumber2"/>
        </div><br>
        <div style="display: inline ;float: left">
        <p>注册地址<label style="color: red">*</label> </p>
        <input style="width: 280px" type="text"name="adress"/>
        </div>
        <div style="display: inline;float:right;">
            <p>注册号码<label style="color: red">*</label> </p>
            <input style="width: 280px" type="text"name="phonenumber"/>
        </div><br>
        <div style="display: inline;float: left">
            <p>开户银行<label style="color: red">*</label> </p>
            <input style="width: 280px" type="text"name="bankname"/>
        </div>
        <div style="display: inline;float: right">
            <p>银行账号<label style="color: red">*</label> </p>
            <input style="width: 280px" type="number"name="banknumber"/>
        </div>
    </div>
    </div>
    <br>
    <br>
    <div style="text-align: center">
        <input style="background: dodgerblue;font-size: x-large;width: 100px"  type="submit"name="submit"value="提交"></div>
    </form>
    </fieldset>

<script>
    function changeInput() {
        var input1 = document.getElementById('resgisterFee');
        input1.value = 4750;
        document.getElementById('sum').value = 4750;
    }
    function detail() {
        var sel = document.getElementById('page').value;
        document.getElementById('extendfee').value = sel*600;
        document.getElementById('sum').value = sel*600+4750;
    }
    function newinput() {
        document.getElementById('sum').value = 3000;
        document.getElementById('resgisterFee').value =3000;
        document.getElementById('extendfee').value = 0;
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
