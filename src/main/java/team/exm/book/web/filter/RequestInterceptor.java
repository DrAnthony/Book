package team.exm.book.web.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import team.exm.book.entity.Captcha;
import team.exm.book.service.CaptchaService;
import team.exm.book.service.UserService;
import team.exm.book.web.response.ResponseEntity;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.net.URLDecoder;

@Component
public class RequestInterceptor implements HandlerInterceptor {
    private Logger log = LoggerFactory.getLogger(RequestInterceptor.class);
    private HttpSession session;
    private ResponseEntity re;
    private PrintWriter writer;
    private ObjectMapper mapper;

    @Autowired
    CaptchaService cs;
    @Autowired
    UserService us;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //log.info("request path[{}] uri[{}]", request.getServletPath(), request.getRequestURI());
        session = request.getSession();
        re = new ResponseEntity(-1, "登录信息无效");
        //session 存在用户信息 交给Controller
        if (session.getAttribute("user") == null) {
            //session 不存在用户信息，检查cookie
            Cookie[] cookies = request.getCookies();
            String cookieStr = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("CAPTCHA")) {
                        //log.info("the cookie name is [{}], value is [{}]", cookie.getName(), cookie.getValue());
                        //cookieStr = cookie.getValue();
                        //对前端传入的特殊字符解码
                        cookieStr = URLDecoder.decode(cookie.getValue(), "UTF-8");
                        break;
                    }
                }
                if (cookieStr != null) {
                    Captcha captcha = cs.getCaptcha(cookieStr);
                    if (captcha != null) {
                        session.setAttribute("user", captcha.getsId().getId());
                        if (!request.getServletPath().equals("/captcha")) {
                            return true;
                        }
                        re.setCode(1);
                        re.setMsg("自动登录核验成功");
                        re.setData(us.clearPassword(captcha.getsId()));
                    }
                    log.info("cookie is wrong:the request captcha is [{}]", cookieStr);
                }
            }
            response.setContentType("application/json;charset=utf-8");
            writer = response.getWriter();
            mapper = new ObjectMapper();
            writer.print(mapper.writeValueAsString(re));

            //response.sendRedirect("/sign");
            return false;
        }
        if (request.getServletPath().equals("/captcha")) {
            re = us.selectById((Integer) session.getAttribute("user"));
            response.setContentType("application/json;charset=utf-8");
            writer = response.getWriter();
            mapper = new ObjectMapper();
            writer.print(mapper.writeValueAsString(re));
            return false;
        }
        return true;
    }
}
