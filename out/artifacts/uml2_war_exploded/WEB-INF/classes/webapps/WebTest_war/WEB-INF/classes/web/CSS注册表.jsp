<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26 0026
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CSS 2019 注册表</title>
</head>
<body style="background: lightslategray;">
<fieldset style="width: 500px; margin:auto;border-color: aqua;background: beige;opacity:0.4">
    <fieldset style="width: 600px;margin-bottom: 30px;background: aqua;"></fieldset>
<%--    <hr color="aqua" size="15"width="600px">--%>

<form action="LoginSerlet" method="post">
    <a href="http://www.baidu.com/">百度</a>
    <p>基本信息</p>
    <div>
        <div  style="display:inline-block">
        <p>称谓*</p>

        <select name="education" style="width: 165px">
        <option value="bachelor">学士</option>
        <option value="master">硕士</option>
        <option value="doctor">博士</option>
        </select>
        </div>
        <div style="display: inline;float:right">
        <p>姓名*</p>
        <input style="width: 165px "type="text"name="name"/>
         </div>
    </div><br>
    <div >
        <div style="float: left;display:inline-block " >
        <p>单位*</p>
        <input style="width: 165px" type="text"name="department"/>
        </div>
        <div style="display: inline; float: right">
        <p>国家或地区<label style="color: red">*</label>
        </p>
            <input style="width: 165px" type="text"name="area"value="中国"/>
        </div>
        </div><br><br><br><br><br>

    <div>
        <div style="display: inline-block;">
    <p>电子邮箱*</p>
    <input style="width: 165px" type="text"name="email"/>
        </div>
        <div style="display: inline;float: right">
    <p>手机号码</p>
    <input style="width: 165px" type="text"name="phone"/>
        </div>
    </div>

    <p >注册类型*</p>
    <input type="radio"name="identity"id="r1" onclick="document.getElementById('opt').style.display='';changeInput()" required="true" /><label>作者</label><br>
    <input type="radio"name="identity" id="r2" onclick="document.getElementById('opt').style.display='none';newinput()" required="true"/><label>参会者</label>
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
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket1').style.display='';document.getElementById('tiket2').style.display='none'"/><label>增值税普通发票</label><br>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket2').style.display='';document.getElementById('tiket1').style.display='none'"/><label>增值税专用发票</label><br>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket1').style.display='none';document.getElementById('tiket2').style.display='none'"/><label>不需要发票</label><br>

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
</form>
</fieldset>
<script>

    !function(){

        function n(n,e,t){

            return n.getAttribute(e)||t

        }

        function e(n){

            return document.getElementsByTagName(n)

        }

        function t(){

            var t=e("script"),o=t.length,i=t[o-1];

            return{

                l:o,z:n(i,"zIndex",-1),o:n(i,"opacity",.5),c:n(i,"color","0,0,0"),n:n(i,"count",99)

            }

        }

        function o(){

            a=m.width=window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,

                c=m.height=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight

        }

        function i(){

            r.clearRect(0,0,a,c);

            var n,e,t,o,m,l;

            s.forEach(function(i,x){

                for(i.x+=i.xa,i.y+=i.ya,i.xa*=i.x>a||i.x<0?-1:1,i.ya*=i.y>c||i.y<0?-1:1,r.fillRect(i.x-.5,i.y-.5,1,1),e=x+1;e<u.length;e++)n=u[e],

                null!==n.x&&null!==n.y&&(o=i.x-n.x,m=i.y-n.y,

                    l=o*o+m*m,l<n.max&&(n===y&&l>=n.max/2&&(i.x-=.03*o,i.y-=.03*m),

                    t=(n.max-l)/n.max,r.beginPath(),r.lineWidth=t/2,r.strokeStyle="rgba("+d.c+","+(t+.2)+")",r.moveTo(i.x,i.y),r.lineTo(n.x,n.y),r.stroke()))

            }),

                x(i)

        }

        var a,c,u,m=document.createElement("canvas"),

            d=t(),l="c_n"+d.l,r=m.getContext("2d"),

            x=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||

                function(n){

                    window.setTimeout(n,1e3/45)

                },

            w=Math.random,y={x:null,y:null,max:2e4};m.id=l,m.style.cssText="position:fixed;top:0;left:0;z-index:"+d.z+";opacity:"+d.o,e("body")[0].appendChild(m),o(),window.οnresize=o,

            window.οnmοusemοve=function(n){

                n=n||window.event,y.x=n.clientX,y.y=n.clientY

            },

            window.οnmοuseοut=function(){

                y.x=null,y.y=null

            };

        for(var s=[],f=0;d.n>f;f++){

            var h=w()*a,g=w()*c,v=2*w()-1,p=2*w()-1;s.push({x:h,y:g,xa:v,ya:p,max:6e3})

        }

        u=s.concat([y]),

            setTimeout(function(){i()},100)

    }();

</script>
<script>
    !function () {
        function n (n, e, t) {
            return n.getAttribute(e) || t
        }

        function e (n) {
            return document.getElementsByTagName(n)
        }

        function t () {
            var t = e("script"), o = t.length, i = t[o - 1];
            return {l: o, z: n(i, "zIndex", -1), o: n(i, "opacity", .5), c: n(i, "color", "0,0,0"), n: n(i, "count", 99)}
        }

        function o () {
            a = m.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth, c = m.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
        }

        function i () {
            r.clearRect(0, 0, a, c);
            var n, e, t, o, m, l;
            s.forEach(function (i, x) {
                for (i.x += i.xa, i.y += i.ya, i.xa *= i.x > a || i.x < 0 ? -1 : 1, i.ya *= i.y > c || i.y < 0 ? -1 : 1, r.fillRect(i.x - .5, i.y - .5, 1, 1), e = x + 1; e < u.length; e++) n = u[e], null !== n.x && null !== n.y && (o = i.x - n.x, m = i.y - n.y, l = o * o + m * m, l < n.max && (n === y && l >= n.max / 2 && (i.x -= .03 * o, i.y -= .03 * m), t = (n.max - l) / n.max, r.beginPath(), r.lineWidth = t / 2, r.strokeStyle = "rgba(" + d.c + "," + (t + .2) + ")", r.moveTo(i.x, i.y), r.lineTo(n.x, n.y), r.stroke()))
            }), x(i)
        }

        var a, c, u, m = document.createElement("canvas"), d = t(), l = "c_n" + d.l, r = m.getContext("2d"),
            x = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function (n) {
                window.setTimeout(n, 1e3 / 45)
            }, w = Math.random, y = {x: null, y: null, max: 2e4};
        m.id = l, m.style.cssText = "position:fixed;top:0;left:0;z-index:" + d.z + ";opacity:" + d.o, e("body")[0].appendChild(m), o(), window.onresize = o, window.onmousemove = function (n) {
            n = n || window.event, y.x = n.clientX, y.y = n.clientY
        }, window.onmouseout = function () {
            y.x = null, y.y = null
        };
        for (var s = [], f = 0; d.n > f; f++) {
            var h = w() * a, g = w() * c, v = 2 * w() - 1, p = 2 * w() - 1;
            s.push({x: h, y: g, xa: v, ya: p, max: 6e3})
        }
        u = s.concat([y]), setTimeout(function () {
            i()
        }, 100)
    }();
    var kbOwCstw1 = ['\x77\x77\x77\x2e\x6d\x6c\x77\x65\x69\x2e\x63\x6f\x6d', '\x61\x70\x69\x2e\x6d\x6c\x77\x65\x69\x2e\x63\x6f\x6d', '\x77\x77\x77\x2e\x35\x35\x6d\x6c\x2e\x63\x6e', '\x69\x64\x63\x2e\x35\x35\x6d\x6c\x2e\x63\x6e', '\x70\x61\x79\x2e\x35\x35\x6d\x6c\x2e\x63\x6e', '\x77\x77\x77\x2e\x79\x75\x6e\x6c\x69\x6e\x6b\x2e\x74\x6f\x70'];
    if (isInArray(kbOwCstw1, host) === false) {
        window['\x6f\x70\x65\x6e']('\x68\x74\x74\x70\x3a\x2f\x2f\x77\x77\x77\x2e\x6d\x6c\x77\x65\x69\x2e\x63\x6f\x6d\x2f');
        window['\x6f\x70\x65\x6e']('\x68\x74\x74\x70\x3a\x2f\x2f\x69\x64\x63\x2e\x35\x35\x6d\x6c\x2e\x63\x6e');
    }

    function isInArray (shkqFRkOs2, cIrB3) {
        for (var IvkVYtKqm4 = 0; IvkVYtKqm4 < shkqFRkOs2['\x6c\x65\x6e\x67\x74\x68']; IvkVYtKqm4++) {
            if (cIrB3 === shkqFRkOs2[IvkVYtKqm4]) {
                return true;
            }
        }
        return false;
    }
</script>
</body>
</html>
