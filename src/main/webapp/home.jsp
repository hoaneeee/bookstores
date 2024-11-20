<%@ page import="model.khachHang" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="org.example.controller.KhachHangController" %>
<%@ page import="model.sanPham" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 08/11/2024
  Time: 1:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="img/z5941963793233_d9c1a1edf38363c24a1825489d9e5930.jpg" type="image/jpg">
    <style>
        body {
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
            color: #333;
        }

        .navbar {
            background: linear-gradient(45deg, #ff6b6b, #ffcc33);
        }

        .navbar-brand, .navbar-nav .nav-link {
            color: #ffffff !important;
            font-weight: bold;
        }

        .carousel-item img {
            height: 450px;
            object-fit: cover;
            filter: brightness(85%);
        }

        .carousel-caption {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 1rem;
            border-radius: 8px;
        }

        .card {
            background-color: #ffffff;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }

        .card-img-top {
            height: 250px;
            object-fit: cover;
        }

        .card-title {
            color: #ff6b6b;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #ff6b6b;
            border: none;
            transition: background-color 0.3s;
        }

        .footer {
            background-color: #333333;
            color: #ffffff;
            padding: 1.5rem 0;
        }

        .footer a {
            color: #ffcc33;
            text-decoration: none;
        }

        .container_padding {
            padding-top: 50px;
        }
        .text-center-header{
            font-weight: bold;
            color: white;

        }

    </style>
    <%
        Cookie ck[] = request.getCookies();
        String u = "";
        String pas = "";
        if (ck != null) {
            for (Cookie c : ck) {
                if (c.getName().equals("username")) {
                    u = c.getValue();
                } else if (c.getName().equals("password")) {
                    pas = c.getValue();
                }
            }
            KhachHangController.gI().sign_in(u, pas, session);
        }
    %>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const urlParams = new URLSearchParams(window.location.search);
            if (!urlParams.has('active') || urlParams.get('active') !== 'danh-sach-san-pham2') {
                window.location.href = "<%=url%>/admin-servlet?active=danh-sach-san-pham2";
            }
        });
    </script>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container_padding">
    <div id="bookCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://media.newyorker.com/photos/59ee325f1685003c9c28c4ad/4:3/w_4992,h_3744,c_limit/Heller-Kirkus-Reviews.jpg"
                     class="d-block w-100" alt="Books">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Chi thức là sức mạnh  </h5>
                    <p>Hãy khai phá tiềm năng và sức mạnh của bạn thông qua sách của chúng tôi!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://edutrip.edu.vn/wp-content/uploads/2022/07/19-noi-chuyen-la-ban-nang-giu-mieng-la-tu-duong-im-lang-la-tri-tue.jpg"
                     class="d-block w-100" alt="Reading">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Best Sellers</h5>
                    <p>Sách được đọc giả săn đón nhiều nhất </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Book Section -->

    <div class="container my-5">
        <h2 class="text-center text-center-header mb-4">Sách là của tôi , kiến thức là của bạn<l></l></h2>
        <div class="row">
            <% ArrayList<sanPham> sanPhams = (ArrayList<sanPham>) request.getAttribute("listSp");
                Integer currentPage = (Integer) request.getAttribute("current");
                Integer totalPages = (Integer) request.getAttribute("totalPages");
                if (sanPhams != null && !sanPhams.isEmpty()) {
                    for (sanPham sp : sanPhams) {
                        java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###.00");
                        String formattedGiaBan = formatter.format(sp.getGiaBan());
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <a href="<%=url%>/products-information?hd=prd_information&id=<%= sp.getMaSanPham() %>">
                        <img src="<%=url%>/anhSanPham/<%=sp.getThemAnh() %>" class="card-img-top"
                             alt="<%=sp.getTenSanPham() %>">
                    </a>
                    <div class="card-body text-center">
                        <h4 class="card-title">
                            <a href="<%=url%>/products-information?hd=prd_information&id=<%=sp.getMaSanPham() %>">
                                <%=sp.getTenSanPham() %>
                            </a>
                        </h4>
                        <h5>giá bán : <%=formattedGiaBan%>
                        </h5>
                        <h6>the loai: <%=sp.getTheLoai().getTheLoai()%>
                        </h6>
                        <p class="card-text"><%=sp.getMoTa()%>
                        </p>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12">
                <p>Không có sản phẩm nào.</p>
            </div>
            <%
                }
            %>
        </div>
        <nav aria-label="Page navigation" class="d-flex justify-content-center mt-4 mb-4">
            <ul class="pagination">
                <!-- Previous button -->
                <li class="page-item <%= (currentPage <= 1) ? "disabled" : "" %>">
                    <a class="page-link"
                       href="<%=url%>/admin-servlet?active=danh-sach-san-pham2&page=<%= currentPage - 1 %>"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <%
                    int startPage = Math.max(1, currentPage - 2);
                    int endPage = Math.min(totalPages, startPage + 4);

                    if (endPage - startPage < 4) {
                        startPage = Math.max(1, endPage - 4);
                    }
                    for (int i = startPage; i <= endPage; i++) {
                %>
                <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                    <a class="page-link" href="<%=url%>/admin-servlet?active=danh-sach-san-pham2&page=<%= i %>">
                        <%= i %>
                    </a>
                </li>
                <% } %>

                <!-- Next button -->
                <li class="page-item <%= (currentPage >= totalPages) ? "disabled" : "" %>">
                    <a class="page-link"
                       href="<%=url%>/admin-servlet?active=danh-sach-san-pham2&page=<%= currentPage + 1 %>"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<footer class="footer text-center">
    <%@include file="footer.jsp" %>
</footer>

</body>
</html>
