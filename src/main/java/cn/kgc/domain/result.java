package cn.kgc.domain;

public class result {
    private String date;
    private Integer number;

    public result(String date, Integer number) {
        this.date = date;
        this.number = number;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
