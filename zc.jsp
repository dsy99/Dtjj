<%--
  Created by IntelliJ IDEA.
  User: asd
  Date: 2020/7/4
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script LANGUAGE="JavaScript">
        function dl() {
            if (document.getElementById("sj").value==""||document.getElementById("mm").value==""||document.getElementById("xm").value==""||document.getElementById("sfzh").value==""){
                alert("注册表单不能为空！");
                return false;
            }else if (document.getElementById("sfzh").value.length!=18){
                alert("身份证号码为十八位！");
                return false;
            }else if (document.getElementById("sj").value.length!=11){
                alert("手机号为11位");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
</head>
<body>
<form onsubmit="return dl()" action="/zc" method="post">
    <table align="center">
        <tr>
            <td colspan="2"><input type="text" name="sjh" placeholder="请输入手机号" id="sj"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="password" name="mm" placeholder="请输入密码" id="mm"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="text" name="xm" placeholder="请输入姓名" id="xm"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="text" name="sfzh" placeholder="请输入身份证号码" id="sfzh"></td>
        </tr>
        <tr align="center">
            <td><button type="submit">注册</button></td>
            <td><a href="index.jsp"><button type="button">返回</button></a></td>
        </tr>
    </table>
</form>
</body>
</html>
