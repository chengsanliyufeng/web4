package com.shm.vo;


public class UserPage {
    private int pageNumber;
    private String sortOrder;
    private int pageSize;
    private String sort;


    public UserPage(int pageNumber, String sortOrder, int pageSize, String sort) {
        this.pageNumber = pageNumber;
        this.sortOrder = sortOrder;
        this.pageSize = pageSize;
        this.sort = sort;
    }

    public UserPage() {

    }

    @Override
    public String toString() {
        return "UserPage{" +
                "pageNumber=" + pageNumber +
                ", sortOrder='" + sortOrder + '\'' +
                ", pageSize=" + pageSize +
                ", sort='" + sort + '\'' +
                '}';
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
