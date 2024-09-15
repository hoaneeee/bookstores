<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 26/08/2024
  Time: 10:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add-products</title>
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
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">

</head>
<body>
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

    String maSanPham = request.getAttribute("maSanPham") + "";
    maSanPham = (maSanPham.equals("null")) ? "" : maSanPham;

    String tenSanPham = request.getAttribute("tenSanPham") + "";
    tenSanPham = (tenSanPham.equals("null")) ? "" : tenSanPham;

    String maTacGia = request.getAttribute("maTacGia") + "";
    maTacGia = (maTacGia.equals("null")) ? "" : maTacGia;

    String namXuatBan = request.getAttribute("namXuatBan") + "";
    namXuatBan = (namXuatBan.equals("null")) ? "" : namXuatBan;

    String giaNhap = request.getAttribute("giaNhap") + "";
    giaNhap = (giaNhap.equals("null")) ? "" : giaNhap;

    String giaGoc = request.getAttribute("giaGoc") + "";
    giaGoc = (giaGoc.equals("null")) ? "" : giaGoc;

    String giaBan = request.getAttribute("giaBan") + "";
    giaBan = (giaBan.equals("null")) ? "" : giaBan;

    String soLuong = request.getAttribute("soLuong") + "";
    soLuong = (soLuong.equals("null")) ? "" : soLuong;

    String maTheLoai = request.getAttribute("maTheLoai") + "";
    maTheLoai = (maTheLoai.equals("null")) ? "" : maTheLoai;

    String ngonNgu = request.getAttribute("ngonNgu") + "";
    ngonNgu = (ngonNgu.equals("null")) ? "" : ngonNgu;

    String moTa = request.getAttribute("moTa") + "";
    moTa = (moTa.equals("null")) ? "" : moTa;


%>
<div class="contain">
    <div class="contain__h1">
        <h1 class="contain__h1-text">
            Thêm sản phẩm
        </h1>
    </div>
    <div class="red" id="baoLoi">
        <%=baoLoi%>
    </div>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <form class="contain__form" action="<%=url%>/admin-addProducts" method="post" enctype="multipart/form-data">
        <input type="hidden" name="active" value="them-san-pham">
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="maSanPham" class="contain__label">Mã sản phẩm </label>
                <input type="text" class="contain__input" id="maSanPham" name="maSanPham" value="<%=maSanPham%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="tenSanPham" class="contain__label">Tên sản phẩm </label>
                <input type="text" class="contain__input" id="tenSanPham" name="tenSanPham" value="<%=tenSanPham%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="maTacGia" class="contain__label">ma tac gia</label>
                <input type="text" class="contain__input" id="maTacGia" name="maTacGia" value="<%=maTacGia%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="namXuatBan" class="contain__label">nam xuat ban </label>
                <input type="text" class="contain__input" id="namXuatBan" name="namXuatBan" value="<%=namXuatBan%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="giaNhap" class="contain__label">gia nhap</label>
                <input type="text" class="contain__input" id="giaNhap" name="giaNhap" value="<%=giaNhap%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="giaGoc" class="contain__label">gia goc</label>
                <input type="text" class="contain__input" id="giaGoc" name="giaGoc" value="<%=giaGoc%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="giaBan" class="contain__label">Giá ban</label>
                <input type="text" class="contain__input" id="giaBan" name="giaBan" value="<%=giaBan%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="soLuong" class="contain__label">so luong</label>
                <input type="text" class="contain__input" id="soLuong" name="soLuong" value="<%=soLuong%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="maTheLoai" class="contain__label">ma the loai</label>
                <input type="text" class="contain__input" id="maTheLoai" name="maTheLoai" value="<%=maTheLoai%>">
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="ngonNgu" class="contain__label">ngon ngu</label>
                <input type="text" class="contain__input" id="ngonNgu" name="ngonNgu" value="<%=ngonNgu%>">
            </div>
        </div>
        <div class="contain__row">
            <label for="moTa" class="contain__label">mô tả</label>
            <input class="contain__mota" id="moTa" name="moTa" value="<%=moTa%>">
        </div>
        <div class="contain__row">
            <label for="themAnh" class="contain__label">Thêm ảnh</label>
            <input type="file" class="contain__input" id="themAnh" name="themAnh">
        </div>

        <div class="contain__row">
            <input type="submit" name="submit" id="submit" value="lưu thông tin">
        </div>
    </form>
</div>
</body>
</html>
