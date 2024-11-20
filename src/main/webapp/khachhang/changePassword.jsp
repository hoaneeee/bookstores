<%@ page import="model.khachHang" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu</title>
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
    <script src="../javascript/main.js"></script>
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="../css/main.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
            color: #495057;
            margin: 0;
            padding: 0;
        }

        .container_form {
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin: 100px auto;
            background-color: #fff;
            padding: 30px;
            transition: all 0.3s ease;
        }

        h1 {
            font-size: 2rem;
            color: #ff6661;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }

        .mb-3 label {
            font-weight: bold;
            color: #495057;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s;
            color: #fff;
            text-decoration: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s;
            color: #fff;
            text-decoration: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            transform: scale(1.05);
        }

        span {
            display: block;
            margin-bottom: 15px;
            font-size: 14px;
            color: red;
            text-align: center;
        }

        .text-center {
            text-align: center;
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        footer {
            background-color: #f1f1f1;
            text-align: center;
            margin-top: auto;
            color: #6c757d;
            font-size: 0.9rem;
        }

        footer a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        footer a:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        @media (max-width: 768px) {
            .container_form {
                padding: 20px;
                margin: 50px auto;
            }

            h1 {
                font-size: 1.5rem;
            }

            .btn-primary, .btn-secondary {
                font-size: 14px;
            }
        }
        .fa-solid{
            font-size: 1rem;
            padding-right: 5px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>

    <%
        Object object = session.getAttribute("khachHang");
        khachHang khachHang = null;
        if (object != null) khachHang = (khachHang) object;
        if (khachHang == null) {
    %>
    <div class="container_form">
        <h1>Bạn chưa đăng nhập. Vui lòng trở lại <a href="index.jsp">trang chủ</a></h1>
    </div>
    <%
    } else {
        String baoLoi = request.getAttribute("baoLoi") + "";
        if (baoLoi.equals("null")) baoLoi = "";
    %>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    %>
    <div class="container-fluid pt-5 container_form">
        <div class="text-center">
            <h1>Đổi Mật Khẩu</h1>
        </div>
        <span><%=baoLoi%></span>
        <form action="<%=url%>/khach-hang" method="POST">
            <input type="hidden" name="hanhDong" value="changePassword">
            <div class="row">
                <div class="mb-3">
                    <label for="matKhauHienTai" class="form-label">Mật khẩu hiện tại</label>
                    <input type="password" class="form-control" id="matKhauHienTai" name="matKhauHienTai" required>
                </div>
                <div class="mb-3">
                    <label for="matKhauMoi" class="form-label">Mật khẩu mới</label>
                    <input type="password" class="form-control" id="matKhauMoi" name="matKhauMoi" required>
                </div>
                <div class="mb-3">
                    <label for="matKhauMoiNhapLai" class="form-label">Nhập lại mật khẩu mới</label>
                    <input type="password" class="form-control" id="matKhauMoiNhapLai" name="matKhauMoiNhapLai" required>
                </div>
            </div>
            <div class="row text-center mt-4">
                <button type="submit" class="btn btn-primary"><i class="fa-solid fa-key"></i>Lưu mật khẩu</button>
                <a href="<%=url%>/home.jsp" class="btn btn-secondary mt-2">Quay lại</a>
            </div>
        </form>
    </div>
    <%
        }
    %>

    <%
        String redirect = (String) request.getAttribute("redirect");
        if (redirect != null) {
    %>
    <script>
        redirectToHome();
    </script>
    <%
        }
    %>
</div>

<footer>
    <%@ include file="../footer.jsp" %>
</footer>
</body>
</html>
