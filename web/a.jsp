<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/10
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="500.jsp" %>
<html>
<head>
    <title>JSP学习</title>
</head>
<body>
<p>hehe</p>
  <p>haha</p>
<%--<%=1/0 %>--%>


<%--1、声明类属性--%>
<%!
    private Integer id;
    private String name;
    private static Map<String,Object> map;
%>
<%--2、声明static静态代码块--%>
<%!
    static {
        map = new HashMap<String,Object>();
        map.put("key1", "value1");
        map.put("key2", "value2");
        map.put("key3", "value3");
    }
%>
<%--3、声明类方法--%>
<%!
    public int abc(){
        return 12;
    }
%>
<%--4、声明内部类--%>
<%!
    public static class A {
        private Integer id = 12;
        private String abc = "abc";
    }
%>

<%=12%>
<%=12.12%>
<%="呵呵"%>
<%=map%>
<%=abc()%>

<table border="1" cellspacing="0">
    <% for (int i = 1; i < 10; i++) { %>
    <tr>
        <td>呵呵+<%=i%></td>
    </tr>
    <%} %>

</table>

<%
    // 九大内置对象
    System.out.println(request);
    System.out.println(response);
    System.out.println(session);
    System.out.println(application);
    System.out.println(config);
    System.out.println(out);
    System.out.println(pageContext);
    System.out.println(page);
    System.out.println("exception");
%>

<%
    // 往四个域中都分别保存了数据
    pageContext.setAttribute("key", "pageContext");
    request.setAttribute("key", "request");
    session.setAttribute("key", "session");
    application.setAttribute("key", "application");
%>
pageContext域是否有值：<%=pageContext.getAttribute("key")%> <br>
request域是否有值：<%=request.getAttribute("key")%> <br>
session域是否有值：<%=session.getAttribute("key")%> <br>
application域是否有值：<%=application.getAttribute("key")%> <br>
<%
    request.getRequestDispatcher("/b.jsp").forward(request, response);
%>
<%--
    <jsp:forward page=""></jsp:forward> 是请求转发标签，它的功能就是请求转发
        page 属性设置请求转发的路径
--%>
<%--<jsp:forward page="/scope2.jsp"></jsp:forward>--%>

</body>
</html>
