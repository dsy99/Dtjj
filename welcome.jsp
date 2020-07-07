<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="cn.fvti.User" %>
<%@ page import="cn.fvti.Function" %><%--
  Created by IntelliJ IDEA.
  User: asd
  Date: 2020/7/4
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script LANGUAGE="JavaScript">
        function tz() {
            var sc =confirm("确认删除！");
            var tel = document.getElementById("sc").value;
            if (sc==true){
                window.location.href="re?key="+tel;
                // return true;
            }else {
                return false;
            }
            // return false;
        }
    </script>
</head>
<body>
<%
    if (session.getAttribute("login")==null||!session.getAttribute("login").equals("ok")){
        out.println("<span style=\"float: right\">您尚未登陆，请<a href='index.jsp'>登录</a></span>");
    }
    if (session.getAttribute("number")==null){
        return;
    }
    if (session.getAttribute("number")!=null){
        String number = (String) session.getAttribute("number");
        if (number.equals("root")){
            response.sendRedirect("admin.jsp");
        }
        String pass = (String) session.getAttribute("pass");
        Function fun = new Function();
        User vu = fun.login(number,pass);
        User vip = fun.queryUser(vu);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = vip.getZcsj();
        String riqi = sdf.format(date);
%>
<p align="right">欢迎你：<%=vip.getName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/lo">退出登陆</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="tz()">注销账号</a></p>
<h1 align="center">个人信息</h1>
<table border="1" align="center">
    <tr>
        <td>手机号</td>
        <td>身份证号</td>
        <td>负责人</td>
        <td>家庭住址</td>
        <td>摊位地址</td>
        <td>经营内容</td>
        <td>租金</td>
        <td>注册时间</td>
        <td>操作</td>
    </tr>
    <tr>
        <td><%=vip.getYhm()%></td>
        <td><%=vip.getSfzh()%></td>
        <td><%=vip.getFzr()%></td>
        <td><%=vip.getAddress()%></td>
        <td><%=vip.getDtaddress()%></td>
        <td><%=vip.getJynr()%></td>
        <td><%=vip.getZj()%></td>
        <td><%=riqi%></td>
        <td><a href='bj.jsp?tel=<%=vip.getYhm()%>'><button>编辑</button></a></td>
        <input type="hidden" value="<%=vip.getYhm()%>" id="sc">
    </tr>
</table>
<%
    }
%>
</body>
</html>
