package model;

import java.sql.Date;
import java.sql.Timestamp;

public class transactions {
    private int id;                         // ID giao dịch
    private donHang maDonHang;               // Mã đơn hàng
    private String gateway;                 // Tên cổng thanh toán
    private Date transactionDate;           // Ngày giao dịch
    private double amountIn;                // Số tiền nhận được
    private String code;                    // Mã giao dịch
    private String transactionContent;      // Nội dung giao dịch
    private String referenceNumber;         // Số tham chiếu
    private String body;                    // Phản hồi đầy đủ
    private Timestamp createdAt;

    public transactions(int id, donHang maDonHang, String gateway, Date transactionDate, double amountIn, String code, String transactionContent, String referenceNumber, String body, Timestamp createdAt) {
        this.id = id;
        this.maDonHang = maDonHang;
        this.gateway = gateway;
        this.transactionDate = transactionDate;
        this.amountIn = amountIn;
        this.code = code;
        this.transactionContent = transactionContent;
        this.referenceNumber = referenceNumber;
        this.body = body;
        this.createdAt = createdAt;
    }

    public transactions() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public donHang getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(donHang maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getGateway() {
        return gateway;
    }

    public void setGateway(String gateway) {
        this.gateway = gateway;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public double getAmountIn() {
        return amountIn;
    }

    public void setAmountIn(double amountIn) {
        this.amountIn = amountIn;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTransactionContent() {
        return transactionContent;
    }

    public void setTransactionContent(String transactionContent) {
        this.transactionContent = transactionContent;
    }

    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
