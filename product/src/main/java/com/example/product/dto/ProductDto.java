package com.example.product.dto;

public class ProductDto {
    private int id;
    private String tenSanPham;
    private double giaSanPham;
    private String moTaSanPham;
    private String nhaSanXuat;
    private String category;

    public ProductDto() {
    }

    public ProductDto(String tenSanPham, double giaSanPham, String moTaSanPham, String nhaSanXuat, String category) {
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaSanPham = moTaSanPham;
        this.nhaSanXuat = nhaSanXuat;
        this.category = category;
    }

    public ProductDto(int id, String tenSanPham, double giaSanPham, String moTaSanPham, String nhaSanXuat, String category) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaSanPham = moTaSanPham;
        this.nhaSanXuat = nhaSanXuat;
        this.category = category;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
