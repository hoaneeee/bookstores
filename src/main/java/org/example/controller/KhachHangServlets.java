package org.example.controller;

import database.khachHangDAO;
import database.sanPhamDAO;
import database.tacGiaDAO;
import database.theLoaiDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import maHoa.maHoa;
import model.khachHang;
import model.sanPham;
import model.tacGia;
import model.theLoai;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileStore;
import java.sql.Date;
import java.util.List;
import java.util.Random;

@WebServlet(name = "KhachHangServlets", value = "/khach-hang")

public class KhachHangServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hanhDong = req.getParameter("hanhDong")+"";
        if (hanhDong.equals("sign-in")) {
            sign_in(req, resp);
        } else if (hanhDong.equals("sign-out")) {
            sign_out(req, resp);
        } else if (hanhDong.equals("sign-up")) {
            sign_up(req, resp);
        } else if (hanhDong.equals("changePassword")) {
            changePassword(req, resp);
        } else if (hanhDong.equals("changeInformation")) {
            changeInformation(req, resp);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void sign_up(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String tenDangNhap = req.getParameter("tenDangNhap");
        String matKhau = req.getParameter("matKhau");
        String matKhauNhapLai = req.getParameter("matKhauNhapLai");
        String hoVaTen = req.getParameter("hoVaTen");
        String gioiTinh = req.getParameter("gioiTinh");
        String ngaySinh = req.getParameter("ngaySinh");
        String diaChiKhachHang = req.getParameter("diaChiKhachHang");
        String diaChiMuaHang = req.getParameter("diaChiMuaHang");
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        String dienThoai = req.getParameter("dienThoai");
        String email = req.getParameter("email");
        String dongYDieuKhoan = req.getParameter("dongYDieuKhoan");
        String dongYNhanMail = req.getParameter("dongYNhanMail");

        req.setAttribute("tenDangNhap", tenDangNhap);
        req.setAttribute("hoVaTen", hoVaTen);
        req.setAttribute("gioiTinh", gioiTinh);
        req.setAttribute("ngaySinh", ngaySinh);
        req.setAttribute("diaChiKhachHang", diaChiKhachHang);
        req.setAttribute("diaChiMuaHang", diaChiMuaHang);
        req.setAttribute("diaChiNhanHang", diaChiNhanHang);
        req.setAttribute("dienThoai", dienThoai);
        req.setAttribute("email", email);
        req.setAttribute("dongYDieuKhoan", dongYDieuKhoan);
        req.setAttribute("dongYNhanMail", dongYNhanMail);

        String url = "";
        String baoLoi = "";
        khachHangDAO khachHangDAO = new khachHangDAO();
        if (tenDangNhap == null || tenDangNhap.trim().isEmpty()) {
            baoLoi += "Tên đăng nhập không được để trống. ";
        } else if (khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
            baoLoi += "Tên đăng nhập đã tồn tại, vui lòng thử lại! ";
        }

        if (matKhau == null || !matKhau.equals(matKhauNhapLai)) {
            baoLoi += "Mật khẩu không khớp. ";
        } else {
            matKhau = maHoa.toSHA(matKhau);
        }


        if (baoLoi.length() > 0) {
            url = "/khachhang/register.jsp";
        } else {
            Random rd = new Random();
            String maKhachHang = rd.nextInt(1000) + "";
            String vaiTro = "khach_hang";
            khachHang kh = new khachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, Date.valueOf(ngaySinh), diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, dienThoai, email, dongYNhanMail != null, vaiTro);
            khachHangDAO.insert(kh);
            url = "/success.jsp";
        }

        req.setAttribute("baoLoi", baoLoi);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);

    }

    private void sign_out(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
//        String url = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
//                + req.getContextPath();
        resp.sendRedirect("index.jsp");
    }

    private void sign_in(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tenDangNhap = req.getParameter("tenDangNhap");
        String matKhau = req.getParameter("matKhau");
        matKhau = maHoa.toSHA(matKhau);

        khachHang kh = new khachHang();
        kh.setTenDangNhap(tenDangNhap);
        kh.setMatKhau(matKhau);
        khachHangDAO dao = new khachHangDAO();
        khachHang khachHang = dao.selectByIdAndPassword(kh);

        String url = "";
        if (khachHang != null) {
            HttpSession session = req.getSession();
            session.setAttribute("khachHang", khachHang);
            url = "/index.jsp";
        } else {
            req.setAttribute("baoLoi", "tên đăng nhập hoặc mật khẩu không chính xác!");
            url = "/khachhang/dangnhap.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    private void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String matKhauHienTai = req.getParameter("matKhauHienTai");
        String matKhauMoi = req.getParameter("matKhauMoi");
        String matKhauMoiNhapLai = req.getParameter("matKhauMoiNhapLai");

        String matKhauHienTai_Sha1 = maHoa.toSHA(matKhauHienTai);

        String baoLoi = "";
        String url = "/khachhang/changePassword.jsp";

        // Kiem tra mat khau cu co giong hay khong
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("khachHang");
        khachHang khachHang = null;
        if (obj != null)
            khachHang = (khachHang) obj;
        if (khachHang == null) {
            baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
        } else {
            // Neu khach hang da dang nhap
            if (!matKhauHienTai_Sha1.equals(khachHang.getMatKhau())) {
                baoLoi = "Mật khẩu hiện tại không chính xác!";
            } else {
                if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
                    baoLoi = "Mật khẩu nhập lại không khớp!";
                } else {
                    String matKhauMoi_Sha1 = maHoa.toSHA(matKhauMoi);
                    khachHang.setMatKhau(matKhauMoi_Sha1);
                    khachHangDAO khd = new khachHangDAO();
                    if (khd.changePassword(khachHang)) {
                        baoLoi = "Mật khẩu đã thay đổi thành công. sẽ quay trở lại trang chủ sau 3s";
                        session.setAttribute("khachHang", khachHang);
                        req.setAttribute("redirect", "index.jsp");
                    } else {
                        baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
                    }
                }
            }
        }

        req.setAttribute("baoLoi", baoLoi);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    private void changeInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hoVaTen = req.getParameter("hoVaTen");
        String gioiTinh = req.getParameter("gioiTinh");
        String ngaySinh = req.getParameter("ngaySinh");
        String diaChiKhachHang = req.getParameter("diaChiKhachHang");
        String diaChiMuaHang = req.getParameter("diaChiMuaHang");
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        String dienThoai = req.getParameter("dienThoai");
        String email = req.getParameter("email");
        String dongYNhanMail = req.getParameter("dongYNhanMail");

        req.setAttribute("hoVaTen", hoVaTen);
        req.setAttribute("gioiTinh", gioiTinh);
        req.setAttribute("ngaySinh", ngaySinh);
        req.setAttribute("diaChiKhachHang", diaChiKhachHang);
        req.setAttribute("diaChiMuaHang", diaChiMuaHang);
        req.setAttribute("diaChiNhanHang", diaChiNhanHang);
        req.setAttribute("dienThoai", dienThoai);
        req.setAttribute("email", email);
        req.setAttribute("dongYNhanMail", dongYNhanMail);

        String url = "";
        String baoLoi = "";

        khachHangDAO khachHangDAO = new khachHangDAO();
        req.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() > 0) {
            url = "/khachhang/register.jsp";
        } else {
            Object object = req.getSession().getAttribute("khachHang");
            khachHang khachHang = null;
            if (object != null) {
                khachHang = (khachHang) object;
                if (khachHang != null) {
                    String maKhachHang = khachHang.getMaKhachHang();
                    khachHang kh = new khachHang(maKhachHang, "", "", hoVaTen, gioiTinh, Date.valueOf(ngaySinh), diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, dienThoai, email, dongYNhanMail != null, "");
                    khachHangDAO.updateInfor(kh);
                    khachHang kh2 = khachHangDAO.selectById(kh);
                    req.getSession().setAttribute("khachHang", kh2);
                    url = "/success.jsp";
                }
            }
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    private void addProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String themAnh = "";
        try {
            System.out.println(req.getContentType());
            if (ServletFileUpload.isMultipartContent((RequestContext) req))
            {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> formItems = upload.parseRequest((RequestContext) req);

                String maSanPham = "";
                String tenSanPham = "";
                String maTacGia = "";
                String namXuatBanstr = "";
                String giaNhapstr = "";
                String giaGocstr = "";
                String giaBanstr = "";
                String soLuongstr = "";
                String maTheLoai = "";
                String ngonNgu = "";
                String moTa = "";

                for (FileItem item : formItems) {
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        switch (name) {
                            case "maSanPham":
                                maSanPham = value;
                                break;
                            case "tenSanPham":
                                tenSanPham = value;
                                break;
                            case "maTacGia":
                                maTacGia = value;
                                break;
                            case "namXuatBan":
                                namXuatBanstr = value;
                                break;
                            case "giaNhap":
                                giaNhapstr = value;
                                break;
                            case "giaGoc":
                                giaGocstr = value;
                                break;
                            case "giaBan":
                                giaBanstr = value;
                                break;
                            case "soLuong":
                                soLuongstr = value;
                                break;
                            case "maTheLoai":
                                maTheLoai = value;
                                break;
                            case "ngonNgu":
                                ngonNgu = value;
                                break;
                            case "moTa":
                                moTa = value;
                                break;
                        }
                    } else {
                        String fileName = new File(item.getName()).getName();
                        String filePath = getServletContext().getRealPath("img") + File.separator + fileName;
                        File fileStore = new File(filePath);
                        item.write(fileStore);
                        themAnh = "img/" + fileName;

                    }
                }

                req.setAttribute("maSanPham", maSanPham);
                req.setAttribute("tenSanPham", tenSanPham);
                req.setAttribute("maTacGia", maTacGia);
                req.setAttribute("namXuatBan", namXuatBanstr);
                req.setAttribute("giaNhap", giaNhapstr);
                req.setAttribute("giaGoc", giaGocstr);
                req.setAttribute("giaBan", giaBanstr);
                req.setAttribute("soLuong", soLuongstr);
                req.setAttribute("maTheLoai", maTheLoai);
                req.setAttribute("ngonNgu", ngonNgu);
                req.setAttribute("moTa", moTa);

                int namXuatban = Integer.parseInt(namXuatBanstr);
                double giaNhap = Double.parseDouble(giaNhapstr);
                double giaGoc = Double.parseDouble(giaGocstr);
                double giaBan = Double.parseDouble(giaBanstr);
                int soLuong = Integer.parseInt(soLuongstr);

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(maTacGia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(maTheLoai, "")));
                String url = "";
                String baoLoi = "";
                sanPhamDAO sanPhamDAO = new sanPhamDAO();
                if (maSanPham == null || maSanPham.trim().isEmpty()) {
                    baoLoi += "ma san pham trong ";
                } else if (sanPhamDAO.checkMASP(maSanPham)) {
                    baoLoi += "ma san pham nay da ton tai";
                }
                if (!baoLoi.isEmpty()) {
                    url = "/admin/addProducts.jsp";
                } else {
                    sanPham sanPham = new sanPham(maSanPham, tenSanPham, tacGia, namXuatban, giaNhap, giaGoc, giaBan, soLuong, theLoai, ngonNgu, moTa, themAnh);
                    sanPhamDAO.insert(sanPham);
                    url = "/success.jsp";
                }
                req.setAttribute("baoLoi", baoLoi);
                RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("baoLoi", "Có lỗi xảy ra. Vui lòng thử lại.");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/addProducts.jsp");
            rd.forward(req, resp);
        }
    }
}
