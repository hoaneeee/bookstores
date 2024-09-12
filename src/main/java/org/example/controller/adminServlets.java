package org.example.controller;

import database.sanPhamDAO;
import database.tacGiaDAO;
import database.theLoaiDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.sanPham;
import model.tacGia;
import model.theLoai;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminServlets", value = "/admin-addProducts")
public class adminServlets extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String active = req.getParameter("active")+"";
        if (active.equals("them san pham")) {
            addProducts(req, resp);
        }
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
        }
    }
}
