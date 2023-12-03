<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Đăng nhập</title>
    </head>
<style>
    body {
        background: linear-gradient(to right, #FFD700, #FF0000); /* Gradient từ vàng đến đỏ cho nền body */
    }
    .form-container {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        max-width: 400px; /* Điều chỉnh độ rộng tối đa của form */
        width: 100%;
        border-radius: 20px; /* Bo tròn góc của khung đăng nhập */
        background: white; /* Màu nền của khung đăng nhập */
        padding: 20px; /* Khoảng cách giữa nội dung và mép của khung đăng nhập */
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng cho khung đăng nhập */
    }
    .btn-login, .btn-signup {
        border-radius: 5px; /* Bo tròn góc của nút đăng nhập và nút đăng ký */
        color: white;
    }
    .btn-login {
        background: linear-gradient(to right, #006400, #00FF00); /* Gradient từ xanh lá đậm đến xanh lá nhạtnút login */
        color: white; /* Màu chữ trắng */
    }
    .btn-signup {
        background: linear-gradient(to right, #8A2BE2, #0000FF); /* Gradient từ tím đến xanh dương cho nút đăng ký */
        color: white; /* Màu chữ trắng */
    }
    .btn-primary {
        background: linear-gradient(to right, #8A2BE2, #0000FF); /* Gradient từ tím đến xanh dương cho nút đăng ký */
        color: white; /* Màu chữ trắng */
    }
    .text-white {
        color: #ffffff !important; /* Mã màu trắng */
    }
</style>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div id="logreg-forms" class="form-container">
            <c:if test="${error!=null }">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>
            <c:if test="${mess!=null }">
                <div class="alert alert-success" role="alert">
                    ${mess}
                </div>
            </c:if>
            <form class="form-signin" action="login" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Đăng nhập</h1><br>  
                <input name="user" value="${username }"  type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus=""><br>
            <input name="pass" value="${password }" type="password" id="inputPassword" class="form-control" placeholder="Password" required=""><br>

                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Nhớ tài khoản</label>
                </div>

                <button class="btn btn-success btn-block btn-login text-white" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                <hr>
                <button class="btn btn-primary btn-block btn-signup" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Chưa có tài khoản, tạo mới</button>
            </form>

            <form action="signup" method="post" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Đăng ký</h1><br>
                <input name="user" type="text" id="user-name" class="form-control" placeholder="User name" required="" autofocus=""><br>
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus=""><br>
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus=""><br>
                <input name="email" type="email" id="email" class="form-control" placeholder="Email" required="" autofocus=""><br>
                <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button><br>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Trở về</a>
            </form>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle()
                $('#logreg-forms .form-reset').toggle()
            }
            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle();
                $('#logreg-forms .form-signup').toggle();
            }
            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
            window.addEventListener("load", function loadAmountCart() {
                $.ajax({
                    url: "/QuanLyNhacCu/loadAllAmountCart",
                    type: "get",
                    data: {
                    },
                    success: function (responseData) {
                        document.getElementById("amountCart").innerHTML = responseData;
                    }
                });
            }, false);
        </script>
    </body>
</html>