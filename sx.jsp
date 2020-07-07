<%--
  Created by IntelliJ IDEA.
  User: asd
  Date: 2020/7/5
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"     import="java.util.Map.Entry" %>
<%@ page import="cn.fvti.Function" %>
<%@ page import="cn.fvti.User" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% if (session.getAttribute("login")==null||!session.getAttribute("login").equals("ok")){
    out.println("<span style=\"float: right\">您尚未登陆，请<a href='index.jsp'>登录</a></span>");
}
    if (session.getAttribute("number")==null){
        return;
    }
    if (session.getAttribute("number")!=null){
        %>
<h1 align="center">租金排序</h1>
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
<%--    <td>操作</td>--%>
    </thead>
<%
    String a = request.getParameter("a");

    List<Map.Entry<String,User>> list = new ArrayList<>(Function.map.entrySet()); //将map的entryset放入list集合
    //对list进行排序，并通过Comparator传入自定义的排序规则
    Collections.sort(list,new Comparator<Map.Entry<String, User>>() {
        @Override
        public int compare(Entry<String, User> o1, Entry<String, User> o2) {
            if (a.equals("0")){
                return (int) (o2.getValue().getZj()-o1.getValue().getZj()); //重写排序规则，小于0表示升序，大于0表示降序
            }else {
                return (int) (o1.getValue().getZj() - o2.getValue().getZj()); //重写排序规则，小于0表示升序，大于0表示降序
            }
        }
    });
    //用迭代器对list中的键值对元素进行遍历
    Iterator<Map.Entry<String, User>> iter = list.iterator();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    while(iter.hasNext()){
        Map.Entry<String, User> item = iter.next();
        String key = item.getKey();
        User value = item.getValue();
        if (key.equals("root")){
            continue;
        }
        Date date = value.getZcsj();
        %>
    <tr>
    <td><%=value.getName()%></td>
    <td><%=key%></td>
    <td><%=value.getSfzh()%></td>
    <td><%=value.getFzr()%></td>
    <td><%=value.getAddress()%></td>
    <td><%=value.getDtaddress()%></td>
    <td><%=value.getJynr()%></td>
    <td><%=value.getZj()%></td>
    <td><%=sdf.format(date)%></td>
    </tr>
        <%
//        out.println("键"+key+"值"+value.getZj());
    }}

%>
</table>
<a href="admin.jsp">返回</a>
</body>
</html>
