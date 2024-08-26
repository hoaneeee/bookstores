package model;

import java.sql.Date;

public class khachHang {
    private String maKhachHang;
    private String tenDangNhap;
    private String matKhau;
    private  String hoVaten;
    private String gioiTinh;
    private String diaChi;
    private String diaChiNhanHang;
    private String diaChiMuaHang;
    private Date ngaySinh;
    private String soDienThoai;
    private String email;
    private boolean dangKyNhanBangTin;
    private String vaiTro;

    public khachHang() {
    }

    public khachHang(String maKhachHang, String tenDangNhap, String matKhau, String hoVaten, String gioiTinh,Date ngaySinh, String diaChi, String diaChiNhanHang, String diaChiMuaHang, String soDienThoai, String email, boolean dangKyNhanBangTin, String vaiTro) {
        this.maKhachHang = maKhachHang;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.hoVaten = hoVaten;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.diaChiNhanHang = diaChiNhanHang;
        this.diaChiMuaHang = diaChiMuaHang;
        this.ngaySinh = ngaySinh;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.dangKyNhanBangTin = dangKyNhanBangTin;
        this.vaiTro = vaiTro;
    }

    public String getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoVaten() {
        return hoVaten;
    }

    public void setHoVaten(String hoVaten) {
        this.hoVaten = hoVaten;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getDiaChiNhanHang() {
        return diaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        this.diaChiNhanHang = diaChiNhanHang;
    }

    public String getDiaChiMuaHang() {
        return diaChiMuaHang;
    }

    public void setDiaChiMuaHang(String diaChiMuaHang) {
        this.diaChiMuaHang = diaChiMuaHang;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDangKyNhanBangTin() {
        return dangKyNhanBangTin;
    }

    public void setDangKyNhanBangTin(boolean dangKyNhanBangTin) {
        this.dangKyNhanBangTin = dangKyNhanBangTin;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }
}
