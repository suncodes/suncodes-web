package servlets.parameter;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;

public class ParameterPostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Map<String, String[]> parameterMap = req.getParameterMap();
        for (Map.Entry<String, String[]> stringEntry : parameterMap.entrySet()) {
            System.out.println(stringEntry.getKey());
            for (String s : stringEntry.getValue()) {
                System.out.println(s);
            }
        }

        System.out.println("------------------");
        // 当 URL 后面的参数不为null
        String queryString = req.getQueryString();
        System.out.println(queryString);

        System.out.println("------------------");
        // getInputStream 请求体的内容
        // GET 请求是可以接收请求体的，但是 xhr 就是发送不出来而已
        byte[] body = readBody(req);
        String textBody = new String(body, "UTF-8");
        System.out.println(textBody);
    }

    private byte[] readBody(HttpServletRequest request)
            throws IOException{
        int formDataLength = request.getContentLength();
        DataInputStream dataStream = new DataInputStream(request.getInputStream());
        byte body[] = new byte[formDataLength];
        int totalBytes = 0;
        while (totalBytes < formDataLength) {
            int bytes = dataStream.read(body, totalBytes, formDataLength);
            totalBytes += bytes;
        }
        return body;
    }
}
