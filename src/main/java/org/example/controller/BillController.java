package org.example.controller;

import database.chiTietDonHangDAO;
import database.donHangDAO;
import database.khachHangDAO;
import database.sanPhamDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

@WebServlet(name = "Bill_manager", value = "/bill")
public class BillController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String click= req.getParameter("click");
        if ("bill_prd".equals(click)) {
            bill(req, resp);
        } else if ("create_bill".equals(click)) {
            createBill(req, resp);
        }
    }
    private void bill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String totalAmount = req.getParameter("totalAmount");
        String totalCost = req.getParameter("totalCost");
        List<GioHang> gioHangList = new ArrayList<>();
        khachHang kh = (khachHang) req.getSession().getAttribute("khachHang");

        String[] listSP = req.getParameter("listSP").strip().split(" ");
        if (kh != null && kh.getGioHangList()!=null) {//debug cho nay list= 2
             if (listSP!=null){
                 for (GioHang product : kh.getGioHangList()) {
                     for (String selectedProduct : listSP) {
                         if (product.id == Integer.parseInt(selectedProduct)) {
                             gioHangList.add(product);
                             break;
                         }
                     }
                 }
             }
        }
        req.setAttribute("khachHang",kh);
        req.setAttribute("gioHangList", gioHangList);
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("totalCost", totalCost);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/bill.jsp");
        dispatcher.forward(req, resp);
    }
    private void createBill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        khachHang kh = (khachHang) req.getSession().getAttribute("khachHang");
        if (kh!=null) {
            String hinhthucthanhtoan = req.getParameter("phuongThucThanhToan");
            String diachinhanhang = kh.getDiaChiNhanHang();
            Double totalAmount = Double.parseDouble(req.getParameter("totalAmount"));
            Double totalCost = Double.parseDouble(req.getParameter("totalCost"));
            Random td = new Random();
            String maDonHang = td.nextInt(1000)+"";
            donHang dh = new donHang();
            khachHang khachHang = new khachHang();
            khachHang.setMaKhachHang(kh.getMaKhachHang());
            khachHang khnew = new khachHangDAO().selectById(khachHang);
            dh.setDiaChiNhanHang(diachinhanhang);
            dh.setHinhThucThanhToan(hinhthucthanhtoan);
            dh.setTongtien(totalAmount);
            dh.setKhachHang(khnew);
            dh.setMaDonHang(maDonHang);
            dh.setTrangThaiDonHang(TrangThaiDonHang.DANG_CHO);
            dh.setChiphi(totalCost);
            donHangDAO dhd= new donHangDAO();
            chiTietDonHangDAO chiTietDonHangDAO = new chiTietDonHangDAO();
            int result = dhd.insert(dh);
            if (result>0){
                Iterator<GioHang> iterator = kh.getGioHangList().iterator();
                while (iterator.hasNext()){
                    GioHang gioHang = iterator.next();
                    iterator.remove();
                    kh.deleteCart(gioHang.getId());
                }
                resp.sendRedirect(req.getContextPath() + "/payment.jsp");
            }else {
                req.setAttribute("errorMessage", "Lỗi khi tạo đơn hàng. Vui lòng thử lại.");
                req.getRequestDispatcher("/product/bill.jsp").forward(req, resp);
            }
        }else {
            resp.sendRedirect("/khachhang/dangnhap.jsp");
        }
    }
}
