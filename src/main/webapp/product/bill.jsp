<%@ page import="model.khachHang" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.GioHang" %>
<%@ page import="database.sanPhamDAO" %>
<%@ page import="model.sanPham" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 07/10/2024
  Time: 4:51 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/main.css">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .shopee-header {
            background-color: #ee4d2d;
            padding: 10px 0;
        }

        .shopee-header h1 {
            font-size: 1.2rem;
            font-weight: bold;
        }

        .btn-outline-secondary {
            border-color: #ee4d2d;
            color: #ee4d2d;
            border-radius: 20px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-outline-secondary:hover {
            background-color: #ee4d2d;
            color: white;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
        }

        .card-body {
            padding: 1.5rem;
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: 600;
        }

        .badge {
            border-radius: 20px;
            font-size: 0.9rem;
            padding: 0.5rem;
        }

        .btn-sm {
            font-size: 0.8rem;
            padding: 0.4rem 0.8rem;
        }

        .d-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .text-muted {
            color: #6c757d !important;
        }

        .text-danger {
            color: #dc3545 !important;
        }

        .text-end {
            text-align: right;
        }

        .fw-bold {
            font-weight: 700;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .card-body img {
            width: 60px;
            height: auto;
            border-radius: 4px;
            margin-right: 10px;
        }

        .total-cost {
            font-size: 1.2rem;
            font-weight: 600;
        }

        .mb-3 {
            margin-bottom: 1.5rem !important;
        }

        form {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .form-control {
            border-radius: 20px;
            padding: 0.5rem;
        }

        .footer-btn {
            text-align: center;
            margin-top: 1rem;
        }

        .footer-btn button {
            border-radius: 20px;
            padding: 10px 20px;
            background-color: #ee4d2d;
            color: white;
            border: none;
        }

        .footer-btn button:hover {
            background-color: #c93c26;
        }

        .payment-method {
            display: inline-block;
            padding: 0.5rem;
            margin-right: 1rem;
            cursor: pointer;
            font-size: 1rem;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        .payment-method.active {
            background-color: #ee4d2d;
            color: white;
        }

    </style>

</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%
    Object object = session.getAttribute("khachHang");
    khachHang khachhang = null;
    if (object != null)
        khachhang = (khachHang) object;
    if (khachhang == null) {
%>
<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
<%
} else {
%>
<header class="shopee-header text-white py-2">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="h6 mb-0">Bookstore | Thanh Toán</h1>
            </div>
        </div>
    </div>
</header>

<main class="container my-3">
    <div class="card mb-3">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <h5 class="card-title mb-0">
                    <i class="fas fa-map-marker-alt text-danger"></i> Địa Chỉ Nhận Hàng
                </h5>
                <button class="btn btn-outline-secondary btn-sm">Thay Đổi</button>
            </div>
            <p class="card-text mb-1">Điện thoại <%=khachhang.getSoDienThoai()%>
            </p>
            <p class="card-text"><%=khachhang.getDiaChi()%>
            </p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">Sản phẩm</h5>
            <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-2">
                <div>
                    <span class="badge bg-danger me-2">Sách Bookstore</span>
                    <span class="badge bg-primary">Chính hãng (It could be fake)</span>
                </div>
                <small class="text-muted">7 ngày trả hàng</small>
            </div>
            <%
                if (request.getAttribute("gioHangList") != null) {
                    List<GioHang> gioHangList = (List<GioHang>) request.getAttribute("gioHangList");
                    for (GioHang gioHang : gioHangList) {
                        sanPham sp = sanPhamDAO.gI().selectByID(gioHang.id);
            %>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h4><img src="<%=url%>/anhSanPham/<%=sp.getThemAnh()%>"
                             style="width: 60px; height: auto; border-radius: 4px;"></h4>
                    <h6 class="mb-1">Sách - <%=sp.getTenSanPham()%>
                    </h6>
                    <small class="text-muted">Thể loại: <%=sp.getTheLoai().getTheLoai()%>
                    </small>
                </div>
                <div class="text-end">
                    <p class="mb-0"><%=sp.getGiaBan()%>
                    </p>
                    <small class="text-muted">x<%=gioHang.quantity%>
                    </small>
                </div>
            </div>
            <%
                }
            %>
            <%}%>
        </div>
    </div>

    <%
        if (request.getAttribute("totalAmount") != null && request.getAttribute("totalCost") != null) {
            String totalMount = (String) request.getAttribute("totalAmount");
            String totalCost = (String) request.getAttribute("totalCost");
    %>

    <div class="card mb-3">
        <div class="card-body">
            <h6 class="card-title mb-3">Phương thức thanh toán</h6>
            <div class="mb-2">
                <button type="button" class="btn btn-outline-secondary btn-sm"
                        onclick="selectPaymentMethod('Thanh toán khi nhận hàng')">
                    Thanh toán khi nhận hàng
                </button>
                <button type="button" class="btn btn-outline-secondary btn-sm"
                        onclick="selectPaymentMethod('Chuyển khoản ngân hàng')">
                    Chuyển khoản ngân hàng
                </button>
            </div>
        </div>
    </div>


    <div class="card mb-3">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-2">
                <span>Tổng tiền hàng</span>
                <%--tien hang--%>
                <span><%=totalMount%></span>
            </div>
            <div class="d-flex justify-content-between mb-2">
                <span>Phí vận chuyển</span>
                <%--van chuyen--%>
                <span></span>
            </div>
            <div class="d-flex justify-content-between fw-bold">
                <span>Tổng thanh toán:</span>
                <span class="text-danger"><%=totalMount%></span>
            </div>
            <form action="<%=url%>/bill?click=create_bill" method="POST"
                  class="d-flex justify-content-between align-items-center mb-3"
                  style="background-color: white; padding-top: 20px;">
                <small class="text-muted">Nhấn "Đặt hàng" đồng nghĩa với việc bạn đồng ý tuân theo Điều khoản
                    Bookstore</small>

                <!-- Thêm các input -->
                <input type="hidden" name="phuongThucThanhToan" id="phuongThucThanhToan"
                       value="Thanh toán khi nhận hàng">
                <input type="hidden" name="totalAmount" value="<%= totalMount %>">
                <input type="hidden" name="totalCost" value="<%=totalCost %>">


                <button type="submit" class="btn btn-danger">Đặt hàng</button>
            </form>
        </div>
    </div>
    <%}%>
</main>
<%}%>
<script>
    function selectPaymentMethod(method) {
        document.getElementById('phuongThucThanhToan').value = method;
        const buttons = document.querySelectorAll('.btn-outline-secondary');
        buttons.forEach(button => {
            button.classList.remove('active');
        })
        event.target.classList.add('active');
    }
</script>
</body>
</html>
