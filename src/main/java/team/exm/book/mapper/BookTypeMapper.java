package team.exm.book.mapper;

import team.exm.book.entity.BookType;

import java.util.List;

public interface BookTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BookType record);

    int insertSelective(BookType record);

    BookType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BookType record);

    int updateByPrimaryKey(BookType record);

    List<BookType> selectAll();
}