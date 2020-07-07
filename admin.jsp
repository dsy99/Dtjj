<%@ page import="java.util.Iterator" %>
<%@ page import="cn.fvti.Function" %>
<%@ page import="java.util.Map" %>
<%@ page import="cn.fvti.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: asd
  Date: 2020/7/5
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script LANGUAGE="JavaScript">
        function tz() {
            var sc =confirm("是否删除"+document.getElementById("n").value);
            var tel = document.getElementById("sc").value;
            if (sc==true){
                window.location.href="/remove?tel="+tel;
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
%>
<p align="right">欢迎你：<%=number%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/lo">退出登陆</a></p>
<table border="1" align="center">
    <thead>
        <td>用户名</td>
        <td>手机号</td>
        <td>身份证号</td>
        <td>负责人</td>
        <td>家庭住址</td>
        <td>摊位地址</td>
        <td>经营内容</td>
        <td>租金</td>
        <td>注册时间</td>
        <td>操作</td>
    </thead>
<%

//        Integer integ = null;
//        Iterator iter = Function.map.entrySet().iterator();
//        while (iter.hasNext()){
//            Map.Entry entry = (Map.Entry)iter.next();
//            String key = (String)entry.getKey();
//            integ = (Integer)entry.getValue();
////            out.print(integ);
//        }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    for (String in : Function.map.keySet()){
            User value = Function.map.get(in);
            if (in.equals("root")){
                continue;
            }
        Date date = value.getZcsj();
%>

    <tr>
        <input type="hidden" id="sc" value=<%=value.getYhm()%>>
        <td><%=value.getName()%></td>
        <td id="in"><%=in%></td>
        <td><%=value.getSfzh()%></td>
        <td><%=value.getFzr()%></td>
        <td><%=value.getAddress()%></td>
        <td><%=value.getDtaddress()%></td>
        <td><%=value.getJynr()%></td>
        <td><%=value.getZj()%></td>
        <td><%=sdf.format(date)%></td>
        <td><a href='bj.jsp?tel=<%=value.getYhm()%>'><button type="button">编辑</button></a>&nbsp;&nbsp;&nbsp;<a  onclick="tz()"><button type="button" value='<%=value.getName()%>   <%=value.getYhm()%>' id="n">删除</button></a></td>
    </tr>

<%
//            out.print(in);
//            out.print(Function.map.get(in));

        }
    }
%>
</table>
<%--<form action="ss.jsp" method="get">--%>
<%--<p align="center"><input type="text" name="ss"><button>搜索</button></p>--%>
<%--</form>--%>
<p align="center"><a href="sx.jsp?a=1"><button>租金升序排序</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="sx.jsp?a=0"><button>租金降序排序</button></a></p>
</body>
</html>
