<%@ page import="model.khachHang" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thay đổi thông tin</title>
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
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="../css/main.css">
    <style>
        body {
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 800px;
            margin-top: 100px;
        }

        .text-center {
            text-align: center;
        }

        h1 {
            font-weight: bold;
            color: #ff6b6b;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        h3 {
            margin-top: 20px;
            color: #007bff;
        }

        .form-control, .form-select, .form-check-input {
            border-radius: 10px;
            box-shadow: none;
            font-size: 1rem;
        }

        .form-floating {
            margin-bottom: 15px;
        }


        .form-floating label {
            font-size: 1rem;
        }

        .btn {
            border-radius: 25px;
            font-size: 1.2rem;
            padding: 10px 20px;
        }
        .btn-primary{
            background-color: #ff6b6b;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }
        .btn-primary:hover{
            background-color: #e53935;
            transform: scale(1.05);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .row {
                flex-direction: column;
                align-items: stretch;
            }

            .col-md-6 {
                width: 100%;
                margin-bottom: 20px;
            }

            .form-floating input,
            .form-floating select {
                height: 40px;
            }
        }

        form-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: space-between;
        }

        form-section {
            flex: 1 1 calc(50% - 15px);
            min-width: 300px;
        }

        .form-section h3 {
            color: #007bff;
            margin-bottom: 15px;
        }

        .form-floating label {
            font-weight: bold;
        }

        #avatar {
            margin-top: 20px;
            padding: 5px;
            border-radius: 10px;
        }

        .form-section .form-floating {
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
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
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";

    String hoVaTen = khachhang.getHoVaten();
    String gioiTinh = khachhang.getGioiTinh();
    String ngaySinh = khachhang.getNgaySinh().toString();

    String diaChiKhachHang = khachhang.getDiaChi();
    String diaChiNhanHang = khachhang.getDiaChiNhanHang();
    String dienThoai = khachhang.getSoDienThoai();
    String email = khachhang.getEmail();
    boolean dongYNhanMail = khachhang.isDangKyNhanBangTin();
%>

<% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
        + request.getContextPath(); %>

<div class="container pt-5">
    <div class="text-center mb-4">
        <h1>THÔNG TIN TÀI KHOẢN</h1>
    </div>

    <div style="color: <%=cl %>" id="baoLoi">
        <%= baoLoi %>
    </div>

    <form action="<%= url %>/khach-hang" method="post" enctype="multipart/form-data">
        <input type="hidden" name="hanhDong" value="changeInformation">

        <div class="row g-4">
            <div class="col-md-6">
                <h4>Thông tin khách hàng</h4>
                <div class="form-floating">
                    <input type="text" class="form-control" id="hoVaTen" name="hoVaTen" value="<%=hoVaTen%>" placeholder="Họ và tên">
                    <label for="hoVaTen">Họ và tên</label>
                </div>
                <div class="form-floating">
                    <select class="form-select" id="gioiTinh" name="gioiTinh">
                        <option value="" disabled selected>Chọn giới tính</option>
                        <option value="Nam" <%=(gioiTinh.equals("Nam")) ? "selected" : "" %>>Nam</option>
                        <option value="Nữ" <%=(gioiTinh.equals("Nữ")) ? "selected" : "" %>>Nữ</option>
                        <option value="Khác" <%=(gioiTinh.equals("Khác")) ? "selected" : "" %>>Khác</option>
                    </select>
                    <label for="gioiTinh">Giới tính</label>
                </div>
                <div class="form-floating">
                    <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>">
                    <label for="ngaySinh">Ngày sinh</label>
                </div>
                <div class="form-floating">
                    <input type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai%>" placeholder="Điện thoại">
                    <label for="dienThoai">Điện thoại</label>
                </div>
            </div>

            <div class="col-md-6">
                <h4>Địa chỉ</h4>
                <div class="form-floating">
                    <input type="text" class="form-control" id="diaChiKhachHang" name="diaChiKhachHang" value="<%=diaChiKhachHang%>" placeholder="Địa chỉ khách hàng">
                    <label for="diaChiKhachHang">Địa chỉ khách hàng</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="diaChiNhanHang" name="diaChiNhanHang" value="<%=diaChiNhanHang%>" placeholder="Địa chỉ nhận hàng">
                    <label for="diaChiNhanHang">Địa chỉ nhận hàng</label>
                </div>
                <div class="form-floating">
                    <input type="email" class="form-control" id="email" name="email" value="<%=email%>" placeholder="Email">
                    <label for="email">Email</label>
                </div>

                <div class="form-floating mt-3">
                    <input type="file" class="form-control" id="avatar" name="avatar" required>
                </div>

            </div>
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
            </div>
        </div>
    </form>
</div>
<%}%>
</body>
</html>
