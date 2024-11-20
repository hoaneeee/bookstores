<%@ page import="model.sanPham" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
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
    <link rel="stylesheet" href="css/main.css">
    <style>
        .card:hover {
            transform: translateY(-5px);
            transition: 0.3s ease;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
            font-size: 1.1rem;
        }
        .text-decoration-line-through {
            color: #6c757d;
            font-size: 0.9rem;
        }
        .empty-state {
            text-align: center;
            padding: 50px;
            color: #6c757d;
        }
        .container_cate{
            padding-top: 50px;
        }
    </style>
</head>
<body>
<%    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container mt-5 container_cate ">
    <div class="row">
        <%
            ArrayList<sanPham> sanPhams = (ArrayList<sanPham>) request.getAttribute("listCategory");
            if (sanPhams != null && !sanPhams.isEmpty()) {
                for (sanPham sp : sanPhams) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="position-relative overflow-hidden">
                    <a href="<%=url%>/products-information?hd=prd_information&id=<%=sp.getMaSanPham()%>">
                        <img class="card-img-top" src="<%=url%>/anhSanPham/<%=sp.getThemAnh()%>"
                             alt="<%=sp.getTenSanPham()%>">
                    </a>
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="<%=url%>/products-information?hd=prd_information&id=<%=sp.getMaSanPham()%>">
                            <%=sp.getTenSanPham()%>
                        </a>
                    </h5>
                    <div class="price">
                        <%=sp.getGiaBan()%>đ
                        <% if (sp.getGiaBan() < sp.getGiaGoc()) { %>
                        <small class="text-decoration-line-through ms-2">
                            <%=sp.getGiaGoc()%>đ
                        </small>
                        <% } %>
                    </div>
                    <p class="card-text mt-2">The loai : <%=sp.getTheLoai().getTheLoai()%></p>
                    <p class="card-text mt-2"><%=sp.getMoTa()%></p>
                </div>
                <div class="card-footer d-flex justify-content-between align-items-center">
                    <div class="rating text-warning">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                    <form action="<%=url%>/products-information?hd=cart-search&id=<%=sp.getMaSanPham()%>" method="post">
                        <input type="hidden" name="search" value="<%=request.getParameter("search")%>">
                        <input type="hidden" name="quantity" id="quantity" value="1"/>
                        <button type="submit" class="btn btn-outline-danger d-flex align-items-center">
                            <i class="fas fa-shopping-cart me-1"></i>Thêm vào giỏ
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
        <% } else { %>
        <div class="col-12">
            <div class="empty-state">
                <i class="fas fa-search fa-3x mb-3"></i>
                <h3>Không tìm thấy sản phẩm</h3>
                <p>Vui lòng thử tìm kiếm với từ khóa khác hoặc duyệt danh mục sản phẩm của chúng tôi.</p>
                <a href="<%=url%>/index.jsp" class="btn btn-primary mt-3">Quay về trang chủ</a>
            </div>
        </div>
        <% } %>
    </div>
</div>
<%@include file="../footer.jsp"%>
</body>
</html>
