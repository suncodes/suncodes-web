<%@ page import="beans.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: sunchuizhe
  Date: 2021/7/11
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>el表达式</title>
</head>
<body>
${"a"}
<%="a"%>
<br/>

<%
    Person person = new Person();
    person.setName("国哥好帅！");
    person.setPhones(new String[]{"18610541354","18688886666","18699998888"});

    List<String> cities = new ArrayList<String>();
    cities.add("北京");
    cities.add("上海");
    cities.add("深圳");
    person.setCities(cities);

    Map<String,Object> map = new HashMap<>();
    map.put("key1","value1");
    map.put("key2","value2");
    map.put("key3","value3");
    person.setMap(map);

    pageContext.setAttribute("p", person);
%>
<hr>
输出 Person ：${ p } <br/>
<hr>
输出 Person 的 name 属性：${ p.name } <br/>
<hr>
输出 Person 的 phones 数组属性：${ p.phones[1] } <br/>
<hr>
输出 Person 的 cities List属性：${ p.cities[0] } <br/>
输出 Person 的 cities List属性：${ p.cities.get(0) } <br/>
<hr>
输出 Person 的 map 属性：${ p.map.key1 } <br/>
输出 Person 的 map 属性：${ p.map["key1"] } <br/>
输出 Person 的 map 属性：${ p.map.get("key1") } <br/>
<hr>

${ 12 == 12 } 或 ${ 12 eq 12 } <br>
${ 12 != 12 } 或 ${ 12 ne 12 } <br>
${ 12 < 12 } 或 ${ 12 lt 12 } <br>
${ 12 > 12 } 或 ${ 12 gt 12 } <br>
${ 12 <= 12 } 或 ${ 12 le 12 } <br>
${ 12 >= 12 } 或 ${ 12 ge 12 } <br>
<hr>
${ 12 == 12 && 12 > 11 } 或 ${ 12 == 12 and 12 > 11 } <br>
${ 12 == 12 || 12 > 11 } 或 ${ 12 == 12 or 12 > 11 } <br>
${ ! true } 或 ${ not true } <br>
<hr>
${ 12 + 12 } <br>
${ 12 - 12 } <br>
${ 12 * 12 } <br>
${ 18 / 12 } 或 ${ 18 div 12 }<br>
${ 18 % 12 } 或 ${ 18 mod 12 } <br>

<hr/>
<%
    // 1、值为null值的时候，为空
    request.setAttribute("emptyNull", null);
    // 2、值为空串的时候，为空
    request.setAttribute("emptyStr", "");
    // 3、值是Object类型数组，长度为零的时候
    request.setAttribute("emptyArr", new Object[]{});
    // 4、list集合，元素个数为零
    List<String> list = new ArrayList<>();
    // list.add("abc");
    request.setAttribute("emptyList", list);
    // 5、map集合，元素个数为零
    Map<String, Object> map1 = new HashMap<String, Object>();
    // map.put("key1", "value1");
    request.setAttribute("emptyMap", map1);
%>
${ empty emptyNull } <br/>
${ empty emptyStr } <br/>
${ empty emptyArr } <br/>
${ empty emptyList } <br/>
${ empty emptyMap } <br/>
<hr>
${ 12 != 12 ? "国哥帅呆":"国哥又骗人啦" }

<hr/>
<%
    pageContext.setAttribute("key1", "pageContext1");
    pageContext.setAttribute("key2", "pageContext2");
    request.setAttribute("key2", "request");
    session.setAttribute("key2", "session");
    application.setAttribute("key2", "application");
%>
requestScope.key2: ${requestScope.key2}

<hr/>
<%--
request.getScheme() 它可以获取请求的协议
request.getServerName() 获取请求的服务器ip或域名
request.getServerPort() 获取请求的服务器端口号
getContextPath() 获取当前工程路径
request.getMethod() 获取请求的方式（GET或POST）
request.getRemoteHost()  获取客户端的ip 地址
session.getId() 获取会话的唯一标识
--%>
<%
    pageContext.setAttribute("req", request);
%>
<%=request.getScheme() %> <br>
1.协议： ${ req.scheme }<br>
2.服务器ip：${ pageContext.request.serverName }<br>
3.服务器端口：${ pageContext.request.serverPort }<br>
4.获取工程路径：${ pageContext.request.contextPath }<br>
5.获取请求方法：${ pageContext.request.method }<br>
6.获取客户端ip地址：${ pageContext.request.remoteHost }<br>
7.获取会话的id编号：${ pageContext.session.id }<br>


</body>
</html>
