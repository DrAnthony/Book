package team.exm.book.mapper;

import org.springframework.stereotype.Repository;
import team.exm.book.entity.User;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByPhone(String s);

    int updatePassword(User user);
}