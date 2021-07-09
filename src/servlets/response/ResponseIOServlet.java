package servlets.response;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.*;

public class ResponseIOServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        System.out.println( resp.getCharacterEncoding() );//默认ISO-8859-1

//        // 设置服务器字符集为UTF-8
//        resp.setCharacterEncoding("UTF-8");
//        // 通过响应头，设置浏览器也使用UTF-8字符集
//        resp.setHeader("Content-Type", "text/html; charset=UTF-8");

        // 它会同时设置服务器和客户端都使用UTF-8字符集，还设置了响应头
        // 此方法一定要在获取流对象之前调用才有效
        // 对于服务器声明自己返回什么，xhr会忽略


//        resp.setContentType("text/html; charset=UTF-8");
//
////        System.out.println( resp.getCharacterEncoding() );
//
////        要求 ： 往客户端回传 字符串 数据。
//        PrintWriter writer = resp.getWriter();
//        String docType =
//                "<!DOCTYPE html>\n" +
//                        "<html>\n" +
//                        "<head><title>" + "21" + "</title></head>\n" +
//                        "<body bgcolor=\"#f0f0f0\">\n" +
//                        "<h1 align=\"center\">" + "21" + "</h1>\n" +
//                        "<p>当前时间是：" + "" + "</p>\n";
////        writer.write("{\"a\": \"b\"}");
//        writer.write(docType);

//        resp.sendRedirect("http://localhost:8080");

        ServletOutputStream outStream = resp.getOutputStream();
        InputStream resourceAsStream = ResponseIOServlet.class.getClassLoader().getResourceAsStream("logo.gif");
        BufferedImage img = ImageIO.read(resourceAsStream);
        ImageIO.write(img, "png", outStream);
        System.out.println("--------");
    }
}
