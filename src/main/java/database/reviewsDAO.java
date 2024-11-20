package database;

import model.khachHang;
import model.reviews;
import model.sanPham;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class reviewsDAO {
    public int addReview(reviews t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "insert into comment(ma_san_pham,ma_khach_hang,rating,cmt,create_at) values(?,?,?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, t.getMa_san_pham().getMaSanPham());
            pr.setString(2, t.getMa_khach_hang().getMaKhachHang());
            pr.setInt(3, t.getRating());
            pr.setString(4, t.getComment());
            pr.setTimestamp(5, t.getCreated_at() != null ? t.getCreated_at() : new Timestamp(System.currentTimeMillis()));
            ketqua = pr.executeUpdate();
            JDBCutil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketqua;
    }
//    public List<reviews> findByUserIdAndProductId(String maKhachHang, String maSanPham) {
//        List<reviews> reviews = new ArrayList<>();
//        try {
//            Connection con = JDBCutil.getConnection();
//            String sql = "SELECT * FROM comment WHERE ma_khach_hang = ? AND ma_san_pham = ?";
//            PreparedStatement st = con.prepareStatement(sql);
//            st.setString(1, maKhachHang);
//            st.setString(2, maSanPham);
//
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                reviews review = new reviews(
//                        rs.getInt("id"),
//                        new sanPham(rs.getString("ma_san_pham")),
//                        new khachHang(rs.getString("ma_khach_hang")),
//                        rs.getInt("rating"),
//                        rs.getString("cmt"),
//                        rs.getTimestamp("create_at")
//                );
//                reviews.add(review);
//            }
//
//            JDBCutil.closeConnection(con);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return reviews;
//    }

    public List<reviews> findByProductId(String maSanPham) {
        List<reviews> reviews = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();
            // Thực hiện JOIN để lấy tên khách hàng từ bảng khachhang
            String sql = "SELECT c.*, k.ho_va_ten , k.avatar FROM comment c " +
                    "JOIN khachhang k ON c.ma_khach_hang = k.ma_khach_hang " +
                    "WHERE c.ma_san_pham = ? ORDER BY c.create_at DESC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maSanPham);
            System.out.println("Lấy ra các comment với tên khách hàng: " + sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String tenKhachHang = rs.getString("ho_va_ten");
                String avatar = rs.getString("avatar");

                reviews review = new reviews(
                        rs.getInt("id"),
                        new sanPham(rs.getString("ma_san_pham")),
                        new khachHang(rs.getString("ma_khach_hang"), tenKhachHang,avatar),
                        rs.getInt("rating"),
                        rs.getString("cmt"),
                        rs.getTimestamp("create_at")
                );
                reviews.add(review);
            }

            JDBCutil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviews;
    }


    public int delete(int reviewId, String maKhachHang) {
        int result = 0;
        try {

            Connection con = JDBCutil.getConnection();
            String sql = "DELETE FROM comment WHERE id = ? AND ma_khach_hang = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, reviewId);
            st.setString(2, maKhachHang);
            result = st.executeUpdate();
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }


}
