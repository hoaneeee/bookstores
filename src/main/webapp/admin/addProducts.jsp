<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 19/09/2024
  Time: 12:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Sản Phẩm </title>
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
    <link rel="stylesheet" href="../css/main.css">
    <style>
        .red {
            color: red;
        }
    </style>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%
    String baoLoi = request.getAttribute("baoLoi") +"";
    baoLoi=(baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") +"";
    if(!cl.equals("green")) cl = "red";

    String maSanPham = request.getAttribute("maSanPham")+"";
    maSanPham = (maSanPham.equals("null")) ? "" : maSanPham;

    String tenSanPham = request.getAttribute("tenSanPham")+"";
    tenSanPham = (tenSanPham.equals("null")) ? "" : tenSanPham;

    String maTacGia = request.getAttribute("maTacGia")+"";
    maTacGia=(maTacGia.equals("null")) ? "" : maTacGia;

    String namXuatBan = request.getAttribute("namXuatBan")+"";
    namXuatBan=(namXuatBan.equals("null")) ? "" : namXuatBan;

    String giaNhap = request.getAttribute("giaNhap")+"";
    giaNhap=(giaNhap.equals("null")) ? "" : giaNhap;

    String giaGoc= request.getAttribute("giaGoc")+"";
    giaGoc =(giaGoc.equals("null")) ? "" : giaGoc;

    String giaBan = request.getAttribute("giaBan")+"";
    giaBan = (giaBan.equals("null")) ? "" : giaBan;

    String soLuong= request.getAttribute("soLuong")+"";
    soLuong = (soLuong.equals("null")) ? "" :soLuong;

    String maTheLoai = request.getAttribute("maTheLoai")+"";
    maTheLoai=(maTheLoai.equals("null"))?"" : maTheLoai;

    String ngonNgu = request.getAttribute("ngonNgu")+"";
    ngonNgu = (ngonNgu.equals("null")) ? "" : ngonNgu;

    String moTa = request.getAttribute("moTa")+"";
    moTa = (moTa.equals("null")) ? "" : moTa;
    
%>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container pt-5">
    <div class="text-center" style="padding-top: 50px">
        <h1>THEM SAN PHAM </h1>
    </div>
    <div style="color: <%=cl%>" id="baoLoi">
        <%=baoLoi%>
    </div>
    <form class="form-control" action="<%=url%>/admin-servlet" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="active" value="them-san-pham">
        <div class="row">
            <div class="col-sm-6">
                <div class="mb-3">
                    <label for="maSanPham" class="form-label">Ma san pham<span class="red">*</span></label>
                    <input type="text" class="form-control" id="maSanPham" name="maSanPham"
                           value="<%=maSanPham  %>">
                </div>

                <div class="mb-3">
                    <label for="maTacGia" class="form-label">Ma tac gia<span class="red">*</span></label>
                    <input type="text" class="form-control" id="maTacGia" name="maTacGia"
                           value="<%=maTacGia %>">
                </div>

                <div class="mb-3">
                    <label for="namXuatBan" class="form-label">Nam xuat ban <span class="red">*</span></label>
                    <input type="number" class="form-control" id="namXuatBan" name="namXuatBan"
                           value="<%=namXuatBan%>">
                </div>

                <div class="mb-3">
                    <label for="giaNhap" class="form-label">Gia nhap<span class="red">*</span></label>
                    <input type="number" class="form-control" id="giaNhap" name="giaNhap"
                           value="<%=giaNhap%>">
                </div>

                <div class="mb-3">
                    <label for="giaGoc" class="form-label">Gia goc<span class="red">*</span></label>
                    <input type="number" class="form-control" id="giaGoc" name="giaGoc"
                           value="<%=giaGoc%>">
                </div>

                <div class="mb-3">
                    <label for="giaBan" class="form-label">Gia ban<span class="red">*</span></label>
                    <input type="number" class="form-control" id="giaBan" name="giaBan"
                           value="<%=giaBan%>">
                </div>
            </div>

            <div class="col-sm-6">
                <div class="mb-3">
                    <label for="tenSanPham" class="form-label">Ten san Pham <span class="red">*</span></label>
                    <input type="text" class="form-control" id="tenSanPham" name="tenSanPham"
                           value="<%=tenSanPham %>">
                </div>

                <div class="mb-3">
                    <label for="maTheLoai" class="form-label">Ma the loai<span class="red">*</span></label>
                    <input type="text" class="form-control" id="maTheLoai" name="maTheLoai"
                           value="<%=maTheLoai%>">
                </div>

                <div class="mb-3">
                    <label for="soLuong" class="form-label">So Luong<span class="red">*</span></label>
                    <input type="number" class="form-control" id="soLuong" name="soLuong"
                           value="<%=soLuong %>">
                </div>


                <div class="mb-3">
                    <label for="ngonNgu" class="form-label">Ngon ngu</label>
                    <select
                            class="form-control" id="ngonNgu" name="ngonNgu">
                        <option></option>
                        <option value="Vietnamese" <%=(ngonNgu.equals("Vietnamese")) ? "selected='selected'" : "" %> >
                            Vietnamese
                        </option>
                        <option value="English" <%=(ngonNgu.equals("English")) ? "selected='selected'" : "" %>>English
                        </option>
                        <option value="Others"<%=(ngonNgu.equals("Others")) ? "selected='selected'" : "" %>>Others
                        </option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="moTa" class="form-label">Mo ta</label>
                    <input type="text" class="form-control" id="moTa" name="moTa"
                           value="<%=moTa%>">
                </div>

                <div class="mb-3">
                    <label for="themAnh" class="form-label">Them anh<span class="red">*</span></label>
                    <input type="file" class="form-control" id="themAnh" name="themAnh">
                </div>
            </div>
            <div class="row">
                <input class="btn btn-primary form-control" type="submit"
                       value="Them san pham " name="submit" id="submit">
            </div>
        </div>
    </form>

</div>
<%@include file="../footer.jsp"%>
</body>
</html>
