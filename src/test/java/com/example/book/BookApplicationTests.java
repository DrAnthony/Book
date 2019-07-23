package com.example.book;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import sun.nio.cs.US_ASCII;
import team.exm.book.BookApplication;
import team.exm.book.service.UserService;
import team.exm.book.tool.PasswordEncrypt;
import team.exm.book.web.request.UserVO;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = BookApplication.class)
public class BookApplicationTests {
    @Autowired
    UserService us;

    //@Test
    public void contextLoads() {
        String[] map = {
                "123456",
                "abcdef",
                "123abc",
                "12345.",
                "abcde."
        };
        for (int i = 0; i < 5; i++) {
            System.out.println("加密前：" + map[i]);
            try {
                System.out.println("加密后：" + PasswordEncrypt.encodeByMd5(map[i], 10000));
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void text1() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        UserVO user = new UserVO();
        user.setPhone("13611111111");
        user.setPwd(PasswordEncrypt.encodeByMd5("123456", 10000));
        System.out.println(us.selectByPhone(user).toString());
    }

}
