<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/8
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GET请求参数测试</title>
</head>
<body>
<form action="/parameterGetServlet" method="get">
    <label>用户名：<input type="text" name="username"/></label><br/>
    <label>密码：<input type="text" name="password"/></label><br/>
    <label>其他：<input type="text" name="other"/></label><br/>
    <button type="submit">提交</button>
</form>


<form action="/parameterPostServlet" method="post">
    <label>用户名：<input type="text" name="username"/></label><br/>
    <label>密码：<input type="text" name="password"/></label><br/>
    <label>其他：<input type="text" name="other"/></label><br/>
    <button type="submit">提交</button>
</form>
</body>
</html>
