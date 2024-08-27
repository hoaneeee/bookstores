<%@ page import="model.khachHang" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books store</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
    <link rel="stylesheet" href="./css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"></script>
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
    crossorigin="anonymous"></script>
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
        <div class="col-lg-9 bg-warning">
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
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/11.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">áo sơ mi hồng nam tính </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">màu hồng nam tính tăng độ handsome</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/dacnhantam.png" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">T-shirt phong cách </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">miễn chê</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/doc-vi-bat-ky-ai.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">oversized tees </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">trẻ trung năng động</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/dung-bao.jpg"
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">chủ web đây </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">chủ web đẹp trai vãi l!!!!</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/khoi-nghiep-tinh-gon.jpg"
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">chủ web đây </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">chủ web đẹp trai vãi l!!!!</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/nguoi-giau-co-nhat-thanh-papylone.jpg"
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">chủ web đây </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">chủ web đẹp trai vãi l!!!!</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/nhung-cuoc-phieu-luu-trong-kinh-doanh.jpg"
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">chủ web đây </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">chủ web đẹp trai vãi l!!!!</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/tu-duy-nhanh-va-cham.jpg"
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">chủ web đây </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">chủ web đẹp trai vãi l!!!!</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/tu-tot-den-vi-dai.jpg"
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">chủ web đây </a>
                            </h4>
                            <h5>150.000</h5>
                            <p class="card-text">chủ web đẹp trai vãi l!!!!</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
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