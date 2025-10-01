package com.example.product.entity;

public class Category {
    private int iD;
    private String name;

    public Category() {
    }

    public Category(String name) {
        this.name = name;
    }

    public Category(int iD, String name) {
        this.iD = iD;
        this.name = name;
    }

    public int getiD() {
        return iD;
    }

    public void setiD(int iD) {
        this.iD = iD;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
