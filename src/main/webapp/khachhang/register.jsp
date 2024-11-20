<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: Acer
  Date: 03/08/2024
  Time: 10:36 CH
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
    <style>
        .red {
            color: red;
        }
        body{
            background: linear-gradient(to bottom, rgba(173, 216, 230, 0.8 ), rgba(173, 216, 230, 0.8));
        }
    </style>
</head>
<body>
<%
    String baoLoi = request.getAttribute("baoLoi")+"";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;


    String tenDangNhap = request.getAttribute("tenDangNhap") + "";
    tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;

    String hoVaTen = request.getAttribute("hoVaTen") + "";
    hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;

    String gioiTinh = request.getAttribute("gioiTinh") + "";
    gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;

    String ngaySinh = request.getAttribute("ngaySinh") + "";
    ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;

    String diaChiKhachHang = request.getAttribute("diaChiKhachHang") + "";
    diaChiKhachHang = (diaChiKhachHang.equals("null")) ? "" : diaChiKhachHang;

    String diaChiMuaHang = request.getAttribute("diaChiMuaHang") + "";
    diaChiMuaHang = (diaChiMuaHang.equals("null")) ? "" : diaChiMuaHang;

    String diaChiNhanHang = request.getAttribute("diaChiNhanHang") + "";
    diaChiNhanHang = (diaChiNhanHang.equals("null")) ? "" : diaChiNhanHang;

    String dienThoai = request.getAttribute("dienThoai") + "";
    dienThoai = (dienThoai.equals("null")) ? "" : dienThoai;

    String email = request.getAttribute("email") + "";
    email = (email.equals("null")) ? "" : email;

    String dongYNhanMail = request.getAttribute("dongYNhanMail") + "";
    dongYNhanMail = (dongYNhanMail.equals("null")) ? "" : dongYNhanMail;

%>
<div class="container" style="background: linear-gradient(to bottom, rgba(173, 216, 230, 0.8), rgba(173, 216, 230, 0.8));">
    <div class="text-center" style="padding-top: 20px">
        <h1>ĐĂNG KÝ TÀI KHOẢN</h1>
    </div>
    <div class="red" id="baoLoi">
        <%=baoLoi%>
    </div>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <form class="form-control" style="background:linear-gradient(to bottom, rgba(173, 216, 230, 0.8), rgba(173, 216, 230, 0.8 )); border: 0 solid  " action="<%=url%>/khach-hang" method="POST">
        <input type="hidden" name="hanhDong" value="sign-up">
        <div class="row">
&lt;%&ndash;            <div class="col-sm-6">&ndash;%&gt;
                <h3 class="text-center">Tài khoản</h3>
                <div class="mb-3">
                    <label for="tenDangNhap" class="form-label">Tên đăng nhập<span class="red">*</span></label>
                    <input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap"
                           value="<%=tenDangNhap%>">
                </div>
                <div class="mb-3">
                    <label for="matKhau" class="form-label">Mật khẩu<span class="red">*</span></label>
                    <input type="password" class="form-control" id="matKhau" name="matKhau"
                           onkeyup="kiemTraMatKhau()">
                </div>
                <div class="mb-3">
                    <label for="matKhauNhapLai" class="form-label">Nhập lại
                        mật khẩu<span class="red">*</span> <span id="msg" class="red"></span>
                    </label> <input type="password" class="form-control" id="matKhauNhapLai"
                                    name="matKhauNhapLai" onkeyup="kiemTraMatKhau()">
                </div>
                <hr/>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label> <input
                        type="email" class="form-control" id="email" name="email" value="<%=email%>">
                </div>
                <hr/>
                <div class="mb-3">
                    <label for="dongYDieuKhoan" class="form-label">Đồng ý với
                        <a>điều khoản của công ty </a><span id="red">*</span>
                    </label> <input type="checkbox" class="form-check-input"
                                    id="dongYDieuKhoan" name="dongYDieuKhoan" required="required"
                                    onchange="xuLyChonDongY()">
                </div>
                <div class="mb-3">
                    <label for="dongYNhanMail" class="form-label">Đồng ý nhận
                        email</label> <input type="checkbox" class="form-check-input"
                                             id="dongYNhanMail" name="dongYNhanMail" value="<%=dongYNhanMail%>">
                </div>
                <div class="mb-3" style="width: 10%; margin: auto;">
                <input class="btn btn-primary form-control" type="submit"
                       value="Đăng ký" name="submit" id="submit" style="visibility: hidden; "/>
                </div>
            </div>
&lt;%&ndash;        </div>&ndash;%&gt;
    </form>
</div>
</body>
</html>
--%>
<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 03/08/2024
  Time: 10:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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

    <style>
        body {
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 12px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #ff6666;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        h3.text-center {
            color: #003366;
            font-size: 20px;
            font-weight: bold;
            padding-top: 10px;
        }

        .red {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .form-label {
            color: #003366;
            font-weight: bold;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 10px;
        }

        .mb-3 label {
            font-size: 14px;
        }

        .btn-primary {
            background-color: #ff6666;;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            padding: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        input[type="submit"] {
            font-weight: bold;
            width: 200px;
            padding: 10px;
            background-color: #ff6666;;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-right: 50px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .form-check-input {
            width: 20px;
            height: 20px;
        }

        hr {
            border: 1px solid #ccc;
        }

        #baoLoi {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .container .text-center {
            padding-top: 20px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
        }
    </style>

</head>
<body>
<%
    String baoLoi = request.getAttribute("baoLoi")+"";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;


    String tenDangNhap = request.getAttribute("tenDangNhap") + "";
    tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;

    String email = request.getAttribute("email") + "";
    email = (email.equals("null")) ? "" : email;

    String dongYNhanMail = request.getAttribute("dongYNhanMail") + "";
    dongYNhanMail = (dongYNhanMail.equals("null")) ? "" : dongYNhanMail;

%>
<div class="container" >
    <div class="text-center" >
        <h1>ĐĂNG KÝ TÀI KHOẢN</h1>
    </div>
    <div class="red" id="baoLoi">
        <%=baoLoi%>
    </div>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <form class="form-control" action="<%=url%>/khach-hang" method="POST">
        <input type="hidden" name="hanhDong" value="sign-up">
        <div class="row">
            <%--            <div class="col-sm-6">--%>
            <h3 class="text-center">Tài khoản</h3>
            <div class="mb-3">
                <label for="tenDangNhap" class="form-label">Tên đăng nhập<span class="red">*</span></label>
                <input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap"
                       value="<%=tenDangNhap%>">
            </div>
            <div class="mb-3">
                <label for="matKhau" class="form-label">Mật khẩu<span class="red">*</span></label>
                <input type="password" class="form-control" id="matKhau" name="matKhau"
                       onkeyup="kiemTraMatKhau()">
            </div>
            <div class="mb-3">
                <label for="matKhauNhapLai" class="form-label">Nhập lại
                    mật khẩu<span class="red">*</span> <span id="msg" class="red"></span>
                </label> <input type="password" class="form-control" id="matKhauNhapLai"
                                name="matKhauNhapLai" onkeyup="kiemTraMatKhau()">
            </div>
            <hr/>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label> <input
                    type="email" class="form-control" id="email" name="email" value="<%=email%>">
            </div>
            <hr/>
            <div class="mb-3">
                <label for="dongYDieuKhoan" class="form-label">Đồng ý với
                    <a>điều khoản của công ty </a><span id="red">*</span>
                </label> <input type="checkbox" class="form-check-input"
                                id="dongYDieuKhoan" name="dongYDieuKhoan" required="required"
                                onchange="xuLyChonDongY()">
            </div>
            <div class="mb-3">
                <label for="dongYNhanMail" class="form-label">Đồng ý nhận
                    email</label> <input type="checkbox" class="form-check-input"
                                         id="dongYNhanMail" name="dongYNhanMail" value="<%=dongYNhanMail%>">
            </div>
            <div class="mb-3" style="width: 40%; margin: auto;">
                <button class="btn btn-primary form-control" type="submit" name="submit" id="submit" style="visibility: hidden;">
                    <i class="fa-solid fa-user-plus"></i> Đăng ký
                </button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
