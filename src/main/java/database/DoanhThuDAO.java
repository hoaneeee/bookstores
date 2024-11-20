package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DoanhThuDAO {
    public double getrevenueDate(Date date){
        double revenue = 0;
        try{
            Connection con= JDBCutil.getConnection();
            String sql = "select sum(so_tien_con_thieu) from donhang where date(ngay_dat_hang)=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setDate(1, date);
            ResultSet rs=ps.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
    public double getrevenueMonth(int month, int year){
        double revenue = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql = "SELECT SUM(so_tien_con_thieu) FROM donhang WHERE MONTH(ngay_dat_hang) = ? AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, month);
            pr.setInt(2, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
    public double getrevenueQuarter(int quy , int nam ){
        double revenue = 0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "SELECT SUM(so_tien_con_thieu) FROM donhang WHERE (MONTH(ngay_dat_hang) BETWEEN ? AND ?) AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);

            int startMonth = (quy - 1) * 3 + 1;
            int endMonth = quy * 3;

            pr.setInt(1, startMonth);
            pr.setInt(2, endMonth);
            pr.setInt(3, nam);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
    public double getrevenueYear(int year){
        double revenue = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql ="select sum(so_tien_con_thieu) from donhang where year(ngay_dat_hang)=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
    //chi phi
    public double getCostDate(Date date){
        double cost = 0;
        try{
            Connection con= JDBCutil.getConnection();
            String sql = "select sum(chi_phi) from donhang where date(ngay_dat_hang)=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setDate(1, date);
            ResultSet rs=ps.executeQuery();
            if (rs.next()){
                cost = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cost;
    }

    public double getCostMonth(int month, int year){
        double cost = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql = "SELECT SUM(chi_phi) FROM donhang WHERE MONTH(ngay_dat_hang) = ? AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, month);
            pr.setInt(2, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                cost = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cost;
    }
    public double getCostQuarter(int quy , int nam ){
        double cost = 0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "SELECT SUM(chi_phi) FROM donhang WHERE (MONTH(ngay_dat_hang) BETWEEN ? AND ?) AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);

            int startMonth = (quy - 1) * 3 + 1;
            int endMonth = quy * 3;

            pr.setInt(1, startMonth);
            pr.setInt(2, endMonth);
            pr.setInt(3, nam);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                cost = rs.getDouble(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return cost;
    }

    public double getCostYear(int year){
        double cost = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql ="select sum(chi_phi) from donhang where year(ngay_dat_hang)=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                cost = rs.getDouble(1);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return cost;
    }

    //count bill
    public double getCountBillDate(Date date){
        double count = 0;
        try{
            Connection con= JDBCutil.getConnection();
            String sql = "select count(*) from donhang where date(ngay_dat_hang)=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setDate(1, date);
            ResultSet rs=ps.executeQuery();
            if (rs.next()){
                count = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }
    public double getCountBillMonth(int month, int year){
        double count = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql = "SELECT count(*) FROM donhang WHERE MONTH(ngay_dat_hang) = ? AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, month);
            pr.setInt(2, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                count = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }
    public double getCountBillQuarter(int quy , int nam ){
        double count = 0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "SELECT count(*) FROM donhang WHERE (MONTH(ngay_dat_hang) BETWEEN ? AND ?) AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);

            int startMonth = (quy - 1) * 3 + 1;
            int endMonth = quy * 3;

            pr.setInt(1, startMonth);
            pr.setInt(2, endMonth);
            pr.setInt(3, nam);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                count = rs.getDouble(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }
    public double getCountBillYear(int year){
        double count = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql ="select count(*) from donhang where year(ngay_dat_hang)=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                count = rs.getDouble(1);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }


}
