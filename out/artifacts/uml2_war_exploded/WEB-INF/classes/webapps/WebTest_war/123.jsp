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
    <title><b>CSS 2019 注册表</b></title>
  </head>
  <body>
  <fieldset style="width: 750px; margin:auto;border-color: whitesmoke;background: white">
    <form action="shuju"method="post">
      <p><b>基本信息</b></p>
      <table>
        <tr><td><div>
          <p>称谓*</p>
          <select name="education" style="width: 165px;height: 22px">
            <option value="bachelor">学士</option>
            <option value="master">硕士</option>
            <option value="doctor">博士</option>
          </select>

        </div></td>
        <td><div style="display: inline-table">
          <p>姓名*</p>
          <input style="width: 165px "type="text"name="name"/>
        </div></td></tr>
        <tr><td> <div>
          <p>单位*</p>
          <input style="width: 165px" type="text"name="department"/>
        </div></td>
          <td><p>国家或地区*</p>
          <input style="width: 165px" type="text"name="area"value="中国"></td></tr>
        <tr><td> <p>电子邮箱*</p>
          <input style="width: 165px" type="text"name="email"/></td>
          <td> <p>手机号码</p>
          <input style="width: 165px" type="text"name="phone"/></td></tr>
      </table>
      <p>注册类型*</p>
      <input type="radio"name="identity"id="r1" onclick="document.getElementById('opt').style.display='';document.getElementById('opt2').style.display='none'" /><label>作者</label><br>
      <input type="radio"name="identity"id="r2" onclick="document.getElementById('opt2').style.display='';document.getElementById('opt').style.display='none'"/><label>参会者</label><br>
      <div id="opt" style="display:none;">
        <p style="color: aqua">论文信息</p>
        <p>论文编号*</p>
        <input style="width: 330px" type="text"name="articlenumber"/>
        <p>论文题目*</p>
        <input style="width: 330px;" type="text"name="articletitle"/>
        <p>论文页数</p>
        <select style="width: 330px">
          <option>0</option>
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
        </select>
        <p style="color: aqua">付款信息</p>
        <table>
          <tr><td><p>注册费(人民币)<label style="color: red">*</label></p>
            <input style="width: 165px" type="text"name="cost"value="4750"></td>
          <td><p>超页费（人民币）*</p>
            <input style="width: 165px" type="text"name="extendcost"value="0"></td></tr>

        </table>
        <table>
          <tr><p>总计（人民币）*</p>
            <input style="width: 330px" type="text"name="sum"value="4750"></tr>
        </table>
      </div>
      <div id="opt2" style="display:none;">
        <p style="color: aqua">付款信息</p>
        <table>
          <tr><td><p>注册费（人民币）<label style="color: red">*</label> </p>
            <input style="width: 165px"type="text"value="3000"></td>
          <td><p>超页费(人民币)<label style="color: red">*</label> </p>
            <input type="text"value="0"></td></tr>
        </table>
        <table>
          <tr><p>总计(人民币)<label style="color: red">*</label> </p>
            <input style="width: 330px" type="text"name="sum"value="0"></tr>
        </table>
      </div>
      <div>
        <p>请上传付款凭证<label style="color: red">*</label> </p>
        <input type="file"name="filename" value="选择文件">
      </div>
      <div>
        <p style="color: dodgerblue">发票信息</p>
        <p>发票类型<label style="color: red">*</label> </p>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket1').style.display='';document.getElementById('tiket2').style.display='none'"/><label>增值税普通发票</label><br>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket2').style.display='';document.getElementById('tiket1').style.display='none'"/><label>增值税专用发票</label><br>
        <input type="radio"name="tikettype"onclick="document.getElementById('tiket1').style.display='none';document.getElementById('tiket2').style.display='none'"/><label>不需要发票</label><br>
      </div>
      <table id="tiket1" style="display: none;">
        <tr><td><p>单位名称<label style="color: red">*</label></p>
          <input type="text"name="departmentname"/></td><td><p>纳税人识别号<label style="color: red">*</label></p>
          <input type="text"name="pastenumber"/></td></tr>
      </table>
      <table id="tiket2"style="display: none;">
        <tr><td><p>单位名称<label style="color: red">*</label></p>
          <input type="text"name="departmentname"/></td>
          <td><p>纳税人识别号<label style="color: red">*</label></p>
          <input type="text"name="pastenumber"/></td></tr>
        <tr><td><p>注册地址<label style="color: red">*</label> </p>
          <input type="text"name="adress"/></td>
          <td><p>注册号码<label style="color: red">*</label> </p>
          <input type="text"name="phone"/></td></tr>
        <tr><td><p>开户银行<label style="color: red">*</label> </p>
          <input type="text"name="bankname"/></td>
          <td><p>银行账号<label style="color: red">*</label> </p>
          <input type="number"name="banknumber"/></td></tr>
      </table><br>


    </form>

  </fieldset>

</body>
</html>