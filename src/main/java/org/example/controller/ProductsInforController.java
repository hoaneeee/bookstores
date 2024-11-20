package org.example.controller;

import database.reviewsDAO;
import database.sanPhamDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GioHang;
import model.khachHang;
import model.reviews;
import model.sanPham;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Products_information", value = "/products-information")
public class ProductsInforController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hd = req.getParameter("hd");
        if ("prd_information".equals(hd)) {
            prd_information(req, resp);
        } else if ("cart-product".equals(hd)) {
            cart(req, resp);
        } else if ("update-cart".equals(hd)) {
            updateProductsCart(req, resp);
        } else if ("delete".equals(hd)) {
            deleteProduct(req, resp);
        } else if ("search-product".equals(hd)) {
            searchProducts(req, resp);
        } else if ("cart-search".equals(hd)) {
            AddCartSearch(req, resp);
        } else if ("filter".equals(hd)) {
            filterProducts(req, resp);
        } else if ("category".equals(hd)) {
            Category(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void prd_information(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet is called");
        String id = req.getParameter("id");
        sanPhamDAO sanPhamDAO = new sanPhamDAO();
        reviewsDAO reviewsDAO = new reviewsDAO();
        sanPham tempSanPham = new sanPham();
        tempSanPham.setMaSanPham(id);
        sanPham sanPham = sanPhamDAO.selectById(tempSanPham);
        List<reviews> reviews = reviewsDAO.findByProductId(id);
        req.setAttribute("reviews", reviews);
        req.setAttribute("sanPham", sanPham);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/products_information.jsp");
        dispatcher.forward(req, resp);
    }

    private void cart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String quantityString = req.getParameter("quantity");
        int quantity = Integer.parseInt(quantityString);

        HttpSession session = req.getSession();
        khachHang kh = (khachHang) session.getAttribute("khachHang");
        if (kh == null) {
            RequestDispatcher rd = req.getRequestDispatcher("/khachhang/dangnhap.jsp");
            rd.forward(req, resp);
            return;
        }
        kh.addCart(Integer.parseInt(id), quantity);
        session.setAttribute("khachHang", kh);
        req.setAttribute("cl", "green");
        req.setAttribute("baoLoi", "Thêm thành công!");
        prd_information(req, resp);
    }

    private void AddCartSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String quantityString = req.getParameter("quantity");
        int quantity = Integer.parseInt(quantityString);

        HttpSession session = req.getSession();
        khachHang kh = (khachHang) session.getAttribute("khachHang");
        if (kh == null) {
            RequestDispatcher rd = req.getRequestDispatcher("/khachhang/dangnhap.jsp");
            rd.forward(req, resp);
            return;
        }
        kh.addCart(Integer.parseInt(id), quantity);
        req.setAttribute("cl", "green");
        req.setAttribute("baoLoi", "Thêm thành công!");
        String search = req.getParameter("search");
        if (search != null && !search.isEmpty()) {
            sanPhamDAO spd = new sanPhamDAO();
            ArrayList<sanPham> results = spd.searchByNameAndCategory(search);
            req.setAttribute("results", results);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/product/search_products.jsp");
        rd.forward(req, resp);
    }

    private void updateProductsCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        khachHang kh = (khachHang) session.getAttribute("khachHang");
        if (kh != null) {
            int id = Integer.parseInt(req.getParameter("productId"));
            String action = req.getParameter("action");
            if (action.equals("increase")) {
                kh.addCart(id, 1);
            } else if (action.equals("decrease")) {
                GioHang item = null;
                for (GioHang g : kh.getGioHangList()) {
                    if (g.id == id) {
                        item = g;
                        break;
                    }
                }
                if (item != null && item.quantity >= 1) {
                    kh.addCart(id, -1);
                } else {
                    kh.deleteCart(id);
                }
            }
            session.setAttribute("khachHang", kh);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/product/cart.jsp");
        rd.forward(req, resp);
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        khachHang kh = (khachHang) session.getAttribute("khachHang");

        if (kh != null) {
            int id = Integer.parseInt(req.getParameter("Id"));
            String delete = req.getParameter("delete");
            if (delete.equals("xoa")) {
                kh.deleteCart(id);
            }
            session.setAttribute("khachHang", kh);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/product/cart.jsp");
        rd.forward(req, resp);
    }

    //search
    private void searchProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        if (search != null && !search.isEmpty()) {
            sanPhamDAO spd = new sanPhamDAO();
            ArrayList<sanPham> results = spd.searchByNameAndCategory(search);
            HttpSession session = req.getSession();
            session.setAttribute("searchResults", results);
            session.setAttribute("searchQuery", search);
            req.setAttribute("results", results);
            req.setAttribute("search",search);
            RequestDispatcher rd = req.getRequestDispatcher("/product/search_products.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("cl", "green");
            req.setAttribute("baoLoi", "Chua nhap thong tin tim kiem");
            RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
            rd.forward(req, resp);
        }

    }

    private void filterProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String filter = req.getParameter("filter");
        HttpSession session = req.getSession();

        // Lấy kết quả tìm kiếm từ session
        ArrayList<sanPham> searchResults = (ArrayList<sanPham>) session.getAttribute("searchResults");
        ArrayList<sanPham> filterPrd = new ArrayList<>();
        String search = req.getParameter("search");
        if (search == null) {
            search = (String) session.getAttribute("searchQuery");
        }


        sanPhamDAO spd = new sanPhamDAO();

        if (searchResults != null && !searchResults.isEmpty()) {

            switch (filter) {
                case "newest":
                    filterPrd = spd.filterByNewest(searchResults);
                    break;
                case "best-seller":
                    filterPrd = spd.filterByBestSeller(searchResults);
                    break;
                case "low-to-high":
                    filterPrd = spd.filterByPriceLowToHigh(searchResults);
                    break;
                case "high-to-low":
                    filterPrd = spd.filterByPriceHighToLow(searchResults);
                    break;
                default:
                    filterPrd = searchResults;
                    break;
            }
        }
        session.setAttribute("searchQuery", search);
        req.setAttribute("search", search);
        req.setAttribute("results", filterPrd);
        RequestDispatcher rd = req.getRequestDispatcher("/product/search_products.jsp");
        rd.forward(req, resp);
    }

    public void Category(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        sanPhamDAO sanPhamDAO = new sanPhamDAO();
        ArrayList<sanPham> list = sanPhamDAO.getProductByCategoryId(id);
        req.setAttribute("listCategory", list);
        RequestDispatcher rd = req.getRequestDispatcher("/product/categoryProducts.jsp");
        rd.forward(req, resp);
    }

}
