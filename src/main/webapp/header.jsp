<%@ page import="model.khachHang" %>
<%@ page import="database.notificationDAO" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 20/08/2024
  Time: 11:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/font/fontawesome-free-6.4.0-web/css/all.min.css">
<link rel="stylesheet" href="css/main.css">
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<style>
    .background-header {
        background: linear-gradient(45deg, #ff6b6b, #ffcc33);
    }

    .logo-icons {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .social-icons {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .social-icons a {
        color: #ffffff;
        font-size: 1.5rem;
        transition: color 0.3s ease;
    }

    .social-icons a:hover {
        color: #ffcc33;
    }

    .divider {
        height: 24px;
        width: 1px;
        background-color: #ffffff;
        margin: 0 8px;
    }

    .input_search {
        width: 500px;
        height: 50px;
        border-radius: 25px;
    }

    .btn-outline-light i {
        font-size: 1.5rem;
        color: #ffffff;
    }


    .notification-icon .badge {
        background-color: red;
        color: white;
        border-radius: 50%;
        padding: 5px 8px;
        font-size: 0.8rem;
    }
    .navbar {
        padding-top: 0px;
    }


    .navbar-nav .dropdown-menu {
        position: relative;
        top: -20%;
        right: -100%;
        background-color: #ffffff;
        border-radius: 5px;
        opacity: 0;
        visibility: hidden;
        transition: opacity 0.3s ease, visibility 0.3s ease, right 0.3s ease;
    }


    .navbar-nav .dropdown:hover .dropdown-menu {
        visibility: visible;
        opacity: 1;
        right: 0;
    }


    .navbar-nav .dropdown-menu {
        /*transform: rotate(4deg);*/
        transform-origin: top right;
    }

    .navbar-nav .dropdown-item:hover {
        background-color: #ffcc33;
        color: #000;
    }

    .input_search {
        width: 500px;
        height: 50px;
        border-radius: 25px;
    }
    .card-img-top-avatar{
        width: 50px;
        height: 50px;
        border-radius: 100%;
    }

</style>

<nav class="navbar navbar-expand-lg bg-body-tertiary padding-background">
    <div class="container-fluid background-header">
        <div class="logo-icons">
            <a class="navbar-brand" href="<%=url%>/home.jsp">
                <img src="http://localhost:8080/bookStores/img/White%20Black%20Minimalist%20Brand%20Logo.png"
                     alt="Bootstrap" height="80" style="border-radius: 5px;">
            </a>
            <div class="social-icons">
                <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                <span class="divider"></span>
                <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            </div>
        </div>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

            </ul>

            <form action="<%=url%>/products-information?hd=search-product" method="post" class="d-flex " role="search">
                <input class="form-control me-2 input_search" type="search"
                       name="search" placeholder="Nội dung tìm kiếm" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Tìm kiếm</button>
            </form>

            <div class="ms-auto d-flex align-items-center">
                <div class="me-3">
                    <a href="<%=url%>/product/cart.jsp" class="btn btn-outline-light">
                        <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    </a>
                </div>

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
                <% } else { %>
                <div class="me-3 notification-icon">
                    <a href="<%=url%>/admin-servlet?active=notify&id=<%=khachHang != null ? khachHang.getMaKhachHang() : "" %>"
                       class="btn-outline-light">
                        <i class="fa fa-bell"></i>
                        <%
                            notificationDAO notificationDao = new notificationDAO();
                            int unreadCount = notificationDao.getUnreadNotificationCount(khachHang.getMaKhachHang());
                            if (unreadCount > 0) {
                        %>
                        <span class="badge"><%=unreadCount%></span>
                        <% } %>
                    </a>
                </div>

                <ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor ">
                    <li class="nav-item dropdown dropstart">
                        <a class="nav-link dropdown-toggle background-taiKhoan" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false"><i
                                class="user-avatar"></i><img src="<%=url%>/anhSanPham/<%=khachHang.getAvatar() %>" class="card-img-top-avatar">
                        </a>
                        <ul class="dropdown-menu">
                            <%
                                if ("admin".equals(khachHang.getVaiTro())) {
                            %>
                            <li><a class="dropdown-item" href="<%=url%>/admin-servlet?active=danh-sach-san-pham1">Danh
                                sách sản phẩm</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin/addProducts.jsp">Thêm sản phẩm</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin-servlet?active=danh-sach-user">Quản lý
                                người dùng</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin-servlet?active=billManagement">Quản lý đơn
                                hàng</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin/Revenue.jsp">Doanh thu</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhDong=sign-out">Thoát tài
                                khoản</a></li>
                            <% } else { %>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhDong=mybill">Đơn hàng của tôi</a>
                            </li>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhDong=info">Thông tin tài khoản</a>
                            </li>
                            <li><a class="dropdown-item" href="<%=url%>/khachhang/updateInformation.jsp"> Cập nhật thông
                                tin
                            </a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhDong=sign-out">Thoát tài
                                khoản</a></li>
                            <% } %>
                        </ul>
                    </li>
                </ul>
                <% } %>
            </div>
        </div>
    </div>
</nav>


<script>

    function fetchNotification() {
        fetch('<%=url %>/getNotificationCount', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(data => {
                console.log("Data from server:", data);
                const count = data.count;
                const notification = document.querySelector('.notification-icon');
                console.log(count);
                if (count > 0) {
                    notification.innerHTML = '<a href="<%=url%>/admin-servlet?active=notify&id=<%=khachHang != null ? khachHang.getMaKhachHang() : "" %>" class="btn-outline-light">' +
                        '<i class="fa fa-bell"></i>' +
                        '<span class="badge">' + count + '</span>' +
                        '</a>';
                } else {
                    notification.innerHTML = '<a href="<%=url%>/admin-servlet?active=notify&id=<%=khachHang != null ? khachHang.getMaKhachHang() : "" %>" class="btn-outline-light">' +
                        '<i class="fa fa-bell"></i>' +
                        '</a>';
                }
            })
            .catch(error => console.error('Error fetching notification count:', error));
    }

    setInterval(fetchNotification, 5000);
</script>
<%--                <li class="nav-item dropdown">--%>
<%--                    <div class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown"--%>
<%--                         aria-expanded="false">--%>
<%--                        Thể loại--%>
<%--                    </div>--%>
<%--                    <ul class="dropdown-menu">--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Tiểu%20thuyết"--%>
<%--                               class="category__list-item--link ">Tiểu thuyết </a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Trinh%20thám"--%>
<%--                               class="category__list-item--link">Trinh thám</a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Kinh%20dị"--%>
<%--                               class="category__list-item--link">Kinh dị</a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Ngụ%20ngôn"--%>
<%--                               class="category__list-item--link">Ngụ ngôn</a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Thần%20thoại"--%>
<%--                               class="category__list-item--link">Thần thoại</a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Phiêu%20lưu"--%>
<%--                               class="category__list-item--link">Phiêu lưu</a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Tuổi%20trẻ"--%>
<%--                               class="category__list-item--link">Tuổi trẻ</a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Học%20đường"--%>
<%--                               class="category__list-item--link">Học đường</a>--%>
<%--                        </li>--%>
<%--                        <li class="category__list-item">--%>
<%--                            <a href="<%=url%>/products-information?hd=category&id=Lãng%20mạn"--%>
<%--                               class="category__list-item--link">Lãng mạn</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </li>--%>