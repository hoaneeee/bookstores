package model;

public class GioHang {
    public int id;
    public int quantity;
    public sanPham sanPham;

    public GioHang(int id, int quantity) {
        this.id = id;
        this.quantity = quantity;
    }
    public GioHang(){
        this.id = 0;
        this.quantity = 0;
    }

    public int getId() {
        return id;
    }

    public sanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(sanPham sanPham) {
        this.sanPham = sanPham;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
