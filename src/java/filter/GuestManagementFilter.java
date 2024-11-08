//package filter;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebFilter(filterName = "GuestManagementFilter", urlPatterns = {
//    "/addGuest",
//    "/editGuest",
//    "/listGuest", 
//    "/viewGuest",
//    "/hiddenListGuest",
//    "/addGuest.jsp",
//    "/editGuest.jsp", 
//    "/listGuest.jsp",
//    "/viewGuest.jsp",
//    "/hiddenListGuest.jsp"
//})
//public class GuestManagementFilter implements Filter {
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest req = (HttpServletRequest) request;
//        HttpServletResponse res = (HttpServletResponse) response;
//        HttpSession session = req.getSession();
//
//        // Lấy role từ session
//        Integer role = (Integer) session.getAttribute("role");
//        
//        // Kiểm tra role
//        if (role == null || (role != 1 && role != 2)) {
//            // Nếu không có quyền truy cập, chuyển hướng về trang home
//            res.sendRedirect("homePage");
//        } else {
//            // Nếu có quyền truy cập, cho phép tiếp tục
//            chain.doFilter(request, response);
//        }
//    }
//
//    @Override
//    public void destroy() {
//    }
//}