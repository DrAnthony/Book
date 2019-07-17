package team.exm.book.web.request;

import team.exm.book.entity.Book;

public class BookVO extends Book {
    private String keyword;
    private Integer offset;
    private Integer rows;
    private Integer page;
    private Integer userID;
    private Byte role;
    private boolean ensure;

    private Integer booktype;
    private Integer bookpress;

    public void forceCast(Book book) {
        this.setId(book.getId());
        this.setIsbn(book.getIsbn());
        this.setRemain(book.getRemain());
        this.setTotal(book.getTotal());
        this.setAuthor(book.getAuthor());
        this.setName(book.getName());
        this.setDate(book.getDate());
        this.setType(book.getType());
        this.setVerified(book.getVerified());
        this.setPrice(book.getPrice());
        this.setPress(book.getPress());
    }
    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Byte getRole() {
        return role;
    }

    public void setRole(Byte role) {
        this.role = role;
    }

    public boolean isEnsure() {
        return ensure;
    }

    public void setEnsure(boolean ensure) {
        this.ensure = ensure;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getBooktype() {
        return booktype;
    }

    public void setBooktype(Integer booktype) {
        this.booktype = booktype;
    }

    public Integer getBookpress() {
        return bookpress;
    }

    public void setBookpress(Integer bookpress) {
        this.bookpress = bookpress;
    }


}
