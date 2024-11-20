<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 20/08/2024
  Time: 11:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="./css/font/fontawesome-free-6.4.0-web/css/all.min.css">
<link rel="stylesheet" href="css/main.css">
<%
String url= request.getScheme() +"://" + request.getServerName() +":"+ request.getServerPort()+request.getContextPath();
%>
<div class="col-lg-2 fixed-position">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            thể loại
        </a>
        <ul class="category__list" >
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Tiểu%20thuyết" class="category__list-item--link ">Tiểu thuyết </a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Trinh%20thám" class="category__list-item--link">Trinh thám</a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Kinh%20dị" class="category__list-item--link">Kinh dị</a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Ngụ%20ngôn" class="category__list-item--link">Ngụ ngôn</a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Thần%20thoại" class="category__list-item--link">Thần thoại</a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Phiêu%20lưu" class="category__list-item--link">Phiêu lưu</a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Tuổi%20trẻ" class="category__list-item--link">Tuổi trẻ</a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Học%20đường" class="category__list-item--link">Học đường</a>
            </li>
            <li class="category__list-item">
                <a href="<%=url%>/products-information?hd=category&id=Lãng%20mạn" class="category__list-item--link">Lãng mạn</a>
            </li>
        </ul>
    </div>
</div>
