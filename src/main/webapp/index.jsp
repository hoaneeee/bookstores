<%@ page import="model.khachHang" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="org.example.controller.KhachHangServlets" %>
<%@ page import="model.sanPham" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books store</title>
    <link rel="stylesheet" href="./css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>

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
            KhachHangServlets.gI().sign_in(u, pas, session);
        }
    %>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <script>
        window.onload = function() {
            // Kiểm tra nếu `active` đã được đặt thành `danh-sach-san-pham`
            const urlParams = new URLSearchParams(window.location.search);
            if (!urlParams.has('active') || urlParams.get('active') !== 'danh-sach-san-pham2') {
                // Nếu không, thực hiện chuyển hướng
                window.location.href = "<%=url%>/admin-servlet?active=danh-sach-san-pham2";
            }
        };
    </script>


</head>
<body>

<%--header--%>
<jsp:include page="header.jsp"/>
<!-- end navbar-->
<!-- page content-->
<div class="container-fluid background-container">
    <div class="row">
        <jsp:include page="left.jsp"></jsp:include>
        <!--menu left -->
        <!-- end menu left-->
        <div class="col-lg-10 bg-warning">
            <!--slider -->
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/Thiết%20kế%20chưa%20có%20tên%20(1).png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/Thiết%20kế%20chưa%20có%20tên%20(2).png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/Thiết%20kế%20chưa%20có%20tên.png" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- end slider -->
            <!-- product-->
            <div class="row">
                <% ArrayList<sanPham> sanPhams = (ArrayList<sanPham>) request.getAttribute("listSp");
                            if (sanPhams !=null && !sanPhams.isEmpty()){
                                for (sanPham sp : sanPhams) {

                %>
                    <div class="col-lg-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <a href="<%=url%>/products-information?hd=prd_information&id=<%= sp.getMaSanPham()  %>">
                                <img class="card-img-top" src="<%=url%>/anhSanPham/<%=sp.getThemAnh()  %>" alt="<%=sp.getTenSanPham()  %>">
                            </a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="<%=url%>/products-information?hd=prd_information&id=<%=sp.getMaSanPham() %>"><%=sp.getTenSanPham()  %></a>
                                </h4>
                                <h5>Gia ban : <%=sp.getGiaBan()%></h5>
                                <p class="card-text"><%=sp.getMoTa()%></p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                            </div>
                        </div>
                    </div>
                    <%}
                    }else {
                    %>
                    <div class="col-12">
                        <p>Không có sản phẩm nào.</p>
                    </div>
                    <%
                        }
                    %>
            </div>
            <!-- end product-->
        </div>
        <!-- end slider and product-->

    </div>
</div>
<!-- end content-->
<%@include file="footer.jsp" %>
</body>
</html>