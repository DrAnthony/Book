package team.exm.book.web.request;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import team.exm.book.entity.User;

@Component
public class UserVO extends User {
    private String code;
    private String newPwd;
    private Integer remember;//0 不记住密码，1 记住密码

    private Integer operation = -1;//0 发送短信，1 核实验证码，3 重置密码;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNewPwd() {
        return newPwd;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }

    public Integer getOperation() {
        return operation;
    }

    public void setOperation(Integer operation) {
        this.operation = operation;
    }

    public Integer getRemember() {
        return remember;
    }

    public void setRemember(Integer remember) {
        this.remember = remember;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "code='" + code + '\'' +
                ", newPwd='" + newPwd + '\'' +
                ", remember=" + remember +
                ", operation=" + operation +
                '}';
    }
}
