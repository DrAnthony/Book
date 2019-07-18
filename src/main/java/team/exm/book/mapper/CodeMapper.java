package team.exm.book.mapper;

import org.springframework.stereotype.Repository;
import team.exm.book.entity.Code;

@Repository
public interface CodeMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Code record);

    int insertSelective(Code record);

    Code selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Code record);

    int updateByPrimaryKey(Code record);

    Code selectByPhone(String phone);

    Integer queryNum(String phone);
}