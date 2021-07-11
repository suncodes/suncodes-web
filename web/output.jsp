<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/23
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--    <%--%>
<%--        out.write("12");--%>
<%--        // 尽量使用 out.print--%>
<%--        out.print(13);--%>
<%--        response.getWriter().print("he");--%>
<%--    %>--%>

<h1 style="text-align: center">九九乘法表</h1>
<table border="0" cellspacing="0" style="margin: 0 auto">
    <%
        for (int i = 1; i < 10; i++) {
    %>
    <tr>
        <%
            for (int j = 1; j < 10; j++) {
                if (j < i) {
        %>
        <td style="padding-right: 30px">
            <%=j + " × " + i + " = " + i * j%>
        </td>
        <%
                }
            }
        %>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
