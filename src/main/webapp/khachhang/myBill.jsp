<%@ page import="model.donHang" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.khachHang" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 11/10/2024
  Time: 11:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bill list</title>
    <meta charset="UTF-8">
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
</head>
<style>
    body {
        background: linear-gradient(to right, #ffafbd, #ffc3a0);
        font-family: Arial, sans-serif;
    }

    .wrapper {
        min-height: 80%;
        display: flex;
        flex-direction: column;
    }

    .header-title {
        margin-top: 50px;
        margin-bottom: 20px;
        color: #d693ff;
    }

    .table th, .table td {
        text-align: center;
    }

    .table-hover tbody tr:hover {
        background-color: #f3e9ff;
    }


    footer {
        background-color: #f9e6ff;
        padding: 10px 0;
        text-align: center;
        color: #7f4c9f;
    }

    h1 {
        text-align: center;
        margin-top: 20px;
        color: #fff;
        font-weight: 600;
    }


    .container {

        padding: 30px;
        border-radius: 8px;

    }

    .table {
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        overflow: hidden;
    }

    .table th {
        background: linear-gradient(#ffafbd, #ffc3a0);
        color: black;
        font-weight: bold;
    }

    .table td {
        color: #333333;
    }

    .table-hover tbody tr:hover {
        background-color: rgba(235, 207, 255, 0.4);
    }


    .btn-danger:hover {
        background-color: #ffb3e6;
    }

    footer {
        background-color: #e3b8ff;
        color: #5f2a8a;
    }

    #baoLoi {
        color: #ff577f; /* Light red for error messages */
        text-align: center;
        margin-top: 10px;
        font-size: 1.1em;
    }
</style>
<% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();%>

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
<body>
<% String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";
%>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrapper">
    <div class="container pt-5">
        <div class="text-center header-title ">
            <h1>Danh Sách Đơn Hàng Của Tôi</h1>
        </div>
        <div style="color: <%=cl%>" id="baoLoi">
            <%=baoLoi%>
        </div>
        <table class="table table-hover table-bordered" style="border: 1px">
            <thead class="table-light">
            <tr>
                <th>STT</th>
                <th>Ma don hang</th>
                <th>Ngay dat hang</th>
                <th>Dia chi nhan hang</th>
                <th>Trang thai</th>
                <th>Chi tiet</th>
                <th>Thao tac</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<donHang> donHangs = (ArrayList<donHang>) request.getAttribute("list");
                if (donHangs == null || donHangs.size() == 0) return;
                int index = 1;
                for (donHang dh : donHangs) {
            %>
            <tr>
                <td><%=index++%>
                </td>
                <td><%=dh.getMaDonHang()%>
                </td>
                <td><%=dh.getNgayDatHang()%>
                </td>
                <td><%=dh.getDiaChiNhanHang()%>
                </td>
                <td><%=dh.getTrangThaiDonHang()%>
                </td>
                <td><a href="#" class="btn btn-outline-secondary">xem chi tiet</a></td>
                <td><a href="<%=url%>/khach-hang?hanhDong=deleteBill&id=<%=dh.getMaDonHang()%>" class="btn btn-danger"
                       onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này?');">Hủy</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<%
    }
%>
<footer style="margin-top: 20px; height:200px">
    <%@include file="../footer.jsp" %>
</footer>
</body>

</html>
