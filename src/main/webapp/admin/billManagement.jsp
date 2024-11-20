<%@ page import="model.donHang" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.TrangThaiDonHang" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill Management</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>
</head>

<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";
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
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
            <h1>QUẢN LÝ ĐƠN HÀNG </h1>
        </div>
        <div style="color: <%=cl%>" id="baoLoi">
            <%=baoLoi%>
        </div>
        <table class="table table-hover table-bordered" style="border: 1px">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã Đơn Hàng</th>
                <th>Khách Hàng</th>
                <th>Ngày Đặt</th>
                <th>Địa Chỉ Giao Hàng</th>
                <th>Tổng Tiền</th>
                <th>Trạng Thái</th>
                <th>Chi Tiết</th>
                <th>Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<donHang> donHangs = (ArrayList<donHang>) request.getAttribute("listDonHang");
                if (donHangs == null || donHangs.size() == 0) return;
                int index = 1;
                for (donHang dh : donHangs) {
            %>
            <tr>
                <td><%=index++%></td>
                <td><%=dh.getMaDonHang()%></td>
                <td><%=dh.getKhachHang().getHoVaten()%></td>
                <td><%=dh.getNgayDatHang()%></td>
                <td><%=dh.getDiaChiNhanHang()%></td>
                <td><%=dh.getTongtien()%></td>
                <td><%=dh.getTrangThaiDonHang()%></td>
                <td><a href="#" class="btn btn-danger">Xem Chi Tiết</a></td>
                <td>
                    <%
                        if (dh.getTrangThaiDonHang().equals(TrangThaiDonHang.DANG_CHO)) {
                    %>
                    <a href="<%=url%>/admin-servlet?active=bill_status&madonhang=<%=dh.getMaDonHang()%>&status=DA_XAC_NHAN"
                       class="btn btn-warning"
                       onclick="return confirm('Bạn có chắc chắn muốn xác nhận đơn hàng này?');">Xác Nhận</a>
                    <% } else if (dh.getTrangThaiDonHang().equals(TrangThaiDonHang.DA_XAC_NHAN)) { %>
                    <a href="<%=url%>/admin-servlet?active=bill_status&madonhang=<%=dh.getMaDonHang()%>&status=DANG_GIAO"
                       class="btn btn-primary"
                       onclick="return confirm('Bạn có chắc chắn muốn giao đơn hàng này?');">Đang Giao</a>
                    <% } else if (dh.getTrangThaiDonHang().equals(TrangThaiDonHang.DANG_GIAO)) { %>
                    <a href="<%=url%>/admin-servlet?active=bill_status&madonhang=<%=dh.getMaDonHang()%>&status=DA_GIAO"
                       class="btn btn-success"
                       onclick="return confirm('Bạn có chắc chắn muốn hoàn thành đơn hàng này?');">Hoàn Thành</a>
                    <% } else { %>
                    <span class="badge bg-secondary">Đã Hoàn Thành</span>
                    <% } %>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    setTimeout(() => {
        document.getElementById("baoLoi").style.display = "none";
    }, 3000);
</script>

</body>
</html>
