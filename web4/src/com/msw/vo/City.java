package com.shm.vo;



public class City {
    private int c_id;
    private String city;
    private int p_id;

    public City() {
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    @Override
    public String toString() {
        return "City{" +
                "c_id=" + c_id +
                ", city='" + city + '\'' +
                ", p_id=" + p_id +
                '}';
    }
}
