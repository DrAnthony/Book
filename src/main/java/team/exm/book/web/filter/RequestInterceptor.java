package team.exm.book.web.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import team.exm.book.web.response.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Component
public class RequestInterceptor implements HandlerInterceptor {
    private Logger log = LoggerFactory.getLogger(RequestInterceptor.class);
    private HttpSession session;
    private ResponseEntity re;
    private PrintWriter writer;
    private ObjectMapper mapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //log.info("request path[{}] uri[{}]",request.getServletPath(),request.getRequestURI());
        /*if(request.getServletPath().equals("/")){
            response.sendRedirect("/index");
            return false;
        }*/
        session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.setContentType("application/json;charset=utf-8");
            writer = response.getWriter();
            mapper = new ObjectMapper();
            re = new ResponseEntity(-1, "登录信息无效");
            writer.print(mapper.writeValueAsString(re));
            //response.sendRedirect("/sign");
            return false;
        }
        return true;
    }
}
