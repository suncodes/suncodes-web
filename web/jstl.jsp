<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="beans.Student" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sunchuizhe
  Date: 2021/7/11
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSTL</title>
</head>
<body>
<hr/>
保存之前：${ sessionScope.abc } <br/>
<c:set scope="session" var="abc" value="abcValue">
</c:set>
保存之后：${ sessionScope.abc } <br/>
<hr/>

<%--
   ii.<c:if />
     if标签用来做if判断。
     test属性表示判断的条件（使用EL表达式输出）
--%>
<c:if test="${12==12}">
    <h1>呵呵</h1>
</c:if>
<hr/>

<%--
iii.<c:choose> <c:when> <c:otherwise>标签
作用：多路判断。跟switch ... case .... default非常接近

choose标签开始选择判断
when标签表示每一种判断情况
    test属性表示当前这种判断情况的值
otherwise标签表示剩下的情况

<c:choose> <c:when> <c:otherwise>标签使用时需要注意的点：
    1、标签里不能使用html注释，要使用jsp注释
    2、when标签的父标签一定要是choose标签
--%>
<%
    request.setAttribute("height", 180);
%>
<c:choose>
    <%-- 这是html注释 --%>
    <c:when test="${ requestScope.height > 190 }">
        <h2>小巨人</h2>
    </c:when>
    <c:when test="${ requestScope.height > 180 }">
        <h2>很高</h2>
    </c:when>
    <c:when test="${ requestScope.height > 170 }">
        <h2>还可以</h2>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${requestScope.height > 160}">
                <h3>大于160</h3>
            </c:when>
            <c:when test="${requestScope.height > 150}">
                <h3>大于150</h3>
            </c:when>
            <c:when test="${requestScope.height > 140}">
                <h3>大于140</h3>
            </c:when>
            <c:otherwise>
                其他小于140
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
<hr/>

<%--1.遍历 1 到 10， 输出
  begin 属性设置开始的索引
  end 属性设置结束的索引
  var 属性表示循环的变量(也是当前正在遍历到的数据)
  for (int i = 1; i < 10; i++)
--%>
<c:forEach var="i" begin="1" end="10">
    ${i}
</c:forEach>
<hr/>

<%-- 2.遍历 Object 数组
  for (Object item: arr)
  items 表示遍历的数据源（遍历的集合）
  var 表示当前遍历到的数据
--%>
<%
    List<String> ii = new ArrayList<>();
    ii.add("aa");
    ii.add("bb");
//    request.setAttribute("ii", ii);
%>
<%--
  使用 EL 表达式，必须在域对象内，不能是自定义的对象，比如 ii 变量不能直接访问
  但是 JSP 代码块可以
--%>
<c:forEach var="i" items="<%=ii%>">
    ${i}
</c:forEach>
<hr/>

<%
    Map<String,Object> map = new HashMap<String, Object>();
    map.put("key1", "value1");
    map.put("key2", "value2");
    map.put("key3", "value3");
    request.setAttribute("map", map);
%>
<c:forEach items="${map}" var="e">
    ${e.key} ======== ${e.value} <br/>
</c:forEach>
<hr/>

<%--
  items 表示遍历的集合
  var 表示遍历到的数据
  begin 表示遍历的开始索引值
  end 表示结束的索引值
  step 属性表示遍历的步长值
  varStatus 属性表示当前遍历到的数据的状态
  for（int i = 1; i < 10; i+=2）
--%>
<%
    List<Student> studentList = new ArrayList<Student>();
    for (int i = 1; i <= 10; i++) {
        studentList.add(new Student(i, "username" + i, "pass" + i, 18 + i, "phone" + i));
    }
    request.setAttribute("stus", studentList);
%>
<table border="1" cellspacing="0">
    <tr>
        <th>编号</th>
        <th>用户名</th>
        <th>密码</th>
        <th>年龄</th>
        <th>电话</th>
        <th>操作</th>
    </tr>
    <c:forEach begin="2" end="7" step="2" varStatus="status" items="${requestScope.stus}" var="stu">
        <tr>
            <td>${stu.id}</td>
            <td>${stu.username}</td>
            <td>${stu.password}</td>
            <td>${stu.age}</td>
            <td>${stu.phone}</td>
            <td>${status.step}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
