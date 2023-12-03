<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>Nhắn tin</title>
    <link href="css/ChatSocket.css" rel="stylesheet" type="text/css"/>
</head>
<style>
    body
    {
        background: linear-gradient(to right, #FFD700, #FF0000); /* Gradient từ vàng đến đỏ cho nền body */
    }
</style>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <!-- KIỂM TRA ĐĂNG NHẬP BẰNG SESSION -->
    <c:if test="${sessionScope.acc != null || sessionScope.acc.isAdmin == 1}">
        <div class="container2 mt-5">
            <h1 class="mb-4">Nhắn tin nội bộ</h1>
            <div class="row">
                <div class="col-md-8">
                    <div id="chat" class="chat border p-3"></div>
                    <div class="input-group mt-3">
                        <input type="text" class="form-control" id="msg" placeholder="Nhập tin nhắn ở đây"/>
                        <button class="btn btn-primary" onclick="return sendMsg();">Gửi</button>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var wsUrl;
            // Kiểm tra giao thức web để mở kết nối server
            if (window.location.protocol == 'http:') {
                wsUrl = 'ws://';
            } else {
                wsUrl = 'wss://';
            }
            var ws = new WebSocket(wsUrl + window.location.host + "/QuanLyNhacCu/chat");

            ws.onmessage = function(event) {
                var messageData = JSON.parse(event.data);
                var mySpan = document.getElementById("chat");
                mySpan.innerHTML += "<strong>" + messageData.sender + ":</strong> " + messageData.message + "<br/>";
            };

            ws.onerror = function(event) {
                console.log("Lỗi ", event)
            }

            function sendMsg() {
                var msg = document.getElementById("msg").value;
                var sender = "<c:out value='${sessionScope.acc.user}' />"; // Lấy tên người gửi từ session

                if (msg) {
                    var messageData = {
                        sender: sender,
                        message: msg
                    };
                    ws.send(JSON.stringify(messageData));
                }
                document.getElementById("msg").value = "";
            }
        </script>
    </c:if>
    <!-- NẾU KHÔNG ĐĂNG NHẬP NGƯỜI NGƯỜI DÙNG LÀ KHÁCH HÀNG THÌ -->    
    <c:if test="${sessionScope.acc == null || sessionScope.acc.isAdmin == 0}">
        <%
            response.sendRedirect("Login.jsp");
        %>
    </c:if>
</body>
</html>
