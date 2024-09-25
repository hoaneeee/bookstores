    package org.example.controller;

    import database.sanPhamDAO;
    import database.tacGiaDAO;
    import database.theLoaiDAO;
    import jakarta.servlet.RequestDispatcher;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.MultipartConfig;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.HttpServlet;
    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;
    import jakarta.servlet.http.Part;
    import model.sanPham;
    import model.tacGia;
    import model.theLoai;

    import java.io.File;
    import java.io.IOException;
    import java.io.InputStream;
    import java.nio.file.Files;
    import java.util.ArrayList;

    @WebServlet(name = "adminServlets", urlPatterns ={"/admin-servlet","/upload"} )
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024 * 2,
            maxFileSize = 1024 * 1024 * 10,
            maxRequestSize = 1024 * 1024 * 50
    )
    public class adminServlets extends HttpServlet {
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
            } else if ("danh-sach-san-pham".equals(active)) {
                listProduct(req, resp);
            } else if ("xoa-san-pham".equals(active)) {
                deleteProduct(req, resp);
            }
        }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            doPost(req, resp);
        }
        private void listProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            sanPhamDAO sanPhamDAO = new sanPhamDAO();
            ArrayList<sanPham> listSp= sanPhamDAO.selectAll();

            req.setAttribute("listSp", listSp);
            RequestDispatcher rd = req.getRequestDispatcher("/admin/listProducts.jsp");
            rd.forward(req,resp);
        }
        private void addProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html");
            try{
                String themAnh = "";
                String maSanPham = req.getParameter("maSanPham");
                String tenSanPham = req.getParameter("tenSanPham");
                String maTacGia = req.getParameter("maTacGia");
                String namXuatBanstr= req.getParameter("namXuatBan");
                String giaNhapstr = req.getParameter("giaNhap");
                String giaGocstr= req.getParameter("giaGoc");
                String giaBanstr = req.getParameter("giaBan");
                String soLuongstr = req.getParameter("soLuong");
                String maTheLoai = req.getParameter("maTheLoai");
                String ngonNgu = req.getParameter("ngonNgu");
                String moTa = req.getParameter("moTa");

                int namXuatBan=Integer.parseInt(namXuatBanstr);
                double giaNhap=Double.parseDouble(giaNhapstr);
                double giaGoc=Double.parseDouble(giaGocstr);
                double giaBan=Double.parseDouble(giaBanstr);
                int soLuong = Integer.parseInt(soLuongstr);

                tacGia tg= (new tacGiaDAO().selectById(new tacGia(maTacGia,"",null,"")));
                theLoai tl = (new theLoaiDAO().selectById(new theLoai(maTheLoai,"")));

                sanPhamDAO spdao = new sanPhamDAO();
                String url = "/admin/addProducts.jsp";
                StringBuilder baoLoi = new StringBuilder();

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
                }else {
                    String folder= getServletContext().getRealPath("anhSanPham");
                    File uploadDir = new File(folder);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    for(Part filePart : req.getParts()) {
                        if(filePart != null && filePart.getSubmittedFileName() != null) {
                            if(filePart.getSize() > 5 * 1024 * 1024) {
                                System.out.println("File to vl");
                                return;
                            }
                            String fileName = getFileName(filePart);
                            if(fileName != null) {
                                File file = new File(folder + File.separator + fileName);
                                try(InputStream in = filePart.getInputStream()) {
                                    Files.copy(in,file.toPath());
                                    themAnh=fileName;
                                }
                            }
                        }
                    }

                    sanPham sanPham = new sanPham(maSanPham, tenSanPham, tg, namXuatBan, giaNhap, giaGoc, giaBan, soLuong, tl, ngonNgu, moTa, themAnh);
                    spdao.insert(sanPham);
                    req.setAttribute("cl", "green");
                    req.setAttribute("baoLoi", "Thêm thành công!");
                }


                RequestDispatcher rd   = req.getServletContext().getRequestDispatcher(url);
                rd.forward(req,resp);

            }catch(Exception e){
                e.printStackTrace();
                req.setAttribute("baoLoi", "Lỗi: " + e.getMessage());
                req.getRequestDispatcher("/admin/addProducts.jsp").forward(req, resp);
            }

/*

                if (maSanPham==null || maSanPham.trim().isEmpty()){
                    baoLoi="Cần nhập mã sản phẩm";
                } else if (spdao.checkMASP(maSanPham)) {
                    baoLoi="Mã sản phẩm đã tồn tại ";
                }
                if(maTacGia==null || maTacGia.trim().isEmpty()){
                    baoLoi=" cần nhap ma tac gia ";
                }
                if(baoLoi.length()>0){
                    url="/admin/addProducts.jsp";
                }else {
                    sanPham sanPham= new sanPham(maSanPham,tenSanPham,tg,namXuatBan,giaNhap,giaGoc,giaBan,soLuong,tl,ngonNgu,moTa,themAnh);
                    spdao.insert(sanPham);
                    baoLoi="Them san pham thanh cong";
                    url="/admin/addProducts.jsp";
                }

                req.setAttribute("baoLoi",baoLoi);
                RequestDispatcher rd = req.getServletContext().getRequestDispatcher(url);
                rd.forward(req, resp);
*/


        }
        public String getFileName(Part p){
            String content = p.getHeader("content-disposition");
            String [] tokens = content.split(";");
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


            if (result >=1) {
                baoLoi.append("Xoa thanh cong");
                req.setAttribute("cl", "green");
            }else {
                baoLoi.append("Xoa khong thanh cong");
                req.setAttribute("cl", "red");
            }
            ArrayList<sanPham> sanPhams = dao.selectAll();
            req.setAttribute("listSp", sanPhams);
            req.setAttribute("baoLoi", baoLoi.toString());
            RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher(url);
            dispatcher.forward(req, resp);

        }
    }