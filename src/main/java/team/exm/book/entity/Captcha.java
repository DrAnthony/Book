package team.exm.book.entity;

import java.util.Date;

public class Captcha {
    private Integer id;
    private User sId;
    private String captcha;
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getsId() {
        return sId;
    }

    public void setsId(User sId) {
        this.sId = sId;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Captcha{" +
                "id=" + id +
                ", sId=" + sId +
                ", captcha='" + captcha + '\'' +
                ", date=" + date +
                '}';
    }
}
