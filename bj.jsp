<%@ page import="cn.fvti.User" %>
<%@ page import="cn.fvti.Function" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: asd
  Date: 2020/7/5
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<%
    String tel =  request.getParameter("tel");
    Function function = new Function();
    User user = function.bj(tel);
    User vip = function.queryUser(user);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = vip.getZcsj();
    String riqi = sdf.format(date);

%>
<form action="/bj" method="post">
    <p><input type="hidden" name="tel" value="<%=vip.getYhm()%>"></p>
<p>负&nbsp;&nbsp;责&nbsp;&nbsp;人：<input type="text" name="fzr" value="<%=vip.getFzr()%>"></p>
<p>家庭地址：<input type="text" name="addre" value="<%=vip.getAddress()%>"></p>
<p>摊位位置：<input type="text" name="tw" value="<%=vip.getDtaddress()%>"></p>
<p>经营内容：<input type="text" name="nr" value="<%=vip.getJynr()%>"></p>
    <button type="submit">确定</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset">清空</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href="welcome.jsp">返回</a>
</form>
</body>
</html>
