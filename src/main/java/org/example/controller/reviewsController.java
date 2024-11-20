package org.example.controller;

import com.google.gson.JsonObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.khachHang;
import model.reviews;
import database.reviewsDAO;
import model.sanPham;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@WebServlet("/reviews")
public class reviewsController extends HttpServlet {

    private reviewsDAO reviewsDAO;

    @Override
    public void init() throws ServletException {
        reviewsDAO = new reviewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        System.out.println("--- Debug Parameters ---");
        Map<String, String[]> paramMap = req.getParameterMap();
        for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + Arrays.toString(entry.getValue()));
        }

        String productId = req.getParameter("masanpham");
        String ratingStr = req.getParameter("rating");
        String comment = req.getParameter("comment");

        System.out.println("productId: " + productId);
        System.out.println("ratingStr: " + ratingStr);
        System.out.println("comment: " + comment);

        HttpSession session = req.getSession();
        khachHang kh = (khachHang) session.getAttribute("khachHang");
        System.out.println("khachHang from session: " + (kh != null ? kh.getHoVaten() : "null"));


        JsonObject jsonResponse = new JsonObject();

        if (productId == null || ratingStr == null || comment == null) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Thiếu thông tin cần thiết");
            System.out.println("Missing parameters - productId: " + productId +
                    ", ratingStr: " + ratingStr +
                    ", comment: " + comment);

        } else if (kh == null) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Vui lòng đăng nhập để đánh giá");
        } else {
                sanPham product = new sanPham();
                product.setMaSanPham(productId);

                int rating = Integer.parseInt(ratingStr);

                reviews newReview = new reviews();
                newReview.setMa_san_pham(product);
                newReview.setRating(rating);
                newReview.setComment(comment);
                newReview.setMa_khach_hang(kh);

                int isAdded = reviewsDAO.addReview(newReview);

                if (isAdded > 0) {
                    jsonResponse.addProperty("status", "success");
                    jsonResponse.addProperty("user", kh.getHoVaten());

                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Không thể thêm đánh giá");
                }
        }

        resp.setContentType("application/json");
        resp.getWriter().write(jsonResponse.toString());
    }
}
