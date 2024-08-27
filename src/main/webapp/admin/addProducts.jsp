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
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
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
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div class="contain">
    <form class="contain__form" action="" >
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="maSanPham" class="contain__label">Mã sản phẩm </label>
                <input type="text" class="contain__input" id="maSanPham" name="maSanPham" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="tenSanPham" class="contain__label">Tên sản phẩm </label>
                <input type="text" class="contain__input" id="tenSanPham" name="tenSanPham" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="maTacGia" class="contain__label">Giá</label>
                <input type="text" class="contain__input" id="maTacGia" name="maTacGia" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="namXuatBan" class="contain__label">Tên sản phẩm </label>
                <input type="text" class="contain__input" id="namXuatBan" name="namXuatBan" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="giaNhap" class="contain__label">Mã sản phẩm </label>
                <input type="text" class="contain__input" id="giaNhap" name="giaNhap" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="giaGoc" class="contain__label">Tên sản phẩm </label>
                <input type="text" class="contain__input" id="giaGoc" name="giaGoc" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="giaBan" class="contain__label">Giá</label>
                <input type="text" class="contain__input" id="giaBan" name="giaBan" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="soLuong" class="contain__label">Tên sản phẩm </label>
                <input type="text" class="contain__input" id="soLuong" name="soLuong" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="maTheLoai" class="contain__label">Tên sản phẩm </label>
                <input type="text" class="contain__input" id="maTheLoai" name="maTheLoai" >
            </div>
        </div>
        <div class="contain__row">
            <div class="contain__row-input">
                <label for="ngonNgu" class="contain__label">Mã sản phẩm </label>
                <input type="text" class="contain__input" id="ngonNgu" name="ngonNgu" >
            </div>
        </div>
        <div class="contain__row">
            <label for="moTa" class="contain__label"></label>
            <input class="contain__mota" id="moTa" name="moTa">
        </div>
    </form>
</div>
</body>
</html>
