package com.shm.vo;



public class Province {
    private int p_id;
    private String province;

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Override
    public String toString() {
        return "Province{" +
                "p_id=" + p_id +
                ", province='" + province + '\'' +
                '}';
    }
}
