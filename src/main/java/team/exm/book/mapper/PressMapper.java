package team.exm.book.mapper;

import org.springframework.stereotype.Repository;
import team.exm.book.entity.Press;

import java.util.List;

@Repository
public interface PressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Press record);

    int insertSelective(Press record);

    Press selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Press record);

    int updateByPrimaryKey(Press record);

    List<Press> selectAll();
}