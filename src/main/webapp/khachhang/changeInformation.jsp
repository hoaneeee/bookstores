<%@ page import="model.khachHang" %>
<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 13/08/2024
  Time: 10:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>changeInformation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <style>
        .red {
            color: red;
        }
    </style>

    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="../css/main.css">
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
<div class="container-fluid pt-5">
    <%
        String baoLoi = request.getParameter("baoLoi") + "";
        baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

        String hoVaTen = khachhang.getHoVaten();
        String gioiTinh = khachhang.getGioiTinh();
        String ngaySinh = khachhang.getNgaySinh().toString();

        String diaChiKhachHang = khachhang.getDiaChi();

        String diaChiMuaHang = khachhang.getDiaChiMuaHang();

        String diaChiNhanHang = khachhang.getDiaChiNhanHang();

        String dienThoai = khachhang.getSoDienThoai();

        String email = khachhang.getEmail();

        boolean dongYNhanMail = khachhang.isDangKyNhanBangTin();
    %>
    <div class="container pt-5  ">
        <div class="text-center">
            <h1>THÔNG TIN TÀI KHOẢN</h1>
        </div>

        <div class="red" id="baoLoi">
            <%=baoLoi %>
        </div>
        <%
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath();
        %>
        <form   class="form" action="<%=url%>/khach-hang" method="post">
            <input type="hidden" name="hanhDong" value="changeInformation">

            <div class="row">
                <div class="col-sm-6">
                    <h3>Thông tin khách hàng</h3>
                    <div class="mb-3">

                        <label for="hoVaTen" class="form-label">Họ và tên</label> <input
                            type="text" class="form-control" id="hoVaTen" name="hoVaTen" value="<%=hoVaTen%>">
                    </div>
                    <div class="mb-3">
                        <label for="gioiTinh" class="form-label">Giới tính</label> <select
                            class="form-control" id="gioiTinh" name="gioiTinh">
                        <option></option>
                        <option value="Nam" <%=(gioiTinh.equals("Nam")) ? "selected='selected'" : "" %> >Nam</option>
                        <option value="Nữ" <%=(gioiTinh.equals("Nữ")) ? "selected='selected'" : "" %> >Nữ</option>
                        <option value="Khác" <%=(gioiTinh.equals("Khác")) ? "selected='selected'" : "" %> >Khác</option>
                    </select>
                    </div>
                    <div class="mb-3">
                        <label for="ngaySinh" class="form-label">Ngày sinh</label> <input
                            type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>">
                    </div>
                    <div class="mb-3">
                        <label for="dienThoai" class="form-label">Điện thoại</label> <input
                            type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai%>">
                    </div>
                </div>
                <div class="col-sm-6">
                    <h3>Địa chỉ</h3>
                    <div class="mb-3">
                        <label for="diaChiKhachHang" class="form-label">Địa chỉ
                            khách hàng</label> <input type="text" class="form-control"
                                                      id="diaChiKhachHang" name="diaChiKhachHang"
                                                      value="<%=diaChiKhachHang%>">
                    </div>
                    <div class="mb-3">
                        <label for="diaChiMuaHang" class="form-label">Địa chỉ mua
                            hàng</label> <input type="text" class="form-control" id="diaChiMuaHang"
                                                name="diaChiMuaHang" value="<%=diaChiMuaHang%>">
                    </div>
                    <div class="mb-3">
                        <label for="diaChiNhanHang" class="form-label">Địa chỉ
                            nhận hàng</label> <input type="text" class="form-control"
                                                     id="diaChiNhanHang" name="diaChiNhanHang"
                                                     value="<%=diaChiNhanHang%>">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label> <input
                            type="email" class="form-control" id="email" name="email" value="<%=email%>">
                    </div>
                    <hr/>
                    <div class="mb-3">
                        <label for="dongYNhanMail" class="form-label">Đồng ý nhận
                            email</label> <input type="checkbox" class="form-check-input"
                                                 id="dongYNhanMail"
                                                 name="dongYNhanMail" <%=(dongYNhanMail?"checked":"")%> >
                    </div>
                </div>
                <button class="btn btn-primary" type="submit"
                        value="Lưu thông tin" name="submit" id="submit">Lưu thông tin</button>
            </div>
        </form>
    </div>
</div>

<%
    }
%>
<%@include file="../footer.jsp"%>
</body>
</html>
