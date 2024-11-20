package database;

import model.chiTietDonHang;
import model.donHang;
import model.sanPham;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class chiTietDonHangDAO implements DAOInterface<chiTietDonHang> {

    @Override
    public ArrayList<chiTietDonHang> selectAll() {
        ArrayList<chiTietDonHang> ketQua = new ArrayList<chiTietDonHang>();
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM chitietdonhang";
            PreparedStatement st = con.prepareStatement(sql);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:

            while (rs.next()) {
                String maChiTietDonHang = rs.getString("ma_chi_tiet_don_hang");
                String donhang = rs.getString("ma_don_hang");
                String sanpham = rs.getString("ma_san_pham");
                double soluong = rs.getDouble("so_luong");

                donHang dh = new donHangDAO().selectById(new donHang(donhang, null, "", "", 0, null, null,null,0));
                sanPham sp = new sanPhamDAO().selectById(new sanPham(sanpham, "", null, 0, 0, 0, 0, null, "","",0));

                chiTietDonHang ctdh = new chiTietDonHang(maChiTietDonHang, dh, sp, soluong);
                ketQua.add(ctdh);
            }

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public chiTietDonHang selectById(chiTietDonHang t) {
        chiTietDonHang ketQua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "SELECT * FROM chitietdonhang WHERE ma_chi_tiet_don_hang=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaChiTietDonHang());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String maChiTietDonHang = rs.getString("ma_chi_tiet_don_hang");
                String donhang = rs.getString("ma_don_hang");
                String sanpham = rs.getString("ma_san_pham");
                double soluong = rs.getDouble("so_luong");

                donHang dh = new donHangDAO().selectById(new donHang(donhang, null,"", "", 0, null, null,null,0));
                sanPham sp = new sanPhamDAO().selectById(new sanPham(sanpham, "", null, 0, 0, 0, 0, null, "","",0));

                ketQua = new chiTietDonHang(maChiTietDonHang, dh, sp, soluong);
                break;
            }
            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;

    }

    @Override
    public int insert(chiTietDonHang t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "INSERT INTO chitietdonhang (ma_chi_tiet_don_hang, ma_don_hang,ma_san_pham, so_luong) "
                    + " VALUES (?,?,?,?)";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaChiTietDonHang());
            st.setString(2, t.getDonHang().getMaDonHang());
            st.setString(3, t.getSanPham().getMaSanPham());
            st.setDouble(4, t.getSoLuong());

            // Bước 3: thực thi câu lệnh SQL
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int insertAll(ArrayList<chiTietDonHang> arr) {
        int dem = 0;
        for (chiTietDonHang ctdh : arr) {
            dem += this.insert(ctdh);
        }
        return dem;
    }

    @Override
    public int delete(chiTietDonHang t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "DELETE from chitietdonhang " + " WHERE ma_chi_tiet_don_hang=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaChiTietDonHang());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int deleteAll(ArrayList<chiTietDonHang> arr) {
        int dem = 0;
        for (chiTietDonHang ctdh : arr) {
            dem += this.delete(ctdh);
        }
        return dem;
    }

    @Override
    public int update(chiTietDonHang t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE chitietdonhang SET ma_don_hang=?, ma_san_pham=?, so_luong=?"
                    + " WHERE machitietdonhang=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getDonHang().getMaDonHang());
            st.setString(2, t.getSanPham().getMaSanPham());
            st.setDouble(3, t.getSoLuong());
            st.setString(4, t.getMaChiTietDonHang());

            // Bước 3: thực thi câu lệnh SQL

            System.out.println(sql);
            ketQua = st.executeUpdate();

            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }
}
