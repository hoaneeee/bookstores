package model;

public class chiTietDonHang {
    private String maChiTietDonHang;
    private donHang donHang;
    private sanPham sanPham;
    private double soLuong;

    public chiTietDonHang(String maChiTietDonHang, model.donHang donHang, model.sanPham sanPham, double soLuong) {
        this.maChiTietDonHang = maChiTietDonHang;
        this.donHang = donHang;
        this.sanPham = sanPham;
        this.soLuong = soLuong;
    }

    public chiTietDonHang() {
    }

    public String getMaChiTietDonHang() {
        return maChiTietDonHang;
    }

    public void setMaChiTietDonHang(String maChiTietDonHang) {
        this.maChiTietDonHang = maChiTietDonHang;
    }

    public model.donHang getDonHang() {
        return donHang;
    }

    public void setDonHang(model.donHang donHang) {
        this.donHang = donHang;
    }

    public model.sanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(model.sanPham sanPham) {
        this.sanPham = sanPham;
    }

    public double getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(double soLuong) {
        this.soLuong = soLuong;
    }

}
