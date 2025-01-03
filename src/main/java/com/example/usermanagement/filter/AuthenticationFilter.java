package com.example.usermanagement.filter;

import com.example.usermanagement.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private static final List<String> PUBLIC_URLS = Arrays.asList("/login", "/signup", "/index.jsp", "/container.jsp");

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String requestURI = httpRequest.getRequestURI();
        boolean isPublicResource = PUBLIC_URLS.stream().anyMatch(requestURI::endsWith);

        if (isPublicResource) {
            chain.doFilter(request, response);
            return;
        }

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        if (!isLoggedIn) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        boolean isAdminResource = requestURI.contains("/admin/");
        if (isAdminResource && !"admin".equals(user.getRole())) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/clientdashboard");
            return;
        }

        chain.doFilter(request, response);
    }
}

