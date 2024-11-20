<%@ page import="java.util.ArrayList" %>
<%@ page import="model.sanPham" %>
<%@ page import="model.khachHang" %>
<%@ page import="org.example.controller.ProductsInforController" %>
<%@ page import="database.sanPhamDAO" %>
<%@ page import="model.GioHang" %><%--
      Created by IntelliJ IDEA.
      User: Acer
      Date: 28/09/2024
      Time: 11:23 CH
      To change this template use File | Settings | File Templates.
    --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gio hang</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
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
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container-cart {
            max-width: 900px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding-top: 30px;
            background: #fff;
            margin-top: 120px;
        }
        button {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            color: #007bff;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            text-decoration: none;
        }

        button a {
            color: #007bff;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        button a:hover {
            text-decoration: underline;
        }

        button i {
            margin-right: 8px;
        }

        button:hover {
            background-color: #e2e6ea;
            border-color: #adb5bd;
        }


        .header-row, .product-row {
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }

        .header-row {
            font-weight: bold;
            color: #495057;
        }

        .product-image {
            width: 60px;
            height: 60px;
            border-radius: 5px;
        }

        .product-checkbox {
            margin-right: 15px;
        }

        .quantity-input {
            width: 60px;
            text-align: center;
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 4px;
        }

        .text-danger {
            font-weight: bold;
            font-size: 1.1em;
            color: #dc3545;
        }

        .btn-sm {
            padding: 2px 8px;
            font-size: 0.85em;
        }

        .footer-actions .btn-link {
            color: #007bff;
            text-decoration: none;
        }

        .footer-actions .btn-link:hover {
            text-decoration: underline;
        }

        footer {
            text-align: center;
            margin-top:150px;
            font-size: 0.9em;
            color: #6c757d;
        }

    </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%
    khachHang khachhang = (khachHang) session.getAttribute("khachHang");
    if (khachhang == null) {
%>
<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
<%
} else {
%>

<div class="container container-cart "  >
    <button><a href="<%=url%>/home.jsp"><i class="fa-solid fa-arrow-left-long"></i> Tiếp tục mua sắm </a></button>
    <div class="row header-row">
        <div class="col-5">Sản phẩm</div>
        <div class="col-2 text-center">Đơn Giá</div>
        <div class="col-2 text-center">Số Lượng</div>
        <div class="col-2 text-center">Số Tiền</div>
        <div class="col-1 text-center">Thao tác</div>
    </div>

    <%

        if (khachhang.getGioHangList() != null && !khachhang.getGioHangList().isEmpty()) {
            for (int i = 0; i < khachhang.getGioHangList().size(); i++) {
                System.out.println("Getting product with ID: " + khachhang.getGioHangList().get(i).id);
                sanPham sp = sanPhamDAO.gI().selectByID(khachhang.getGioHangList().get(i).id);
                java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###.00");
                String formattedGiaBan = formatter.format(sp.getGiaBan());
                String formattedGiaBan2 = formatter.format(sp.getGiaBan() * khachhang.getGioHangList().get(i).quantity);
    %>
    <div class="row product-row align-items-center">
        <div class="col-5 d-flex align-items-center">
            <input type="checkbox" class="product-checkbox" name="selectedProducts<%=i%>" value="<%=sp.getMaSanPham()%>"
                   data_price="<%=sp.getGiaBan()*khachhang.getGioHangList().get(i).quantity%>"
                   data_cost="<%=sp.getGianhap()*khachhang.getGioHangList().get(i).quantity%>"
                   data_id="<%=khachhang.getGioHangList().get(i).id%>">
            <img src="<%=url%>/anhSanPham/<%=sp.getThemAnh()%>" alt="<%=sp.getTenSanPham()%>"
                 class="product-image me-3">
            <span><%= sp.getTenSanPham() %></span>
        </div>
        <div class="col-2 text-center"><s>₫<%=sp.getGiaGoc()%>
        </s>
            <hr>
            ₫<%=formattedGiaBan%>
        </div>
        <div class="col-2 text-center">
            <form action="<%=url%>/products-information?hd=update-cart" method="post"
                  class="d-flex justify-content-center align-items-center">
                <input type="hidden" name="productId" value="<%=sp.getMaSanPham() %>">
                <button type="submit" name="action" value="decrease" class="btn btn-sm btn-outline-secondary">-</button>
                <input type="text" name="quantity" value="<%= khachhang.getGioHangList().get(i).quantity %>"
                       class="quantity-input mx-1" readonly>
                <button type="submit" name="action" value="increase" class="btn btn-sm btn-outline-secondary">+</button>
            </form>
        </div>
        <div class="col-2 text-center text-danger">₫<%=formattedGiaBan2%>
        </div>
        <div class="col-1 text-center">
            <form action="<%=url%>/products-information?hd=delete" method="post">
                <input type="hidden" name="Id" value="<%=sp.getMaSanPham() %>">
                <button type="submit" class="btn btn-sm btn-outline-danger">Xóa</button>
            </form>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p> khong co san pham </p>
    <%}%>

    <form action="<%=url%>/bill?click=bill_prd" method="post">
        <div class="row align-items-center">
            <div class="col">
                <input type="checkbox" id="selectAll"> Chọn Tất Cả (1)
                <button class="btn btn-link">Xóa</button>
            </div>
            <div class="col text-end">
                <%-- const totalAmountElement = document.getElementById('totalAmount');--%>
                Tổng thanh toán : <span class="text-danger fw-bold" id="totalAmount"></span>
                <input type="hidden" name="totalAmount" id="totalAmountInput"><!-- Thêm input ẩn cho tổng tiền -->
                <input type="hidden" name="totalCost" id="totalCostInput">
                <input type="hidden" name="listSP" id="lstSP">

                <%--mua hàng --%>
                <button type="submit" class="btn btn-danger ms-3">Mua Hàng</button>
            </div>
        </div>
    </form>
</div>
<%}%>
<footer>

    <%@include file="../footer.jsp" %>
</footer>
<script>

    document.addEventListener('DOMContentLoaded', function () {
        const productCheckboxes = document.querySelectorAll('.product-checkbox');
        const totalAmountElement = document.getElementById('totalAmount');
        const totalCostInput = document.getElementById('totalCostInput');
        const tt = document.getElementById("totalAmountInput");
        const lst = document.getElementById("lstSP");

        function calculateTotal() {

            let totalprice = 0.0;
            let totalcost = 0.0;
            let ls = ""
            productCheckboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    let price = parseFloat(checkbox.getAttribute('data_price'));
                    let cost = parseFloat(checkbox.getAttribute('data_cost'));
                    let id = checkbox.getAttribute('data_id');
                    if (!isNaN(price) && !isNaN(cost)) {
                        //m dùng `ổ dong nay no d in ra duoc gia tri bien th ngu
                        console.log(`Checkbox checked, price: ` + price);
                        totalprice += price;
                        totalcost += cost;
                        ls = ls + id + " ";
                    } else {
                        console.error("Invalid price value:", checkbox.getAttribute('data_price'));
                        console.error("Invalid price value:", checkbox.getAttribute('data_cost'));
                    }
                }
            });
            console.log(`Total calculated: ` + totalprice);
            console.log(`Total calculated: ` + totalcost);
            lst.value = ls;
            totalAmountElement.textContent = totalprice > 0 ? (totalprice +"đ") : "";
            tt.value = totalprice;
            totalCostInput.value = totalcost;

        }

        productCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {

                console.log('Checkbox state changed');
                calculateTotal();
            });
        });
        const selectAllCheckbox = document.getElementById('selectAll');
        selectAllCheckbox.addEventListener('change', function () {
            const isChecked = selectAllCheckbox.checked;
            productCheckboxes.forEach(checkbox => {
                checkbox.checked = isChecked;
            });
            calculateTotal();
        });
    });
</script>

</body>
</html>
