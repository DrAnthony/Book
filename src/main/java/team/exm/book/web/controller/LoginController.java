package team.exm.book.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import team.exm.book.entity.User;
import team.exm.book.service.CaptchaService;
import team.exm.book.service.UserService;
import team.exm.book.web.request.UserVO;
import team.exm.book.web.response.ResponseEntity;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

@RestController
@RequestMapping("/login")
public class LoginController {
    private Logger log = LoggerFactory.getLogger(RegisterController.class);
    private ResponseEntity re;
    private HttpSession session;
    @Autowired
    UserService us;
    @Autowired
    CaptchaService cs;

    @PostMapping("/login.do")
    public ResponseEntity login(@RequestBody UserVO user, HttpServletRequest request, HttpServletResponse response) {
        ResponseEntity re = null;
        try {
            re = us.selectByPhone(user);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            log.info("UnsupportedEncodingException:" + e.getMessage());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            log.info("NoSuchAlgorithmException:" + e.getMessage());
        }

        if (re.getCode() == 1) {
            if (user.getRemember() == 1) {
                String cookieStr = cs.addCaptcha(user);
                if (cookieStr == null) {
                    re = new ResponseEntity(0, "系统错误");
                    return re;
                } else {
                    response.addCookie(new Cookie("CAPTCHA", cookieStr));
                }
            }
            session = request.getSession();
            session.setAttribute("user", ((User) re.getData()).getId());
            re = us.updateTime(re);
        }
        return re;
    }

    @GetMapping("/logout.do")
    public ResponseEntity logout(HttpServletRequest request) {
        session = request.getSession();
        session.removeAttribute("user");
        re = new ResponseEntity(1, "成功退出");
        return re;
    }

    @PostMapping("/forget")
    public ResponseEntity forgetPwd(@RequestBody UserVO user) {
        return us.forget(user);
    }
}
