<%@ page import="model.khachHang" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <style>
        body {
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 70px;
            max-width: 800px;
        }

        h2 {
            text-align: center;
            color: #ff6b6b;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .row {
            margin-bottom: 15px;
        }

        .row .col-md-4 {
            font-weight: bold;
            color: #333;
        }

        .row .col-md-8 {
            color: #555;
            font-size: 1.1em;
        }

        .row .col-md-8 p {
            margin: 0;
            padding: 5px 0;
        }

        .row .col-md-4, .row .col-md-8 {
            display: flex;
            align-items: center;
        }

        .row .col-md-8 {
            font-style: italic;
        }

        .row .col-md-4 {
            text-align: right;
        }

        .row .col-md-8 {
            text-align: left;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
        }

        .button-container .btn {
            width: 30%;
            font-size: 1rem;
            font-weight: bold;
            padding: 12px;
            border-radius: 5px;
        }

        button.btn-info_color{
            background-color: #ff6b6b;
            color: #fff;
            border: none;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        button.btn-info_color:hover {
            background-color: #e53935;
            transform: scale(1.05);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }

        .btn a {
            text-decoration: none;
            color: #fff;
        }

        .btn-info_color:hover {
            background-color:#e53935;
        }
    </style>
</head>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%
    khachHang khachHang = (khachHang) request.getAttribute("khachHang");
%>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
    <h2>Thông Tin Người Dùng</h2>

    <!-- Thông tin người dùng -->
    <div class="row">
        <div class="col-md-4">
            <strong>Tên Đăng Nhập:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getTenDangNhap()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Họ và Tên:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getHoVaten()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Giới Tính:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getGioiTinh()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Địa Chỉ:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getDiaChi()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Địa Chỉ Nhận Hàng:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getDiaChiNhanHang()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Ngày Sinh:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getNgaySinh()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Số Điện Thoại:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getSoDienThoai()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Email:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.getEmail()%></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <strong>Đăng Ký Nhận Bản Tin:</strong>
        </div>
        <div class="col-md-8">
            <p><%=khachHang.isDangKyNhanBangTin()%></p>
        </div>
    </div>

    <div class="button-container">
        <button class="btn btn-info btn-info_color"><a href="<%=url%>/khachhang/changeInformation.jsp">Sửa Thông Tin</a></button>
        <button class="btn btn-info btn-info_color"><a href="<%=url%>/khachhang/changePassword.jsp">Đổi Mật Khẩu</a></button>
        <button class="btn btn-info btn-info_color"><a href="<%=url%>/home.jsp">Quay Lại</a></button>
    </div>
</div>
</body>
</html>
