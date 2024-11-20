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

    static sanPhamDAO ins;

    public static sanPhamDAO gI() {
        if (ins == null) ins = new sanPhamDAO();
        return ins;
    }

    @Override
    public ArrayList<sanPham> selectAll() {
        ArrayList<sanPham> ketQua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham";
            PreparedStatement ps = con.prepareStatement(sql);

            System.out.println(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                double gianhap = rs.getDouble("gia_nhap");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh,gianhap);
                ketQua.add(sp);
            }

            JDBCutil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }


    public sanPham selectByID(int dcm) {
        sanPham ketqua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham where ma_san_pham=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, dcm);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                double gianhap = rs.getDouble("gia_nhap");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                ketqua = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh,gianhap);

                break;
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public sanPham selectById(sanPham t) {
        sanPham ketqua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham where ma_san_pham=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, t.getMaSanPham());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                double gianhap = rs.getDouble("gia_nhap");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                ketqua = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh,gianhap);

                break;
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
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
                    "  gia_goc, gia_ban, so_luong, ma_the_loai, mo_ta,them_anh,gia_nhap)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?) ";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getMaSanPham());
            st.setString(2, t.getTenSanPham());
            st.setString(3, t.getTacGia().getMaTacGia());
            st.setInt(4, t.getNamXuatBan());
            st.setDouble(5, t.getGiaGoc());
            st.setDouble(6, t.getGiaBan());
            st.setInt(7, t.getSoLuong());
            st.setString(8, t.getTheLoai().getMaTheLoai());
            st.setString(9, t.getMoTa());
            st.setString(10, t.getThemAnh());
            st.setDouble(11, t.getGianhap());
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
        int dem = 0;
        for (sanPham sanPham : arr) {
            dem += this.insert(sanPham);
        }
        return dem;
    }

    @Override
    public int delete(sanPham t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "delete from sanpham where ma_san_pham=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaSanPham());


            System.out.println(sql);
            ketqua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;

    }

    @Override
    public int deleteAll(ArrayList<sanPham> arr) {
        int dem = 0;
        for (sanPham sanPham : arr) {
            dem += this.delete(sanPham);
        }
        return dem;

    }

    @Override
    public int update(sanPham t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "UPDATE sanpham " + " SET " + "ten_san_pham=?, ma_tac_gia=?, nam_xuat_ban=?, gia_goc=?, "
                    + "gia_ban=?, so_luong=?, ma_the_loai=?, mo_ta=?, them_anh=?,gia_nhap=?" + " WHERE ma_san_pham=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getTenSanPham());
            st.setString(2, t.getTacGia().getMaTacGia());
            st.setInt(3, t.getNamXuatBan());
            st.setDouble(4, t.getGiaGoc());
            st.setDouble(5, t.getGiaBan());
            st.setInt(6, t.getSoLuong());
            st.setString(7, t.getTheLoai().getMaTheLoai());
            st.setString(8, t.getMoTa());
            st.setString(9, t.getThemAnh());
            st.setDouble(10, t.getGianhap());
            st.setString(11, t.getMaSanPham());




            System.out.println(sql);
            ketqua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    public boolean checkMASP(String maSanPham) {
        boolean ketqua = false;
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from sanpham where ma_san_pham=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maSanPham);

            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    public ArrayList<sanPham> searchByNameAndCategory(String input) {
        ArrayList<sanPham> ketqua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from sanpham where ten_san_pham like ? or ma_the_loai like ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "%" + input + "%");
            ps.setString(2, "%" + input + "%");
            System.out.println(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                double gianhap = rs.getDouble("gia_nhap");
                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));
                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh,gianhap);
                ketqua.add(sp);
            }
            JDBCutil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketqua;
    }


    public ArrayList<sanPham> selectByPage(int start, int pageSize) {
        ArrayList<sanPham> ketQua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from sanpham ORDER BY ma_san_pham LIMIT ?,?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, start);
            pr.setInt(2, pageSize);
            ResultSet rs = pr.executeQuery();
            System.out.println(sql);
            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                double gianhap = rs.getDouble("gia_nhap");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh,gianhap);
                ketQua.add(sp);
            }
            JDBCutil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int getTotalProducts() {
        int total = 0;

        String query = "SELECT COUNT(*) FROM sanpham";
        try (
                Connection conn = JDBCutil.getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                total = rs.getInt(1);
            }
            JDBCutil.closeConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }


    public ArrayList<sanPham> getProductsByQuery(String sql){
        ArrayList<sanPham> ketQua = new ArrayList<>();
        try{
            Connection con = JDBCutil.getConnection();
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                double gianhap = rs.getDouble("gia_nhap");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh,gianhap);
                ketQua.add(sp);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketQua;
    }

    private String buildSQLWithSearchResults(ArrayList<sanPham> searchResults, String orderBy) {
        // Lấy danh sách mã sản phẩm từ searchResults
        StringBuilder sql = new StringBuilder("SELECT * FROM sanpham WHERE ma_san_pham IN (");

        for (int i = 0; i < searchResults.size(); i++) {
            sql.append("'").append(searchResults.get(i).getMaSanPham()).append("'");
            if (i < searchResults.size() - 1) {
                sql.append(", ");
            }
        }

        sql.append(")");

        // Thêm điều kiện sắp xếp (ORDER BY)
        if (orderBy != null && !orderBy.isEmpty()) {
            sql.append(" ORDER BY ").append(orderBy);
        }

        return sql.toString();
    }


    public ArrayList<sanPham> filterByNewest(ArrayList<sanPham> searchResults) {
        String sql = buildSQLWithSearchResults(searchResults, "nam_xuat_ban DESC");
        return getProductsByQuery(sql);
    }

    public ArrayList<sanPham> filterByBestSeller(ArrayList<sanPham> searchResults) {
        String sql = buildSQLWithSearchResults(searchResults, "so_luong DESC");
        return getProductsByQuery(sql);
    }

    public ArrayList<sanPham> filterByPriceLowToHigh(ArrayList<sanPham> searchResults) {
        String sql = buildSQLWithSearchResults(searchResults, "gia_ban ASC");
        return getProductsByQuery(sql);
    }

    public ArrayList<sanPham> filterByPriceHighToLow(ArrayList<sanPham> searchResults) {
        String sql = buildSQLWithSearchResults(searchResults, "gia_ban DESC");
        return getProductsByQuery(sql);
    }
    public ArrayList<sanPham>   getProductByCategoryId(String id){
        ArrayList<sanPham> ketQua = new ArrayList<>();
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "SELECT * FROM sanpham WHERE ma_the_loai= ?";
            PreparedStatement pr= con.prepareStatement(sql);
            pr.setString(1, id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                double gianhap = rs.getDouble("gia_nhap");
                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh,gianhap);
                ketQua.add(sp);

            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketQua;
    }
}
