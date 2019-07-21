package team.exm.book.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import team.exm.book.entity.User;
import team.exm.book.service.UserService;
import team.exm.book.web.request.UserVO;
import team.exm.book.web.response.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/login")
public class LoginController {
    private Logger log = LoggerFactory.getLogger(RegisterController.class);
    private ResponseEntity re;
    private HttpSession session;
    @Autowired
    UserService us;

    @PostMapping("/login.do")
    public ResponseEntity login(@RequestBody UserVO user, HttpServletRequest request) {
        ResponseEntity re = null;
        try {
            re = us.selectByPhone(user);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("md5加密错误");
        }
        if (re.getCode() == 1) {
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
