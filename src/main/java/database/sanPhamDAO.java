package database;
import model.sanPham;
import model.tacGia;
import model.theLoai;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class sanPhamDAO implements DAOInterface<sanPham> {
    @Override
    public ArrayList<sanPham> selectAll() {
        ArrayList<sanPham> ketQua =  new ArrayList<>();
        try{
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham";
            PreparedStatement ps= con.prepareStatement(sql);

            System.out.println(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double gianhap = rs.getDouble("gia_nhap");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String ngonngu = rs.getString("ngon_ngu");
                String mota = rs.getString("mo_ta");

                tacGia tacGia= (new tacGiaDAO().selectById(new tacGia(matacgia,"",null,"")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp= new sanPham(masanpham,tensanpham,tacGia,namxuatban,gianhap,giagoc,giaban,soluong,theLoai,ngonngu,mota);
                ketQua.add(sp);
            }

            JDBCutil.closeConnection(con);

        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketQua;
    }

    @Override
    public sanPham selectById(sanPham t) {
        sanPham ketqua= null;
        try{
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham where ma_san_pham=?";
            PreparedStatement ps= con.prepareStatement(sql);

            ps.setString(1,t.getMaSanPham());
            ResultSet rs= ps.executeQuery();

            while (rs.next()){
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double gianhap = rs.getDouble("gia_nhap");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String ngonngu = rs.getString("ngon_ngu");
                String mota = rs.getString("mo_ta");

                tacGia tacGia= (new tacGiaDAO().selectById(new tacGia(matacgia,"",null,"")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                ketqua = new sanPham(masanpham,tensanpham,tacGia,namxuatban,gianhap,giagoc,giaban,soluong,theLoai,ngonngu,mota);

                break;
            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insert(sanPham t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "insert into sanpham (ma_san_pham,ten_san_pham, ma_tac_gia, nam_xuat_ban," +
                    " gia_nhap, gia_goc, gia_ban, so_luong, ma_the_loai, ngon_ngu, mo_ta)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?) ";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getMaSanPham());
            st.setString(2, t.getTenSanPham());
            st.setString(3, t.getTacGia().getMaTacGia());
            st.setInt(4, t.getNamXuatBan());
            st.setDouble(5, t.getGiaNhap());
            st.setDouble(6, t.getGiaGoc());
            st.setDouble(7, t.getGiaBan());
            st.setInt(8, t.getSoLuong());
            st.setString(9, t.getTheLoai().getMaTheLoai());
            st.setString(10, t.getNgonNgu());
            st.setString(11, t.getMoTa());

            ketqua = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insertAll(ArrayList<sanPham> arr) {
        int dem=0;
        for (sanPham sanPham : arr){
            dem+=this.insert(sanPham);
        }
        return dem;
    }

    @Override
    public int delete(sanPham t) {
        int ketqua=0;
        try{
            Connection con = JDBCutil.getConnection();

            String sql= "delete from sanpham where ma_san_pham=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaSanPham());


            System.out.println(sql);
            ketqua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;

    }

    @Override
    public int deleteAll(ArrayList<sanPham> arr) {
        int dem=0;
        for (sanPham sanPham : arr){
            dem+=this.delete(sanPham);
        }
        return dem;

    }

    @Override
    public int update(sanPham t) {
        int ketqua=0;
        try{
            Connection con = JDBCutil.getConnection();

            String sql= "UPDATE sanpham " + " SET " + "ten_san_pham=?, ma_tac_gia=?, nam_xuat_ban=?, gia_nhap=?, gia_goc=?, "
                    + "gia_ban=?, so_luong=?, ma_the_loai=?, ngon_ngu=?, mo_ta=?" + " WHERE ma_san_pham=?";
            PreparedStatement st= con.prepareStatement(sql);

            st.setString(1, t.getTenSanPham());
            st.setString(2, t.getTacGia().getMaTacGia());
            st.setInt(3, t.getNamXuatBan());
            st.setDouble(4, t.getGiaNhap());
            st.setDouble(5, t.getGiaGoc());
            st.setDouble(6, t.getGiaBan());
            st.setInt(7, t.getSoLuong());
            st.setString(8, t.getTheLoai().getMaTheLoai());
            st.setString(9, t.getNgonNgu());
            st.setString(10, t.getMoTa());
            st.setString(11, t.getMaSanPham());


            System.out.println(sql);
            ketqua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua+ " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }
    public boolean checkMASP(String maSanPham){
        boolean ketqua= false;
        try {
            Connection con = JDBCutil.getConnection();
            String sql= "select * from sanpham where ma_san_pham=?";
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1,maSanPham);

            System.out.println(sql);
            ResultSet rs =st.executeQuery();
            while (rs.next()){
                return true;
            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  ketqua;
    }
}
