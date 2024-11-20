<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 20/11/2024
  Time: 1:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <h1>Đặt hàng thành công</h1>
            <p>Mã đơn hàng: #DH<%= request.getAttribute("orderId") %></p>
            <div id="success_pay_box" class="p-3 text-success border border-2 mt-5" style="display:none">
                <h2>Thanh toán thành công</h2>
                <p>Chúng tôi đã nhận được thanh toán.</p>
            </div>
            <div id="checkout_box" class="mt-5">
                <h3>Hướng dẫn thanh toán</h3>
                <p>Quét mã QR hoặc chuyển khoản:</p>
                <img src="https://qr.sepay.vn/img?bank=MBBank&acc=0903252427&template=compact&amount=<%= request.getAttribute("total") %>&des=DH<%= request.getAttribute("orderId") %>" alt="QR Code">
            </div>
        </div>
    </div>
</div>

<script>
    var pay_status = 'CHO_THANH_TOAN';
    function checkPaymentStatus() {
        if (pay_status === 'CHO_THANH_TOAN') {
            $.ajax({
                type: "POST",
                url: "payment",
                data: { order_id: <%= request.getAttribute("orderId") %> },
                dataType: "json",
                success: function(data) {
                    if (data.payment_status === "DA_THANH_TOAN") {
                        $("#checkout_box").hide();
                        $("#success_pay_box").show();
                        pay_status = "Paid";
                    }
                }
            });
        }
    }
    setInterval(checkPaymentStatus, 1000);
</script>
</body>
</html>
