package team.exm.book.mapper;

import team.exm.book.entity.Captcha;

public interface CaptchaMapper {
    Captcha selectByPrimaryKey(Integer id);

    Captcha selectByCaptcha(String captcha);

    Captcha selectByUserId(Integer id);

    int insert(Captcha captcha);

    void update(Captcha captcha);

    void deleteByUserId(Integer id);
}
