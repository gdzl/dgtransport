package com.paxonpilot.dgtransport.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.AppContant;

public class loginFilter implements Filter {

    private static final String FILTER_REQUEST = "session_filter_request";

    private static final String[] ESCAPE_URIS = {"/sys/login"};

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {//map结构不是string结构
        if (request != null && request.getAttribute(FILTER_REQUEST) != null) {

            chain.doFilter(request, response);

        } else {

            request.setAttribute(FILTER_REQUEST, Boolean.TRUE);//增加属性，filter获取到了request


            HttpServletRequest httpRequest = (HttpServletRequest) request;

            HttpServletResponse httpResponse = (HttpServletResponse) response;


            HttpSession session = httpRequest.getSession();


            User userContext = (User) session.getAttribute(AppContant.USER_CONTEXT);

            if (userContext == null && !isLoginURI(httpRequest.getRequestURI(), httpRequest)) {


                String type = httpRequest.getHeader("X-Requested-With");


                if ("XMLHttpRequest".equalsIgnoreCase(type)) {//ajax请求

                    httpResponse.setHeader("sessionstatus", "timeout");
                    PrintWriter out = httpResponse.getWriter();
                    out.print("");
                    out.print("XMLHttpRequest为真");
                } else {

                    String toUrl = httpRequest.getRequestURI();

                    String[] urls = toUrl.split("/");

                    String realUrl = "";
                    for (int i = 2; i < urls.length; i++) {
                        realUrl += "/" + urls[i].trim();

                    }
                    System.out.println("httpRequest.getQueryString():" + httpRequest.getQueryString());
                    if (!StringUtils.isEmpty(httpRequest.getQueryString())) {

                        realUrl += "?" + httpRequest.getQueryString();

                    }
                    session.setAttribute(AppContant.LOGIN_PATH, realUrl);
                    httpRequest.getRequestDispatcher("/index.jsp").forward(request, response);
                }

                return;
            }

            chain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

    private boolean isLoginURI(String requestURI, HttpServletRequest request) {

        String path = request.getContextPath();

        if (path.equalsIgnoreCase(requestURI) || (path + "/").equalsIgnoreCase(requestURI)) {

            return true;
        }
        for (String url : ESCAPE_URIS) {

            if (requestURI != null && requestURI.indexOf(url) >= 0) {
                return true;
            }
        }

        return false;
    }

}
