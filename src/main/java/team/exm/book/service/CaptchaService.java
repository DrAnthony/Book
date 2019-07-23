package team.exm.book.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.exm.book.entity.Captcha;
import team.exm.book.entity.User;
import team.exm.book.mapper.CaptchaMapper;
import team.exm.book.mapper.UserMapper;
import team.exm.book.tool.PasswordEncrypt;
import team.exm.book.web.request.UserVO;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

@Service
public class CaptchaService {
    private Logger log = LoggerFactory.getLogger(CaptchaService.class);
    @Autowired
    UserMapper um;
    @Autowired
    CaptchaMapper cm;

    public String addCaptcha(UserVO temp) {
        User user = um.selectByPhone(temp.getPhone());
        Captcha c = cm.selectByUserId(user.getId());
        if (c != null) {
            if (checkDate(c.getDate())) {
                return c.getCaptcha();
            }
            log.info("用户 id [{}} 的自动登录验证 [{}} 已过期", user.getId(), c.getCaptcha());
        }
        String captchaStr;
        try {
            captchaStr = PasswordEncrypt.encodeByMd5(user.getPhone() + user.getPwd(), 1);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            log.error("NoSuchAlgorithmException:" + e.getMessage());
            return null;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            log.error("UnsupportedEncodingException:" + e.getMessage());
            return null;
        }
        Captcha captcha = new Captcha();
        captcha.setsId(user);
        captcha.setCaptcha(captchaStr);
        captcha.setDate(new Date());
        delete(user.getId());
        cm.insert(captcha);
        return captchaStr;
    }

    public Captcha getCaptcha(String captcha) {
        if (captcha == null) {
            log.warn("getCaptcha(): the param is null");
            return null;
        }
        Captcha temp = cm.selectByCaptcha(captcha);
        if (temp == null) {
            return null;
        }
        if (checkDate(temp.getDate())) {
            return temp;
        } else {
            return null;
        }
    }

    public void delete(Integer id) {
        if (cm.selectByUserId(id) != null) {
            cm.deleteByUserId(id);
        }
    }

    public boolean checkDate(Date temp) {
        Date date = new Date();
        long day = (date.getTime() - temp.getTime()) / (7 * 24 * 60 * 60 * 1000);
        if (day <= 7) {
            return true;
        } else {
            return false;
        }
    }
}
