<%@ page import="model.sanPham" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 02/10/2024
  Time: 4:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
    request.getContextPath();
%>
<script>
    window.onload = function() {
        // Kiểm tra nếu `active` đã được đặt thành `danh-sach-san-pham`
        const urlParams = new URLSearchParams(window.location.search);
        if (!urlParams.has('hd') || urlParams.get('hd') !== 'search-product') {
            // Nếu không, thực hiện chuyển hướng
            window.location.href = "<%=url%>/Products_information?hd=search-product";
        }
    };
</script>


<div class=" container-fluid mt5">
    <div class="row">
        <% ArrayList<sanPham> sanPhams = (ArrayList<sanPham>) request.getAttribute("results");
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
</div>
</body>
</html>
