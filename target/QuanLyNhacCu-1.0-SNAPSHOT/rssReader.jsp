<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tin tức</title>
    <link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="css/rssReader.css" rel="stylesheet" type="text/css"/>
</head>
<style>
    /* Thêm CSS dưới đây */
    .container {
        max-width: 900px; /* Đặt giới hạn chiều rộng của container là 800px, bạn có thể điều chỉnh giá trị này theo mong muốn */
    }
</style>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
<div class="container">
    <h1>Tin tức</h1>
    <div class="list-group">
        <c:forEach var="entry" items="${feed.entries}">
            <a href="${entry.link}" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${entry.title}</h5>
                    <small>${entry.publishedDate}</small>
                </div>
                <p class="mb-1">${entry.description.value}</p>
            </a>
        </c:forEach>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script>
    // Lấy thẻ img trong XML để CSS
    $(document).ready(function(){
        $(".container img").addClass("rss-image");
    });
</script>
</body>
</html>
