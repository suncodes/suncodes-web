package servlets;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.*;
import java.util.Enumeration;

public class HelloServlet implements Servlet {

    private transient ServletConfig servletConfig;

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        this.servletConfig = servletConfig;
        System.out.println("servlet 初始化");

        // 1、可以获取Servlet 程序的别名servlet-name 的值
        System.out.println(servletConfig.getServletName());

        // 2、获取初始化参数init-param
        Enumeration<String> initParameterNames = servletConfig.getInitParameterNames();
        while (initParameterNames.hasMoreElements()) {
            System.out.println(initParameterNames.nextElement());
        }
        // 3、获取ServletContext 对象
        System.out.println(servletConfig.getServletContext());
    }

    @Override
    public ServletConfig getServletConfig() {
        return servletConfig;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse)
            throws ServletException, IOException {

        ServletContext servletContext = getServletConfig().getServletContext();
        // 1、获取web.xml 中配置的上下文参数context-param
        Enumeration<String> initParameterNames = servletContext.getInitParameterNames();
        while (initParameterNames.hasMoreElements()) {
            System.out.println(initParameterNames.nextElement());
        }
        // 2、获取当前的工程路径，格式: /工程路径
        System.out.println(servletContext.getContextPath());
        // 3、获取工程部署后在服务器硬盘上的绝对路径
        System.out.println(servletContext.getRealPath("/"));
        // 4、像Map 一样存取数据
        servletContext.setAttribute("", "");
        InputStream resourceAsStream = servletContext.getResourceAsStream("/index.jsp");
        System.out.println(">>>>>>>>" + resourceAsStream);
    }

    @Override
    public String getServletInfo() {
        return servletConfig.getServletContext().getServerInfo();
    }

    @Override
    public void destroy() {
        System.out.println("servlet 销毁");
    }
}
