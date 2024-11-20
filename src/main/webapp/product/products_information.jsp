<%@ page import="model.sanPham" %>
<%@ page import="model.reviews" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
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
</head>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        color: #495057;
    }
    .container-in4{
        background-color: white;
        padding-top: 50px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    /* Review Form */
    #reviewForm {
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        padding: 15px;
        border-radius: 5px;
    }

    #reviewForm label {
        font-weight: bold;
        color: #495057;
    }

    #reviewForm button {
        width: 100%;
        font-weight: bold;
    }

    /* User Reviews */
    #reviewsContainer {
        margin-top: 20px;
        background-color: #f8f9fa;    }

    .review-item {
        display: flex;
        align-items: center;
        padding: 10px;
        border-bottom: 1px solid #dee2e6;
    }

    .review-item:last-child {
        border-bottom: none;
    }

    .review-item .user-avatar {
        width: 50px;
        height: 50px;
        background-color: #adb5bd;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: bold;
        font-size: 1.2em;
        margin-right: 15px;
    }

    .review-item .review-content {
        flex-grow: 1;
    }

    .review-item .review-content strong {
        color: #343a40;
        font-size: 1.1em;
    }

    .review-item .review-content p {
        margin: 0;
        color: #6c757d;
    }

    .review-item .review-rating {
        color: #ffc107;
    }
    h2, h4, h5 {
        font-weight: bold;
        color: #343a40;
    }
    .card-img-top-avatar{
        width: 50px;
        height: 50px;
        border-radius: 100%;
    }

</style>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<% sanPham sanpham = (sanPham) request.getAttribute("sanPham");
    java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###.00");
    String formattedGiaBan = formatter.format(sanpham.getGiaBan());
%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";
%>
<div class="container container-in4 mt-5">
    <div style="color: <%=cl%>" id="baoLoi">
        <%=baoLoi%>
    </div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=url%>/home.jsp">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Sách</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin sách</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-md-5">
            <div class="card">
                <img src="<%=url%>/anhSanPham/<%=sanpham.getThemAnh()%>" class="card-img-top"
                     alt="<%=sanpham.getTenSanPham()%>">
            </div>
        </div>

        <div class="col-md-7">
            <h2 class="fw-bold"><%=sanpham.getTenSanPham()%>
            </h2>
            <p class="text-muted">Tác giả: <%=sanpham.getTacGia().getHoVaTen()%>
            </p>
            <p class="text-muted">Thể loại: <%=sanpham.getTheLoai().getTheLoai()%>
            </p>

            <h4 class="text-danger">Giá: <%=formattedGiaBan%>đ
            </h4>
            <p>
                <span class="badge bg-success">4.5/5</span> (200 lượt đánh giá)
            </p>

            <p>Còn lại: <%=sanpham.getSoLuong()%>
            </p>

            <div class="d-flex mb-3">
                <form action="<%=url%>/products-information?hd=cart-product&id=<%=sanpham.getMaSanPham()%>"
                      method="post">
                    <label for="quantity">Số lượng:</label>
                    <input type="number" name="quantity" id="quantity" value="1" min="1" max="10"
                           style="width: 100px;"/>
                    <button type="submit" class="btn btn-outline-danger flex-fill me-2" style="padding-right: 95px">Thêm
                        Vào Giỏ Hàng
                    </button>
                </form>
                <button type="button" class="btn btn-danger flex-fill" style="height: 38px">Mua Ngay</button>
            </div>
            <div class="row mt-5">
                <div class="col-md-12">
                    <h4>Mô tả sách</h4>
                    <p>
                        <%=sanpham.getMoTa()%>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-md-12">
            <h4>Đánh giá từ người dùng</h4>

            <form id="reviewForm">
                <div class="mb-3">
                    <label for="rating" class="form-label">Đánh giá:</label>
                    <select id="rating" class="form-select" name="rating" required>
                        <option value="1">1 sao</option>
                        <option value="2">2 sao</option>
                        <option value="3">3 sao</option>
                        <option value="4">4 sao</option>
                        <option value="5">5 sao</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="comment" class="form-label">Bình luận:</label>
                    <textarea id="comment" class="form-control" name="comment" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Gửi Bình luận</button>
            </form>

            <h5>Các đánh giá:</h5>
            <div id="reviewsContainer" class="mt-4">
                <%
                    List<reviews> reviews = (List<reviews>) request.getAttribute("reviews");
                    if (reviews != null && reviews.size() > 0) {
                        for (reviews review : reviews) {
                %>
                <div class="review-item">
                    <div class="user-avatar">
                        <img src="<%=url%>/anhSanPham/<%= review.getMa_khach_hang().getAvatar() %>" class="card-img-top-avatar">
                    </div>
                    <div class="review-content">
                        <strong><%= review.getMa_khach_hang().getHoVaten() %></strong>
                        <span class="review-rating"><%= "★".repeat(review.getRating()) %></span>
                        <p><%= review.getComment() %></p>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <span id="noReviewMessage">Không có đánh giá nào</span>
                <%
                    }
                %>
            </div>

        </div>
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("reviewForm").addEventListener("submit", (event) => {
            event.preventDefault();
            const rating = document.getElementById("rating").value;
            const comment = document.getElementById("comment").value;
            const masanpham = '<%=sanpham.getMaSanPham()%>';

            //Tạo đối tượng URLSearchParams để mã hóa dữ liệu form theo định dạng application/x-www-form-urlencoded, phù hợp để gửi qua phương thức POST.
            const formData = new URLSearchParams();
            formData.append('masanpham', masanpham);
            formData.append('rating', rating);
            formData.append('comment', comment);

            console.log('masanpham:', masanpham);
            console.log('rating:', rating);
            console.log('comment:', comment);
            fetch('<%=url%>/reviews', {
                method: 'POST',
                headers:
                    {'Content-Type': 'application/x-www-form-urlencoded'},
                body: formData.toString()
            })
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'success') {
                        document.getElementById("reviewForm").reset();

                        const reviewsContainer = document.getElementById("reviewsContainer");
                        const newReviews = "<p><strong>" + data.user + " : </strong>" + comment + rating + " sao </p>";


                        const noReviewMessage = document.getElementById("noReviewMessage");
                        if (noReviewMessage) {
                            noReviewMessage.remove();
                        }
                        reviewsContainer.innerHTML = newReviews + reviewsContainer.innerHTML;
                    } else {
                        alert("co loi ");
                    }
                })
                .catch(error => {
                    console.error("Có lỗi xảy ra:", error);
                    alert("Có lỗi xảy ra, vui lòng thử lại.");
                })
        })
    })
    setTimeout(()=>{
        document.getElementById("baoLoi").style.display="none"
    },3000);
</script>
</html>

