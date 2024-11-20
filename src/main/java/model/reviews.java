package model;

import java.sql.Timestamp;

public class reviews {
    private int id ;
    private sanPham ma_san_pham;
    private khachHang ma_khach_hang;
    private int rating ;
    private String comment;
    private Timestamp created_at;

    public reviews(int id, sanPham ma_san_pham, khachHang ma_khach_hang, int rating, String comment, Timestamp created_at) {
        this.id = id;
        this.ma_san_pham = ma_san_pham;
        this.ma_khach_hang = ma_khach_hang;
        this.rating = rating;
        this.comment = comment;
        this.created_at = created_at;
    }

    public reviews() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public sanPham getMa_san_pham() {
        return ma_san_pham;
    }

    public void setMa_san_pham(sanPham ma_san_pham) {
        this.ma_san_pham = ma_san_pham;
    }

    public khachHang getMa_khach_hang() {
        return ma_khach_hang;
    }

    public void setMa_khach_hang(khachHang ma_khach_hang) {
        this.ma_khach_hang = ma_khach_hang;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
