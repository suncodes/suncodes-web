<%--
  Created by IntelliJ IDEA.
  User: sunchuizhe
  Date: 2021/6/29
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>测试 ajax </title>
  </head>
  <body>
    <a href="helloAjax.txt">helloAjax</a>
  </body>
  <script>
    // 1. 获取 a 节点, 并为其添加 onclick 响应函数
    window.onload = function () {
      document.getElementsByTagName("a")[0].onclick = function () {
        // 3. 创建一个 XMLHttpRequest 对象
        var request = new XMLHttpRequest();
        // 4. 准备发送请求的数据: url
        var method = "GET";
        var url = this.href;
        // 5. 调用 XMLHttpRequest 对象的  open 方法
        request.open(method, url);
        // open 之后
        request.setRequestHeader("ContentType", "application/x-www-form-urlencoded");

        // 6. 调用 XMLHttpRequest 对象的 send 方法
        request.send(null);
        // 7. 为 XMLHttpRequest 对象添加 onreadystatechange 响应函数
        request.onreadystatechange = function () {
          // 8. 判断响应是否完成: XMLHttpRequest 对象的 readyState 属性值为 4 的时候
          if (request.readyState === 4) {
            // 9. 再判断响应是否可用: XMLHttpRequest 对象 status 属性值为 200
            if (request.status === 200) {
              console.log(">>>>>>>>>>>");
              // 10. 打印响应结果: responseText
              var elementP = document.createElement("p");
              elementP.innerText = request.responseText;
              document.body.append(elementP);
            }
          }
        };
        // 2. 取消 a 节点的默认行为
        return false
      }
    }
  </script>
</html>
