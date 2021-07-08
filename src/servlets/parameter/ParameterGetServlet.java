package servlets.parameter;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;

public class ParameterGetServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 两种方式获取 GET 参数
        // GET 参数只能是 查询字符串的形式发送
        String characterEncoding = req.getCharacterEncoding();
        System.out.println("characterEncoding: " + characterEncoding);
        Map<String, String[]> parameterMap = req.getParameterMap();
        for (Map.Entry<String, String[]> stringEntry : parameterMap.entrySet()) {
            System.out.println(new String(stringEntry.getKey().getBytes("iso-8859-1"), "UTF-8"));
            for (String s : stringEntry.getValue()) {
                System.out.println(new String(s.getBytes("iso-8859-1"), "UTF-8"));
            }
        }

        String queryString = req.getQueryString();
        System.out.println(queryString);

        // getInputStream 请求体的内容
        // GET 请求是可以接收请求体的，但是 xhr 就是发送不出来而已
        ServletInputStream ris = req.getInputStream();
        StringBuilder content = new StringBuilder();
        byte[] b = new byte[1024];
        int lens = -1;
        while ((lens = ris.read(b)) > 0) {
            content.append(new String(b, 0, lens));
        }
        String strcont = content.toString();
        System.out.println(strcont);
    }
}
