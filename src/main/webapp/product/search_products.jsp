<%@ page import="model.sanPham" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tìm kiếm sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <style>
        :root {
            --primary-color: #ee4d2d;
            --secondary-color: #f5f5f5;
            --text-color: #222;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        body {
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
            padding-top: 20px;
        }

        .card {
            border: none;
            box-shadow: 0 2px 8px var(--shadow-color);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .card:hover .card-img-top {
            transform: scale(1.05);
        }

        .card-title a {
            color: var(--text-color);
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .card-title a:hover {
            color: var(--primary-color);
        }

        .price {
            color: var(--primary-color);
            font-size: 1.25rem;
            font-weight: 700;
            margin: 10px 0;
        }

        .card-text {
            color: #666;
            font-size: 0.9rem;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .card-footer {
            background-color: transparent;
            border-top: 1px solid rgba(0, 0, 0, .125);
            padding: 0.75rem;
        }

        .rating {
            color: #ffc107;
            font-size: 0.9rem;
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px var(--shadow-color);
        }

        .empty-state i {
            font-size: 48px;
            color: #ccc;
            margin-bottom: 16px;
        }

        .empty-state p {
            color: #666;
            margin: 0;
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            animation: fadeIn 0.5s ease-out;
        }

        /*select*/
        .filter-options {
            display: flex;
            justify-content: flex-start;
            background-color: white;
            border-radius: 10px;
        }

        .form-select {
            width: 20%;

        }

        .btn-filter {
            padding: 5px 5px;
            margin: 5px;
            background-color: white;
        }
    </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";
%>
<% String search = (String) request.getAttribute("search");
    if (search == null) {
        search = (String) session.getAttribute("searchQuery");
    }
%>
<div class="container">
    <div class="row test">
        <div class="row mt-5" style="padding-top: 50px">
            <div class="col-12 mb-4">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<%=url%>/index.jsp">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tìm kiếm sản phẩm</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div style="color: <%=cl%>" id="baoLoi">
            <%=baoLoi%>
        </div>
        <div id="resulte-search">
            <h3>kết quả tìm kiếm cho "<%=search%>"</h3>
        </div>
        <div class="row mb-4">
            <div class="col-12">
                <h4>Lọc sản phẩm:</h4>
                <div class="filter-options">
                    <button class="btn btn-filter btn-outline-primary" onclick="filterProducts('newest')">Mới Nhất</button>
                    <button class="btn btn-filter    btn-outline-primary" onclick="filterProducts('best-seller')">Bán Chạy</button>
                    <select class="form-select" id="price-filter" onchange="filterProducts(this.value)">
                        <option value="" disabled selected>Sắp xếp theo giá</option>
                        <option value="low-to-high">Từ thấp đến cao</option>
                        <option value="high-to-low">Từ cao đến thấp</option>
                    </select>
                </div>
            </div>
        </div>
        <%
            ArrayList<sanPham> sanPhams = (ArrayList<sanPham>) request.getAttribute("results");
            if (sanPhams != null && !sanPhams.isEmpty()) {
                for (sanPham sp : sanPhams) {
                    java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###.00");
                    String formattedGiaBan = formatter.format(sp.getGiaBan());
        %>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card h-100">
                <div class="position-relative overflow-hidden">
                    <a href="<%=url%>/products-information?hd=prd_information&id=<%=sp.getMaSanPham()%>">
                        <img class="card-img-top" src="<%=url%>/anhSanPham/<%=sp.getThemAnh()%>"
                             alt="<%=sp.getTenSanPham()%>">
                    </a>
                </div>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="<%=url%>/products-information?hd=prd_information&id=<%=sp.getMaSanPham()%>">
                            <%=sp.getTenSanPham()%>
                        </a>
                    </h4>
                    <div class="price">
                        <%=formattedGiaBan%>đ
                        <% if (sp.getGiaBan() < sp.getGiaGoc()) { %>
                        <small class="text-decoration-line-through text-muted ms-2">
                            <%=sp.getGiaGoc()%>đ
                        </small>
                        <% } %>
                    </div>
                    <p class="card-text"><%=sp.getMoTa()%>
                    </p>
                </div>
                <div class="card-footer d-flex justify-content-between align-items-center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>

                    <form action="<%=url%>/products-information?hd=cart-search&id=<%=sp.getMaSanPham()%>" method="post">
                        <input type="hidden" name="search" value="<%=request.getParameter("search")%>">
                        <input type="hidden" name="quantity" id="quantity" value="1" style="width: 100px;"/>
                        <button type="submit" class="btn btn-outline-danger d-flex align-items-center"
                                style="margin-top:10px;padding: 5px 15px;">
                            <i class="fas fa-shopping-cart me-1"></i>Thêm vào giỏ
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <%}%>
        <%
        } else {
        %>
        <div class="col-12">
            <div class="empty-state">
                <i class="fas fa-search mb-3"></i>
                <h3>Không tìm thấy sản phẩm</h3>
                <p>Vui lòng thử tìm kiếm với từ khóa khác hoặc duyệt danh mục sản phẩm của chúng tôi.</p>
                <a href="<%=url%>/index.jsp" class="btn btn-primary mt-3">Quay về trang chủ</a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
<script>
    function filterProducts(filter) {
        const url = "<%=url%>/products-information";  // Đường dẫn đến servlet
        const params = new URLSearchParams();
        const search = "<%=search%>"

        if (filter) {
            params.append("filter", filter);
            params.append("hd", "filter");
        }
        /*products-information?filter=newest&hd=filter*/
        const fullUrl = url + '?' + params.toString();

        fetch(fullUrl)
            .then(response => response.text())
            .then(data => {
                document.querySelector(".test").innerHTML = data;
                console.log(data);
            });
    }

    setTimeout(function () {
        document.getElementById("baoLoi").style.display = "none";
    }, 3000);
</script>
</body>
</html>