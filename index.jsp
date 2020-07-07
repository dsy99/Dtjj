<%@ page import="cn.fvti.Function" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.fvti.User" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: asd
  Date: 2020/7/5
  Time: 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <script LANGUAGE="JavaScript">
      function dl() {
        if (document.getElementById("sj").value==""||document.getElementById("mm").value==""){
          alert("手机号或密码不能为空！")
          return false;
        }else {
          return true;
        }
      }
    </script>
  </head>
  <body>
<%--  <%--%>
<%--    if (session.getAttribute("login")==null||!session.getAttribute("login").equals("ok")){--%>
<%--  %>--%>
  <h1 align="center">地摊规范管理系统</h1>
  <form onsubmit="return dl()" action="/dl" method="post">
    <table align="center">
      <tr>
        <td colspan="2"><input type="text" name="sjh" placeholder="请输入手机号" id="sj"></td>
      </tr>
      <tr>
        <td colspan="2"><input type="password" name="mm" placeholder="请输入密码" id="mm"></td>
      </tr>
      <tr align="center">
        <td><button type="submit">登陆</button></td>
        <td><button type="button"><a href="zc.jsp" style="text-decoration: none;color: black">注册</a></button></td>
      </tr>
    </table>
  </form>
<%--  <%--%>
<%--    }--%>
<%--    if (session.getAttribute("number")==null){--%>
<%--      return;--%>
<%--    }--%>
<%--    if (session.getAttribute("number")!=null){--%>
<%--      String tel = (String) session.getAttribute("number");--%>
<%--      String passwd = (String) session.getAttribute("passwd");--%>
<%--      Function function = new Function();--%>
<%--      User user = function.login(tel,passwd);--%>
<%--      User xx = function.queryUser(user);--%>
<%--      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");--%>
<%--      Date date = xx.getZcsj();--%>
<%--      String riqi = sdf.format(date);--%>




<%--  %>--%>
<%--  <p align="right">欢迎你：<%=tel%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ndl">退出登陆</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;积分：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开户日期：<%=riqi%></p>--%>
<%--  <p></p>--%>
<%--  <p></p>--%>
<%--  <%--%>
<%--    }--%>
<%--  %>--%>
  </body>
</html>
