<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doanh thu</title>
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

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .wrapper {
            min-height: 80%;
            display: flex;
            flex-direction: column;
        }

        footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 10px;
        }

        h1 {
            color: #343a40;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .alert {
            border: 1px solid #007bff;
            border-radius: 5px;
            padding: 15px;
        }

        th {
            text-align: center;
            background-color: #28a745;
            color: white;
        }

        .btn {
            border-radius: 20px;
            padding: 10px 20px;
            font-weight: bold;
        }

        .btn-container {
            text-align: center;
            margin: 20px 0;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            min-width: 200px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .revenue-table {
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .revenue-table th, .revenue-table td {
            padding: 12px;
            vertical-align: middle;
        }

        .revenue-table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }

        .revenue-results {
            display: none;
        }

        .revenue-table {
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            border-collapse: collapse;
        }

        .revenue-table thead {
            background-color: #28a745;
            color: white;
        }

        .revenue-table th {
            text-align: center;
            padding: 15px;
            font-weight: bold;
            border: 1px solid #ddd;
            white-space: nowrap;
            vertical-align: middle;
        }

        .revenue-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }

        .revenue-table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }

        .revenue-table tbody tr:hover {
            background-color: #f5f5f5;
        }

        .revenue-table {
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            border-collapse: collapse;
        }

        .revenue-table thead {
            background-color: #28a745;
            color: white;
        }

        .revenue-table th {
            text-align: center;
            padding: 15px;
            font-weight: bold;
            border: 1px solid #ddd;
            white-space: nowrap;
            vertical-align: middle;
        }

        .revenue-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }

        .revenue-table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }

        .revenue-table tbody tr:hover {
            background-color: #f5f5f5;
        }

    </style>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrapper">
    <div class="container mt-5" style="padding-top: 50px">
        <h1 class="mb-4 text-center">Doanh Thu</h1>

        <form action="<%=url%>/admin-servlet" method="POST">
            <input type="hidden" name="active" value="Revenue">
            <div class="form-group">
                <label for="revenueType">Chọn loại doanh thu:</label>
                <select class="form-control" name="revenueType" id="revenueType" onchange="toggleInputs()">
                    <option value="daily">Theo Ngày</option>
                    <option value="monthly">Theo Tháng</option>
                    <option value="quarterly">Theo Quý</option>
                    <option value="yearly">Theo Năm</option>
                </select>
            </div>

            <div id="dailyInput" class="form-group">
                <label for="date">Chọn ngày:</label>
                <input type="date" class="form-control" name="date" id="date">
            </div>

            <div id="monthlyInput" class="form-group" style="display: none;">
                <label for="month">Chọn tháng:</label>
                <input type="month" class="form-control" name="month" id="month">
            </div>

            <div id="quarterlyInput" class="form-group" style="display: none;">
                <label for="quarter">Chọn quý:</label>
                <select class="form-control" name="quarter" id="quarter">
                    <option value="1">Quý 1</option>
                    <option value="2">Quý 2</option>
                    <option value="3">Quý 3</option>
                    <option value="4">Quý 4</option>
                </select>
                <label for="yearQuarter">Chọn năm:</label>
                <input type="number" class="form-control" name="yearQuarter" id="yearQuarter" min="2000" max="2100">
            </div>

            <div id="yearlyInput" class="form-group" style="display: none;">
                <label for="year">Chọn năm:</label>
                <input type="number" class="form-control" name="year" id="year" min="2000" max="2100">
            </div>

            <div class="btn-container">
                <button type="submit" class="btn btn-primary" onclick="showResults()">Xem Doanh Thu</button>
            </div>
        </form>

        <div class="revenue-results" id="revenueResults" style="display: none;">
            <% if (request.getAttribute("revenue") != null) { %>
            <div class="alert alert-success mt-4" role="alert">
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="alert-heading">Tổng doanh thu
                            <%=
                            request.getAttribute("revenueType").equals("daily") ? "ngày" :
                                    request.getAttribute("revenueType").equals("monthly") ? "tháng" :
                                            request.getAttribute("revenueType").equals("quarterly") ? "quý" : "năm"
                            %>:</h4>
                        <p><%=request.getAttribute("revenue") %>đ</p>
                    </div>
                    <div class="col-md-6">
                        <h4 class="alert-heading">Tổng lợi nhuận
                            <%=
                            request.getAttribute("revenueType").equals("daily") ? "ngày" :
                                    request.getAttribute("revenueType").equals("monthly") ? "tháng" :
                                            request.getAttribute("revenueType").equals("quarterly") ? "quý" : "năm"
                            %>:</h4>
                        <p><%=request.getAttribute("profit")%>đ</p>
                    </div>
                </div>
            </div>
            <% } %>
            <div class="table-responsive">
                <table class="table revenue-table">
                    <thead>
                    <tr>
                        <th>Năm</th>
                        <th>Số đơn</th>
                        <th>Doanh thu</th>
                        <th>Lợi nhuận</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><%=request.getAttribute("selectTime")%></td>
                        <td><%=request.getAttribute("countBill")%></td>
                        <td><%=request.getAttribute("revenue")  %>đ</td>
                        <td><%=request.getAttribute("profit") %>đ</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleInputs() {
        var revenueType = document.getElementById("revenueType").value;
        document.getElementById("dailyInput").style.display = revenueType === "daily" ? "block" : "none";
        document.getElementById("monthlyInput").style.display = revenueType === "monthly" ? "block" : "none";
        document.getElementById("quarterlyInput").style.display = revenueType === "quarterly" ? "block" : "none";
        document.getElementById("yearlyInput").style.display = revenueType === "yearly" ? "block" : "none";
    }

    function showResults() {
        var revenue = <%= request.getAttribute("revenue") != null ? "true" : "false" %>;
        if (revenue) {
            document.getElementById("revenueResults").style.display = "block";
        }
    }

    window.onload = function () {
        <% if (request.getAttribute("revenue") != null || request.getAttribute("profit") != null) { %>
        document.getElementById("revenueResults").style.display = "block";
        <% } %>
    }
</script>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>