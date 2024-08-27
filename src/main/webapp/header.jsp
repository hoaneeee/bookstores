<%@ page import="model.khachHang" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 20/08/2024
  Time: 11:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<link rel="stylesheet" href="./css/font/fontawesome-free-6.4.0-web/css/all.min.css">
<link rel="stylesheet" href="main.css">
<nav class="navbar navbar-expand-lg bg-body-tertiary padding-background">
    <div class="container-fluid background-header">
        <a class="navbar-brand" href="<%=url%>/index.jsp">
            <img src="http://localhost:8080/bookStores/img/White%20Black%20Minimalist%20Brand%20Logo.png"
                 alt="Bootstrap" height="80">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="font-weight: 400; color: var(--text-color)">Combo giảm giá</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Các Loại
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Sách Mới</a></li>
                        <li><a class="dropdown-item" href="#">Sách Cũ</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">any else</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search"
                       placeholder="Nội dung tìm kiếm" aria-label="Search">
                <button class="btn btn-outline-success btn-background" type="submit">search</button>
                <%
                    Object obj = session.getAttribute("khachHang");
                    khachHang khachHang = null;
                    if (obj != null)
                        khachHang = (khachHang) obj;

                    if (khachHang == null) {
                %>
                <a class="btn btn-primary" style="white-space: nowrap;" href="khachhang/dangnhap.jsp">
                    Đăng nhập
                </a>
                <%} else { %>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor ">
                    <li class="nav-item dropdown dropstart">
                        <a
                                class="nav-link dropdown-toggle background-taiKhoan" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false"> Tài khoản
                        </a>
                        <ul class="dropdown-menu">
                            <%
                                if ("admin".equals(khachHang.getVaiTro())) {
                            %>
                            <li><a class="dropdown-item" href="<%=url%>#">Kho sản phẩm </a></li>
                            <li><a class="dropdown-item" href="<%=url%>#">Xóa sản phẩm  </a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin/addProducts.jsp">Thêm sản phẩm</a></li>
                            <li><a class="dropdown-item" href="<%=url%>#">Quản lý người dùng</a></li>
                            <li><a class="dropdown-item" href="<%=url%>#">Quản lý đơn hàng</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhdong=sign-out">Thoát tài
                                khoản</a></li>
                            <%} else {%>
                            <li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
                            <li><a class="dropdown-item" href="#">Thông báo</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/khachhang/changeInformation.jsp">Thay đổi thông
                                tin</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/khachhang/changePassword.jsp">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhdong=sign-out">Thoát tài
                                khoản</a></li>
                            <%}%>
                        </ul>
                    </li>
                </ul>
                <% } %>
            </form>
        </div>
    </div>
</nav>
