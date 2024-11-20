package database;

import model.transactions;

import java.sql.*;

public class transactionDAO {
    public int insert(transactions t) {
        int ketQua = 0;
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "INSERT INTO transactions (ma_don_hang, gateway, transaction_date, amount_in, code, transaction_content, reference_number, body, created_at) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaDonHang().getMaDonHang());
            st.setString(2, t.getGateway());
            st.setTimestamp(3, new Timestamp(t.getTransactionDate().getTime()));
            st.setDouble(4, t.getAmountIn());
            st.setString(5, t.getCode());
            st.setString(6, t.getTransactionContent());
            st.setString(7, t.getReferenceNumber());
            st.setString(8, t.getBody());
            st.setTimestamp(9, new Timestamp(System.currentTimeMillis()));

            ketQua = st.executeUpdate();
            JDBCutil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketQua;
    }
}
