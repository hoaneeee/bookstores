package org.example.controller;

import database.khachHangDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import maHoa.maHoa;
import model.khachHang;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

@WebServlet(name = "KhachHangServlets", value = "/khach-hang")

public class KhachHangServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hanhDong = req.getParameter("hanhdong");
        if (hanhDong.equals("sign-in")){
            sign_in(req, resp);
        } else if (hanhDong.equals("sign-out")){
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

    @Override
    public void destroy() {
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
        }else {
            matKhau= maHoa.toSHA(matKhau);
        }


        if (baoLoi.length() > 0) {
            url = "/khachhang/register.jsp";
        } else {
            Random rd = new Random();
            String maKhachHang = System.currentTimeMillis() + rd.nextInt(1000) + "";
            String vaiTro = "khach_hang";
            khachHang kh = new khachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, Date.valueOf(ngaySinh), diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, dienThoai, email, dongYNhanMail != null,vaiTro);
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
        resp.sendRedirect("index.jsp");    }
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
        }else {
            req.setAttribute("baoLoi","tên đăng nhập hoặc mật khẩu không chính xác!");
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
        if (obj!=null)
            khachHang = (khachHang)obj;
        if(khachHang==null) {
            baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
        }else {
            // Neu khach hang da dang nhap
            if(!matKhauHienTai_Sha1.equals(khachHang.getMatKhau())){
                baoLoi = "Mật khẩu hiện tại không chính xác!";
            }else {
                if(!matKhauMoi.equals(matKhauMoiNhapLai)) {
                    baoLoi = "Mật khẩu nhập lại không khớp!";
                }else {
                    String matKhauMoi_Sha1 = maHoa.toSHA(matKhauMoi);
                    khachHang.setMatKhau(matKhauMoi_Sha1);
                    khachHangDAO khd = new khachHangDAO();
                    if(khd.changePassword(khachHang)) {
                        baoLoi = "Mật khẩu đã thay đổi thành công. sẽ quay trở lại trang chủ sau 3s";
                        session.setAttribute("khachHang", khachHang);
                        req.setAttribute("redirect", "index.jsp");
                    }else {
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

        String url= "";
        String baoLoi= "";

        khachHangDAO khachHangDAO= new khachHangDAO();
        req.setAttribute("baoLoi",baoLoi);

        if (baoLoi.length()>0){
            url="/register.jsp";
        }else {
            Object object = req.getSession().getAttribute("khachHang");
            khachHang khachHang= null;
            if (object!=null){
                khachHang=(khachHang)object;
                if (khachHang!=null){
                    String maKhachHang = khachHang.getMaKhachHang();
                    khachHang kh = new khachHang(maKhachHang,"", "", hoVaTen, gioiTinh, Date.valueOf(ngaySinh), diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, dienThoai, email, dongYNhanMail != null,"");
                    khachHangDAO.updateInfor(kh);
                    khachHang kh2 = khachHangDAO.selectById(kh);
                    req.getSession().setAttribute("khachHang", kh2);
                    url="/success.jsp";
                }
            }
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }
}
