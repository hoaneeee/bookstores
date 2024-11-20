<%@ page import="java.util.ArrayList" %>
<%@ page import="model.sanPham" %>
<%@ page import="model.khachHang" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 21/09/2024
  Time: 12:04 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sach san pham</title>
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
</head>
<body>
<% String url= request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort()+ request.getContextPath();%>
<%     String baoLoi = request.getAttribute("baoLoi") +"";
    baoLoi=(baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") +"";
    if(!cl.equals("green")) cl = "red";
%>
<style>
    html, body {
        height: 100%;
        margin: 0;
        background-color: #f3f4f6;
        color: #333;
    }
    .wrapper {
        min-height: 80%;
        display: flex;
        flex-direction: column;
    }
    footer {
        background-color: #f1f1f1;
    }
    th, td {
        text-align: center;
        vertical-align: middle;
    }
    .table-container {
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
        background-color: white;
    }
    .table th {
        background-color: #6272a4;
        color: #ffffff;
    }
    .table-hover tbody tr:hover {
        background-color: #d8dee9;
    }
    #baoLoi {
        color: <%= cl %>;
        font-weight: bold;
        margin-top: 15px;
    }
    h1 {
        font-family: 'Arial', sans-serif;
        color: #9b59b6;
        font-size: 3em;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 2px;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        padding: 10px 0;
    }

</style>
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="container pt-5">
        <div class="text-center" style="padding-top: 50px">
            <h1>DANH SÁCH USER</h1>
        </div>
        <div style="color: <%=cl%>" id="baoLoi">
            <%=baoLoi%>
        </div>
        <table class="table table-hover table-bordered table-container" style="border: 1px">
            <thead>
            <tr>
                <th>STT</th>
                <th>Ma khach hang</th>
                <th>Ten khach hang</th>
                <th>Gioi tinh</th>
                <th>Ngay sinh</th>
                <th>Dia chi</th>
                <th>So dien thoai</th>
                <th>Email</th>
                <th colspan="2">#</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<khachHang> khachHangs=(ArrayList<khachHang>) request.getAttribute("listKhachHang");
                if(khachHangs == null || khachHangs.size()==0) return;
                int index=1;
                for (khachHang kh : khachHangs){
            %>
            <tr>
                <td><%=index++%></td>
                <td><%=kh.getMaKhachHang()%></td>
                <td><%=kh.getHoVaten()%></td>
                <td><%=kh.getGioiTinh()%></td>
                <td><%=kh.getNgaySinh()%></td>
                <td><%=kh.getDiaChi()%></td>
                <td><%=kh.getNgaySinh()%></td>
                <td><%=kh.getEmail()%></td>
                <td><a href="<%=url%>/admin-servlet?active=delete&id=<%=kh.getMaKhachHang()%>" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<footer>
    <%@include file="../footer.jsp"%>
</footer>
<script>
    setTimeout(()=>{
        document.getElementById("baoLoi").style.display="none";
    },3000);
</script>
</body>
</html>
