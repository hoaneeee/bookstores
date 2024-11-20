package org.example.controller;

import database.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;

@WebServlet(name = "adminController", urlPatterns = {"/admin-servlet", "/upload"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class adminController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            Enumeration<String> t = req.getParameterNames();
//            while (t.hasMoreElements()) {
//                String key = t.nextElement();
//                System.out.println(key+": " + req.getParameter("active"));
//            }
        String active = req.getParameter("active");
        if ("them-san-pham".equals(active)) {
            addProducts(req, resp);
        } else if ("danh-sach-san-pham1".equals(active)) {
            listProduct1(req, resp);
        } else if ("xoa-san-pham".equals(active)) {
            deleteProduct(req, resp);
        } else if ("danh-sach-user".equals(active)) {
            listUser(req, resp);
        } else if ("delete".equals(active)) {
            deleteUser(req, resp);
        } else if ("danh-sach-san-pham2".equals(active)) {
            listProduct2(req, resp);
        } else if ("billManagement".equals(active)) {
            bill_management(req, resp);
        } else if ("bill_status".equals(active)) {
            bill_status(req, resp);
        } else if ("Revenue".equals(active)) {
            revenue(req, resp);
        } else if ("notify".equals(active)) {
            ListNotify(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private void listProduct2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        sanPhamDAO sanPhamDAO = new sanPhamDAO();
        int current = 1;
        int pageSize = 9;
        if (req.getParameter("page") != null) {
            current = Integer.parseInt(req.getParameter("page"));
        }
        int start = (current - 1) * pageSize;

        ArrayList<sanPham> listSp = sanPhamDAO.selectByPage(start, pageSize);

        int totalProducts = sanPhamDAO.getTotalProducts();
        int totalPage = (int) Math.ceil((double) totalProducts / pageSize);
        req.setAttribute("current", current);
        req.setAttribute("totalPages", totalPage);
        req.setAttribute("listSp", listSp);
        RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
        rd.forward(req, resp);
    }

    private void listProduct1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        sanPhamDAO sanPhamDAO = new sanPhamDAO();
        ArrayList<sanPham> listSp = sanPhamDAO.selectAll();
        req.setAttribute("listSp", listSp);
        RequestDispatcher rd = req.getRequestDispatcher("/admin/listProducts.jsp");
        rd.forward(req, resp);
    }

    private void addProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        try {
            String themAnh = "";
            String maSanPham = req.getParameter("maSanPham");
            String tenSanPham = req.getParameter("tenSanPham");
            String maTacGia = req.getParameter("maTacGia");
            String namXuatBanstr = req.getParameter("namXuatBan");
            String giaGocstr = req.getParameter("giaGoc");
            String giaBanstr = req.getParameter("giaBan");
            String soLuongstr = req.getParameter("soLuong");
            String maTheLoai = req.getParameter("maTheLoai");
            String moTa = req.getParameter("moTa");
            String gianhapstr = req.getParameter("gianhap");


            int namXuatBan = Integer.parseInt(namXuatBanstr);
            double giaGoc = Double.parseDouble(giaGocstr);
            double giaBan = Double.parseDouble(giaBanstr);
            int soLuong = Integer.parseInt(soLuongstr);
            double gianhap = Double.parseDouble(gianhapstr);

            tacGia tg = (new tacGiaDAO().selectById(new tacGia(maTacGia, "", null, "")));
            theLoai tl = (new theLoaiDAO().selectById(new theLoai(maTheLoai, "")));

            sanPhamDAO spdao = new sanPhamDAO();
            StringBuilder baoLoi = new StringBuilder();
            String url = "/admin/addProducts.jsp";

            if (maSanPham == null || maSanPham.trim().isEmpty()) {
                baoLoi.append("Cần nhập mã sản phẩm<br>");
            }
            if (maTacGia == null || maTacGia.trim().isEmpty()) {
                baoLoi.append("Cần nhập mã tác giả<br>");
            }
            if (baoLoi.length() > 0) {
                req.setAttribute("baoLoi", baoLoi.toString());
                req.getRequestDispatcher(url).forward(req, resp);
                return;
            } else {
                String folder = getServletContext().getRealPath("anhSanPham");
                File uploadDir = new File(folder);
                if (!uploadDir.exists()) uploadDir.mkdir();
                for (Part filePart : req.getParts()) {
                    if (filePart != null && filePart.getSubmittedFileName() != null) {
                        if (filePart.getSize() > 5 * 1024 * 1024) {
                            System.out.println("File to vl");
                            return;
                        }
                        String fileName = getFileName(filePart);
                        if (fileName != null) {
                            File file = new File(folder + File.separator + fileName);
                            try (InputStream in = filePart.getInputStream()) {
                                Files.copy(in, file.toPath());
                                themAnh = fileName;
                            }
                        }
                    }
                }

                sanPham sanPham = new sanPham(maSanPham, tenSanPham, tg, namXuatBan, giaGoc, giaBan, soLuong, tl, moTa, themAnh, gianhap);
                spdao.insert(sanPham);
                req.setAttribute("cl", "green");
                req.setAttribute("baoLoi", "Thêm thành công!");
            }
            RequestDispatcher rd = req.getServletContext().getRequestDispatcher(url);
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public String getFileName(Part p) {
        String content = p.getHeader("content-disposition");
        String[] tokens = content.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return null;
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        sanPhamDAO dao = new sanPhamDAO();
        sanPham sanPham = new sanPham();
        sanPham.setMaSanPham(id);
        String url = "/admin/listProducts.jsp";
        StringBuilder baoLoi = new StringBuilder();

        int result = dao.delete(sanPham);


        if (result >= 1) {
            baoLoi.append("Xoa thanh cong");
            req.setAttribute("cl", "green");
        } else {
            baoLoi.append("Xoa khong thanh cong");
            req.setAttribute("cl", "red");
        }
        ArrayList<sanPham> sanPhams = dao.selectAll();
        req.setAttribute("listSp", sanPhams);
        req.setAttribute("baoLoi", baoLoi.toString());
        RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher(url);
        dispatcher.forward(req, resp);

    }

    private void listUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        khachHangDAO dao = new khachHangDAO();
        ArrayList<khachHang> listKhachHang = dao.selectAll();
        req.setAttribute("listKhachHang", listKhachHang);

        RequestDispatcher rd = req.getRequestDispatcher("/admin/userManagement.jsp");
        rd.forward(req, resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        khachHangDAO dao = new khachHangDAO();
        khachHang khachHang = new khachHang();
        khachHang.setMaKhachHang(id);

        String url = "/admin/userManagement.jsp";
        StringBuilder baoLoi = new StringBuilder();

        int result = dao.delete(khachHang);
        if (result >= 1) {
            baoLoi.append("Xoa thanh cong");
            req.setAttribute("cl", "green");
        } else {
            baoLoi.append("Xoa khong thanh cong");
            req.setAttribute("cl", "red");
        }
        ArrayList<khachHang> khachHangArrayList = dao.selectAll();
        req.setAttribute("listKhachHang", khachHangArrayList);
        req.setAttribute("baoLoi", baoLoi.toString());
        RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }

    public void bill_management(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        donHangDAO donHangDao = new donHangDAO();
        ArrayList<donHang> list = donHangDao.selectAll();
        req.setAttribute("listDonHang", list);
        RequestDispatcher rd = req.getRequestDispatcher("/admin/billManagement.jsp");
        rd.forward(req, resp);
    }

    public void bill_status(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status = req.getParameter("status");
        String madonhang = req.getParameter("madonhang");
        donHangDAO donHangdao = new donHangDAO();
        notificationDAO notificationDAO = new notificationDAO();
        donHang donHang = donHangdao.selectByID(Integer.parseInt(madonhang));
        Object obj = req.getSession().getAttribute("khachHang");
        khachHang khachHang = null;
        if (obj != null && obj instanceof khachHang) {
            khachHang = (khachHang) obj;
        }
        if (madonhang != null && status != null) {
            TrangThaiDonHang currentStatus = donHang.getTrangThaiDonHang();
            TrangThaiDonHang nextStatus = TrangThaiDonHang.valueOf(status);

            boolean canUpdate = false;
            if (currentStatus == TrangThaiDonHang.DANG_CHO && nextStatus == TrangThaiDonHang.DA_XAC_NHAN) {
                canUpdate = true;
            } else if (currentStatus == TrangThaiDonHang.DA_XAC_NHAN && nextStatus == TrangThaiDonHang.DANG_GIAO) {
                canUpdate = true;
            } else if (currentStatus == TrangThaiDonHang.DANG_GIAO && nextStatus == TrangThaiDonHang.DA_GIAO) {
                canUpdate = true;
            }

            if (canUpdate) {
                donHangdao.update_status(madonhang, nextStatus);
                EnumNotification enumStatus = EnumNotification.UNREAD;
                String message = "Đơn hàng " + madonhang + " đã được " + nextStatus;
                Notification notification = new Notification(donHang.getKhachHang(), donHang, message, enumStatus, null);
                notificationDAO.addNotify(notification);
                req.setAttribute("message", message);
            } else {
                req.setAttribute("message", "Không thể thay đổi trạng thái đơn hàng này.");
            }
        }
        ArrayList<donHang> donHangsArrayList = donHangdao.selectAll();
        req.setAttribute("listDonHang", donHangsArrayList);

        RequestDispatcher rd = req.getRequestDispatcher("/admin/billManagement.jsp");
        rd.forward(req, resp);
    }

    public void ListNotify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        notificationDAO notificationDAO = new notificationDAO();

        ArrayList<Notification> notifications = notificationDAO.getNotify(id);

        notificationDAO.markAllAsRead(id);

        int unReadCount = notificationDAO.getUnreadNotificationCount(id);
        req.setAttribute("unReadCount", unReadCount);
        req.setAttribute("notifications", notifications);
        RequestDispatcher rd = req.getRequestDispatcher("/khachhang/notify.jsp");
        rd.forward(req, resp);
    }


    public void revenue(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String revenueType = req.getParameter("revenueType");
        DoanhThuDAO dao = new DoanhThuDAO();
        double revenue = 0;
        double cost = 0;
        double profit = 0;
        int countBill = 0;
        String selectTime = "";
        DecimalFormat decimalFormat = new DecimalFormat("#,###.##");
        try {
            switch (revenueType) {
                case "daily":
                    Date selectDate = Date.valueOf(req.getParameter("date"));
                    revenue = dao.getrevenueDate(selectDate);
                    cost = dao.getCostDate(selectDate);
                    countBill = (int) dao.getCountBillDate(selectDate);
                    selectTime = selectDate.toString();
                    break;
                case "monthly":
                    String[] dateParts = req.getParameter("month").split("-");
                    int year = Integer.parseInt(dateParts[0]);
                    int month = Integer.parseInt(dateParts[1]);
                    revenue = dao.getrevenueMonth(month, year);
                    cost = dao.getCostMonth(month, year);
                    countBill = (int) dao.getCountBillMonth(month, year);
                    selectTime = month + "/" + year;
                    break;
                case "quarterly":
                    int quarter = Integer.parseInt(req.getParameter("quarter"));
                    int yearQuarter = Integer.parseInt(req.getParameter("yearQuarter"));
                    revenue = dao.getrevenueQuarter(quarter, yearQuarter);
                    cost = dao.getCostQuarter(quarter, yearQuarter);
                    countBill = (int) dao.getCountBillQuarter(quarter, yearQuarter);
                    selectTime = quarter + "/" + yearQuarter;
                    break;
                case "yearly":
                    int yearly = Integer.parseInt(req.getParameter("year"));
                    revenue = dao.getrevenueYear(yearly);
                    cost = dao.getCostYear(yearly);
                    countBill = (int) dao.getCountBillYear(yearly);
                    selectTime = String.valueOf(yearly);
                    break;
            }
            profit = revenue - cost;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String formattedRevenue = decimalFormat.format(revenue);
        String formattedCost = decimalFormat.format(cost);
        String formattedProfit = decimalFormat.format(profit);
        req.setAttribute("revenue", formattedRevenue);
        req.setAttribute("cost", formattedCost);
        req.setAttribute("profit", formattedProfit);
        req.setAttribute("countBill", countBill);
        req.setAttribute("revenueType", revenueType);
        req.setAttribute("selectTime", selectTime);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/Revenue.jsp");
        dispatcher.forward(req, resp);
    }

}