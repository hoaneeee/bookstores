package database;
import model.donHang;
import model.khachHang;

import java.sql.*;
import java.util.ArrayList;


public class donHangDAO implements DAOInterface<donHang>{

    @Override
    public ArrayList<donHang> selectAll() {
        ArrayList<donHang> ketqua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from donhang";
            PreparedStatement st = con.prepareStatement(sql);

            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()){
                String madonhang= rs.getString("ma_don_hang");
                String makhachhang= rs.getString("ma_khach_hang");
                String diachimuahang = rs.getString("dia_chi_mua_hang");
                String diachinhanhang = rs.getString("dia_chi_nhan_hang");
                String hinhthucthanhtoan = rs.getString("hinh_thuc_thanh_toan");
                String trangthaithanhtoan = rs.getString("trang_thai_thanh_toan");
                double sotiendathanhtoan = rs.getDouble("so_tien_da_thanh_toan");
                double sotienconthieu = rs.getDouble("so_tien_con_thieu");
                Date ngaydathang = rs.getDate("ngay_dat_hang");
                Date ngaygiaohang= rs.getDate("ngay_giao_hang");

                khachHang kh1= new khachHang();
                kh1.setMaKhachHang(makhachhang);
                khachHang kh= new khachHangDAO().selectById(kh1);
                donHang dh = new donHang(madonhang,kh,diachimuahang,diachinhanhang,hinhthucthanhtoan,trangthaithanhtoan,sotiendathanhtoan,sotienconthieu,ngaydathang,ngaygiaohang);
                ketqua.add(dh);
            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public donHang selectById(donHang t) {
        donHang ketqua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from donhang where ma_don_hang=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1,t.getMaDonHang());
            ResultSet rs = st.executeQuery();

            while(rs.next()){
                String madonhang= rs.getString("ma_don_hang");
                String makhachhang= rs.getString("ma_khach_hang");
                String diachimuahang = rs.getString("dia_chi_mua_hang");
                String diachinhanhang = rs.getString("dia_chi_nhan_hang");
                String hinhthucthanhtoan = rs.getString("hinh_thuc_thanh_toan");
                String trangthaithanhtoan = rs.getString("trang_thai_thanh_toan");
                double sotiendathanhtoan = rs.getDouble("so_tien_da_thanh_toan");
                double sotienconthieu = rs.getDouble("so_tien_con_thieu");
                Date ngaydathang = rs.getDate("ngay_dat_hang");
                Date ngaygiaohang= rs.getDate("ngay_giao_hang");

                khachHang kh1= new khachHang();
                kh1.setMaKhachHang(makhachhang);
                khachHang kh= new khachHangDAO().selectById(kh1);
                ketqua = new donHang(madonhang,kh,diachimuahang,diachinhanhang,hinhthucthanhtoan,trangthaithanhtoan,sotiendathanhtoan,sotienconthieu,ngaydathang,ngaygiaohang);
                break;

            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insert(donHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "insert into donhang (ma_don_hang, ma_khach_hang, dia_chi_mua_hang , dia_chi_nhan_hang,hinh_thuc_thanh_toan,trang_thai_thanh_toan" +
                    "so_tien_da_thanh_toan, so_tien_con_thieu,ngay_dat_hang,ngay_giao_hang) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,t.getMaDonHang());
            st.setString(2,t.getKhachHang().getMaKhachHang());
            st.setString(3,t.getDiaChiMuaHang());
            st.setString(4, t.getDiaChiNhanHang());
            st.setString(5, t.getHinhThucThanhToan());
            st.setString(6,t.getTrangThaiThanhToan());
            st.setDouble(7,t.getSoTienDaThanhToan());
            st.setDouble(8, t.getSoTienConThieu());
            st.setDate(9,t.getNgayDatHang());
            st.setDate(10,t.getNgayGiaoHang());

            ketqua=st.executeUpdate();
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insertAll(ArrayList<donHang> arr) {
        int dem=0;
        for(donHang t:arr){
            dem+=this.insert(t);
        }
        return dem;
    }

    @Override
    public int delete(donHang t) {
        int ketqua = 0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "delete from donhang where ma_don_hang=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1,t.getMaDonHang());
            ketqua= st.executeUpdate();
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int deleteAll(ArrayList<donHang> arr) {
        int dem=0;
         for(donHang t:arr){
             dem+=this.delete(t);
         }
         return dem;
    }

    @Override
    public int update(donHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "UPDATE donhang" + " SET " + "ma_khach_hang=?" + ", dia_chi_nguoi_mua=?" + ",dia_chi_nguoi_nhan=?"
                    + ",hinh_thuc_thanh_toan=?" + ",trang_thai_thanh_toan=?" + ",so_tien_da_thanh_toan=?" + ",so_tien_con_thieu=?" + ",ngay_dat_hang=?"
                    + ",ngay_giao_hang=?" + " WHERE ma_don_hang=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,t.getKhachHang().getMaKhachHang());
            st.setString(2,t.getDiaChiMuaHang());
            st.setString(3, t.getDiaChiNhanHang());
            st.setString(4, t.getHinhThucThanhToan());
            st.setString(5,t.getTrangThaiThanhToan());
            st.setDouble(6,t.getSoTienDaThanhToan());
            st.setDouble(7, t.getSoTienConThieu());
            st.setDate(8,t.getNgayDatHang());
            st.setDate(9,t.getNgayGiaoHang());
            st.setString(10,t.getMaDonHang());

            ketqua = st.executeUpdate();
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }
}
