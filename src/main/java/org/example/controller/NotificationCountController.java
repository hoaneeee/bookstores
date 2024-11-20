package org.example.controller;

import database.notificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.khachHang;

import java.io.IOException;

@WebServlet("/getNotificationCount")
public class NotificationCountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("khachHang");
        resp.setContentType("application/json");

        if (obj != null && obj instanceof model.khachHang) {
            khachHang khachHang = (khachHang) obj;
            String makhachhang = khachHang.getMaKhachHang();

            notificationDAO notificationdao = new notificationDAO();
            int unReadCount = notificationdao.getUnreadNotificationCount(makhachhang);
            resp.getWriter().write("{\"count\":" + unReadCount + "}");
        } else {
            resp.getWriter().write("{\"count\": 0}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
