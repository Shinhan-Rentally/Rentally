package com.rental.shinhan.filter;

import java.io.IOException;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/*")
public class LoginCheckFilter implements Filter {

    private static final Set<String> PROTECTED_URIS = Set.of(
            "/wishlist/list", "/cart/list", "/order/list",
            "/subscribe/list", "/customer/list", "/address/list"
    );

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String contextPath = req.getContextPath();
        String uri = req.getRequestURI().substring(contextPath.length());

        if (isStaticResource(uri) || uri.startsWith("/customer/login")) {
            chain.doFilter(request, response);
            return;
        }
        
        if (uri.startsWith("/customer/join")) {
        	HttpSession session = req.getSession();
        	if(session.getAttribute("name") == null || session.getAttribute("phone") == null) {
        		res.sendRedirect(contextPath + "/customer/identity");
        		return;
        	}
        }
        
        if (isProtectedUri(uri)) {
            HttpSession session = req.getSession();
            if (session.getAttribute("cust_seq") == null) {
            	session.setAttribute("blockUser", true);
                res.sendRedirect(contextPath + "/customer/login");
                return;
            }
            else {
            	int custGrade = (Integer) session.getAttribute("cust_grade");
            	if(uri.startsWith("/admin") && custGrade != 1) {
            		res.sendRedirect(contextPath + "/error");
                	return;
            	}
            }
        }

        chain.doFilter(request, response);
    }

    private boolean isStaticResource(String uri) {
        return uri.startsWith("/resources/");
    }

    private boolean isProtectedUri(String uri) {
        return PROTECTED_URIS.contains(uri) || uri.startsWith("/payment") || uri.startsWith("/admin");
    }

    @Override
    public void init(FilterConfig filterConfig) {
        // Initialization if needed
    }

    @Override
    public void destroy() {
        // Cleanup if needed
    }
}
