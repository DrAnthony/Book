package team.exm.book.web.request;

import team.exm.book.entity.Comments;

public class CommentsVO extends Comments {
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
