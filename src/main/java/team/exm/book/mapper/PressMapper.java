package team.exm.book.mapper;

import team.exm.book.entity.Press;

import java.util.List;

public interface PressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Press record);

    int insertSelective(Press record);

    Press selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Press record);

    int updateByPrimaryKey(Press record);

    List<Press> selectAll();
}