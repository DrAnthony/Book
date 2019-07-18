package team.exm.book.mapper;

import org.springframework.stereotype.Repository;
import team.exm.book.entity.Comments;

@Repository
public interface CommentsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKey(Comments record);
}