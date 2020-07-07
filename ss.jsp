<%@ page import="cn.fvti.Function" %>
<%@ page import="cn.fvti.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sun.org.apache.xalan.internal.xsltc.dom.KeyIndex" %><%--
  Created by IntelliJ IDEA.
  User: asd
  Date: 2020/7/6
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    request.setCharacterEncoding("utf-8");
    String ss = request.getParameter("ss");

%>
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
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//    Function.getCityId()
//    for (String in: Function.getKeyList((HashMap<String, User>) Function.map,ss)){
//        User value = Function.map.get(in);
//        Date date = value.getZcsj();
//    List<Map.Entry<String,User>> list = new ArrayList<>(Function.map.entrySet());
//    Iterator<Map.Entry<String, User>> iter = list.iterator();
//    List<String> keyList = new ArrayList();
//    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//    for(String in: Function.map.keySet()){
//                    if(Function.map.get(in).equals(ss)){
//                          keyList.add(in);
////                        User value = Function.map.get(getKey);
////                        Date date = value.getZcsj();
//                    }}
//keyList(Function.map,ss);
    Function function = new Function();
    ArrayList arr = function.valueGetKey(Function.map, ss);
    if(!arr.isEmpty()) {
        for(int i=0; i<arr.size(); i++) {
            out.print(arr.get(i));
            String key = (String) arr.get(i);
        }
    }
%>


<%--    <tr>--%>
<%--        <td><%=value.getName()%></td>--%>
<%--        <td><%=in%></td>--%>
<%--        <td><%=value.getSfzh()%></td>--%>
<%--        <td><%=value.getFzr()%></td>--%>
<%--        <td><%=value.getAddress()%></td>--%>
<%--        <td><%=value.getDtaddress()%></td>--%>
<%--        <td><%=value.getJynr()%></td>--%>
<%--        <td><%=value.getZj()%></td>--%>
<%--        <td><%=sdf.format(date)%></td>--%>
<%--    </tr>--%>
<%  } %>
<%--            }else {--%>
<%--                        out.print("没找到！");--%>
<%--            }--%>
<%--        }--%>


<%--    %>--%>
</table>
</body>
</html>
