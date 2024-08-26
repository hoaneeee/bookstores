package model;

import java.sql.Date;
import java.util.Objects;

public class donHang {
    private String maDonHang;
    private khachHang khachHang;
    private String diaChiMuaHang;
    private String diaChiNhanHang;
    private String hinhThucThanhToan;
    private String trangThaiThanhToan;
    private double soTienDaThanhToan;
    private double soTienConThieu;
    private Date ngayDatHang;
    private Date ngayGiaoHang;

    public donHang(String maDonHang, model.khachHang khachHang, String diaChiMuaHang, String diaChiNhanHang, String hinhThucThanhToan, String trangThaiThanhToan, double soTienDaThanhToan, double soTienConThieu, Date ngayDatHang, Date ngayGiaoHang) {
        this.maDonHang = maDonHang;
        this.khachHang = khachHang;
        this.diaChiMuaHang = diaChiMuaHang;
        this.diaChiNhanHang = diaChiNhanHang;
        this.trangThaiThanhToan = trangThaiThanhToan;
        this.hinhThucThanhToan = hinhThucThanhToan;
        this.soTienDaThanhToan = soTienDaThanhToan;
        this.soTienConThieu = soTienConThieu;
        this.ngayDatHang = ngayDatHang;
        this.ngayGiaoHang = ngayGiaoHang;
    }

    public donHang() {
    }

    public String getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(String maDonHang) {
        this.maDonHang = maDonHang;
    }

    public model.khachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(model.khachHang khachHang) {
        this.khachHang = khachHang;
    }

    public String getDiaChiMuaHang() {
        return diaChiMuaHang;
    }

    public void setDiaChiMuaHang(String diaChiMuaHang) {
        this.diaChiMuaHang = diaChiMuaHang;
    }

    public String getDiaChiNhanHang() {
        return diaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        this.diaChiNhanHang = diaChiNhanHang;
    }

    public String getTrangThaiThanhToan() {
        return trangThaiThanhToan;
    }

    public void setTrangThaiThanhToan(String trangThaiThanhToan) {
        this.trangThaiThanhToan = trangThaiThanhToan;
    }

    public String getHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(String hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public double getSoTienDaThanhToan() {
        return soTienDaThanhToan;
    }

    public void setSoTienDaThanhToan(double soTienDaThanhToan) {
        this.soTienDaThanhToan = soTienDaThanhToan;
    }

    public double getSoTienConThieu() {
        return soTienConThieu;
    }

    public void setSoTienConThieu(double soTienConThieu) {
        this.soTienConThieu = soTienConThieu;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public Date getNgayGiaoHang() {
        return ngayGiaoHang;
    }

    public void setNgayGiaoHang(Date ngayGiaoHang) {
        this.ngayGiaoHang = ngayGiaoHang;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        donHang donHang = (donHang) o;
        return Objects.equals(getMaDonHang(), donHang.getMaDonHang());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getMaDonHang());
    }
}
