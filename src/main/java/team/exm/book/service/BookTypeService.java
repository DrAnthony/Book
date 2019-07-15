package team.exm.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.exm.book.entity.BookType;
import team.exm.book.mapper.BookTypeMapper;
import team.exm.book.web.response.ResponseEntity;

import java.util.List;

@Service
public class BookTypeService {
    private ResponseEntity re;
    @Autowired
    BookTypeMapper btm;

    public ResponseEntity getType() {
        List<BookType> type = btm.selectAll();
        re = new ResponseEntity(1, "成功", type);
        return re;
    }
}
