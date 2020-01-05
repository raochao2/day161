package cn.kgc.domain;

//封装分页参数
public class PageUtil {
    private int pageNumber; //
    private int pageSize;  //封装页大小

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
