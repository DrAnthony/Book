package team.exm.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.exm.book.entity.Press;
import team.exm.book.mapper.PressMapper;
import team.exm.book.web.response.ResponseEntity;

import java.util.List;

@Service
public class PressService {
    private ResponseEntity re;
    @Autowired
    PressMapper pm;

    public ResponseEntity getPress() {
        List<Press> press = pm.selectAll();
        re = new ResponseEntity(1, "成功", press);
        return re;
    }
}
