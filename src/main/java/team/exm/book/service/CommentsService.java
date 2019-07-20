package team.exm.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.exm.book.entity.Comments;
import team.exm.book.entity.User;
import team.exm.book.mapper.CommentsMapper;
import team.exm.book.mapper.UserMapper;
import team.exm.book.web.request.CommentsVO;
import team.exm.book.web.response.ResponseEntity;

import java.util.List;

@Service
public class CommentsService {
    private ResponseEntity re;
    @Autowired
    CommentsMapper cm;
    @Autowired
    UserMapper um;

    public ResponseEntity addComments(Integer user, String comments) {
        if (user == null | um.selectByPrimaryKey(user) == null) {
            re = new ResponseEntity(0, "当前用户信息无效");
        } else if (comments == null || comments.equals("")) {
            re = new ResponseEntity(0, "评论内容无效");
        } else {
            Comments cms = new Comments();
            cms.setsId(new User());
            cms.getsId().setId(user);
            cms.setContent(comments);
            cm.insertSelective(cms);
            re = new ResponseEntity(1, "成功");
        }
        return re;
    }

    public ResponseEntity getComments(CommentsVO commentsVO) {
        if (commentsVO.getUserId() == null) {
            re = new ResponseEntity(0, "当前用户未登录");
            return re;
        }
        if (um.selectByPrimaryKey(commentsVO.getUserId()) == null) {
            re = new ResponseEntity(0, "当前用户无效");
            return re;
        }
        if (um.selectByPrimaryKey(commentsVO.getUserId()).getRole() != 0) {
            re = new ResponseEntity(0, "权限不足");
            return re;
        }

        List<Comments> list = cm.selectAll();
        if (list.size() == 0) {
            re = new ResponseEntity(0, "未查询到结果");
        } else {
            re = new ResponseEntity(1, String.valueOf(cm.selectAllNum()), list);
        }
        return re;
    }
}
