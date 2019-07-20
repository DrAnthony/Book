package team.exm.book.mapper;

import team.exm.book.entity.Comments;

import java.util.List;

public interface CommentsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(Integer id);

    List<Comments> selectAll();

    int selectAllNum();

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKey(Comments record);
}