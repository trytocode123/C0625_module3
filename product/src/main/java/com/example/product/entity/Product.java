package com.example.product.entity;

public class Product {
    private int id;
    private String tenSanPham;
    private double giaSanPham;
    private String moTaSanPham;
    private String nhaSanXuat;
    private int idCategory;

    public Product() {
    }

    public Product(String tenSanPham, double giaSanPham, String moTaSanPham, String nhaSanXuat, int idCategory) {
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaSanPham = moTaSanPham;
        this.nhaSanXuat = nhaSanXuat;
        this.idCategory = idCategory;
    }

    public Product(int id, String tenSanPham, double giaSanPham, String moTaSanPham, String nhaSanXuat, int idCategory) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaSanPham = moTaSanPham;
        this.nhaSanXuat = nhaSanXuat;
        this.idCategory = idCategory;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public double getGiaSanPham() {
        return giaSanPham;
    }

    public void setGiaSanPham(double giaSanPham) {
        this.giaSanPham = giaSanPham;
    }

    public String getMoTaSanPham() {
        return moTaSanPham;
    }

    public void setMoTaSanPham(String moTaSanPham) {
        this.moTaSanPham = moTaSanPham;
    }

    public String getNhaSanXuat() {
        return nhaSanXuat;
    }

    public void setNhaSanXuat(String nhaSanXuat) {
        this.nhaSanXuat = nhaSanXuat;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }
}
