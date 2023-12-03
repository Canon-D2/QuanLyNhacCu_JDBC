<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    #logo {
        width: 100px; 
        height: auto;
    }
    .navbar {
        border-radius: 30px; /* Điều chỉnh giá trị này để bo cong menu theo ý muốn */
        margin-top: 20px; /* Điều chỉnh khoảng cách trên so với đỉnh màn hình */ 
        background: linear-gradient(to right, #8A2BE2, #FF0000, #FFA500);
    }
    .btn-success {
        border-radius: 10px; /* Bo tròn nút giỏ hàng */
        background: linear-gradient(to right, #800080, #0000FF); /* Màu gradient từ xanh lá đến vàng */
        padding: 10px 20px; /* Tăng kích thước nút */
        font-size: 16px; /* Tăng kích thước chữ */
        color: black; /* Màu chữ đen hoặc một màu tương phản */
        border: none; /* Loại bỏ đường viền */
    }
    .btn-success:hover {
        background: linear-gradient(to right, #ADD8E6, #00FF00); /* Màu gradient khi di chuột qua nút */
    }
</style>
<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="position: fixed; top: 0; width:100%;  z-index: 100000;">
    <div class="container">
        <a class="navbar-brand" href="home"> <img src="images/logo.png" alt="SGU Music" id="logo"> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="shop">Sản phẩm</a>
                    </li>                
                <li class="nav-item">
                        <a class="nav-link" href="Contact.html">Liên hệ</a>
                    </li>
                <li class="nav-item">
                        <a class="nav-link" href="rssReader">Tin tức</a>
                    </li> 
                <li class="nav-item">
                        <a class="nav-link" href="Faqs.jsp">Chính sách</a>
                    </li> 
                <li class="nav-item">
                        <a class="nav-link" href="About.jsp">Giới thiệu</a>
                    </li>
                 <li class="nav-item"></li>   
                 
                <!-- MỤC DÀNH CHO NGƯỜI DÙNG-->
                 <c:if test="${sessionScope.acc != null}">
                    <li class=" dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">${sessionScope.acc.user}</a>
                        <ul class="dropdown-menu" style="background-color: #262626; color: white">
                            <c:if test="${sessionScope.acc.isAdmin == '1'}">
                                <li><a style=" color: white"  href="admin">Quản Lý</a></li>
                                <li><a style=" color: white"  href="ChatSocket.jsp">Nhắn tin</a></li>
                            </c:if>   
                            <li><a style=" color: white" href="<c:url value='/UserOrder'/>">Đơn Hàng</a></li>
                            <li><a style=" color: white"  href="EditProfile.jsp">Tài khoản</a></li>
                            <li><a style=" color: white"  href="logout">Đăng xuất</a></li>
                        </ul>
                    </li>
                </c:if>
                    
                <!-- SẼ ẨN 2 MỤC NÀY NẾU ĐÃ ĐĂNG NHẬP-->
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="login">Đăng nhập</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="forgotPassword">Quên mật khẩu</a>
                    </li>
                </c:if>    
            </ul>
            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <a class="btn btn-success btn-sm ml-3" href="managerCart">
                    <i class="fa fa-shopping-cart"></i> <span style="font-size: 14px;">Giỏ hàng</span>
                    <b><span id="amountCart" class="badge badge-light" style="color:black; font-size: 12px;"></span></b>
                </a>
            </form>
        </div>
    </div>
</nav>