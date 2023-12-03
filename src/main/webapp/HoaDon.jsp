<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">
        <title>Hóa đơn</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css">
        <link href="css/HoaDon.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        /* Thêm gradient từ tím đến xanh dương cho bảng */
        table,
        table tr{
            background: linear-gradient(to right, #800080, #0000FF);
            color: white; /* Đảm bảo văn bản hiển thị rõ trên nền gradient */
        }
        table th, table td {
            color: white; /* Màu chữ trắng cho cả tiêu đề và nội dung trong bảng */
            font-size: 18px; /* Kích thước chữ */
            font-weight: bold; /* Độ đậm của chữ */
        }
        .btn-primary {
            background: linear-gradient(to right, #FFFF00, #00FF00) !important; /* Gradient từ vàng sang xanh lá cây */
            border: none; /* Loại bỏ đường viền */
            padding: 10px 20px; /* Điều chỉnh kích thước nút */
            border-radius: 5px; /* Bo tròn góc nút */
            color: #ffffff; /* Màu chữ trắng để tương phản với nền */
        }
        .btnOpenDetail {
            background: linear-gradient(to right, #FFFF00, #00FF00) !important; /* Gradient từ vàng sang xanh lá cây */
            border: none; /* Loại bỏ đường viền */
            padding: 10px 20px; /* Điều chỉnh kích thước nút */
            border-radius: 5px; /* Bo tròn góc nút */
            color: #ffffff; /* Màu chữ trắng để tương phản với nền */
            cursor: pointer; /* Biểu tượng con trỏ khi di chuột qua */
        }
    </style>
    <body>
        <div class="orderDetail" style="height: 100%; width: 100%; position: fixed; left: 8%; display: none; justify-content: center; z-index: 3; ">

            <section class="h-100 gradient-custom" style="z-index: 3">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-lg-20 col-xl-10">
                            <div class="card" style="border-radius: 10px;">
                            </div>
                        </div>
                    </div>
                </div>
                <style>
                    #closeDetail:hover{
                        cursor: pointer;
                    }
                </style>
            </section> 
            <div id="closeDetail" style="height: 100%; width: 100%; position: fixed; background-color: #005121; opacity: 0.2; z-index: 2"></div>
        </div>
        <header>
            <jsp:include page="LeftAdmin.jsp"></jsp:include>
            </header>
            <main>
                <div class="container pt-4">
                    <section class="mb-4">
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
                    <div class="card-order">
                        <div class="card-header py-3 row">
                            <div class="col-sm-6">
                                <h1 class="mb-0 text-left" id="">
                                    <strong>Hóa Đơn</strong>
                                </h1><br>
                                <form id="OrderFilter" action="hoaDon" method="get"> 
                                    <select id="tinhtrangFilter" name="tinhtrangFilter">
                                        <option value="2">Tất cả</option>
                                        <option value="1">Đã xử lý</option>
                                        <option value="0">Chưa xử lý</option>
                                    </select>    
                                    <input type="hidden" name="ngayXuat" id="valueOrderDate" value="">
                                </form> 
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Ngày Đặt Hàng</th>
                                            <th scope="col">Mã Đơn Hàng</th>
                                            <th scope="col">Số Điện Thoại</th>
                                            <th scope="col">Địa Chỉ Giao Hàng</th>
                                            <th scope="col">Tổng Tiền</th>
                                            <th scope="col">Tình Trạng</th>
                                            <th scope="col">Xem Chi Tiết Đơn Hàng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="content">
                                        <c:forEach items="${listOrders}" var="o">
                                            <tr>
                                                <td><strong>${o.ngayXuat}</strong></td>
                                                <td><strong>${o.id}</strong></td>
                                                <td><strong>${o.phoneNumber}</strong></td>
                                                <td><strong>${o.diachi}</strong></td>
                                                <td><strong>${o.tongGia}</strong></td>
                                                <td><strong id="tinhtrang${o.id}">
                                                        <c:if test="${o.tinhTrang == 1}">
                                                            Đã xử lý
                                                        </c:if>    
                                                        <c:if test="${o.tinhTrang != 1}">
                                                            <input id="btn_XuLy_id=${o.id}" class="btnXuLy" type="button" value="Xử Lý Đơn">
                                                        </c:if>
                                                    </strong></td>
                                                <td><strong><input id="btn_OpenDetail_id=${o.id}" class="btnOpenDetail" type="button" value="Xem Chi Tiết"></strong></td>
                                            </tr>                                            
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </div>
                            <div class="col-sm-6">
                                <h5 class="mb-0 text-right" id="">
                                    <form action="xuatExcelControl" method="get">
                                        <input type="date" id="dateHoaDon" name="dateHoaDon" class="form-control mb-0" style="width:30%">
                                        <button type="submit" class="mb-0 text-center btn btn-primary">Xuất file Excel</button> 
                                        <input id="tinhTrangXuatfile" type="hidden" name="tinhTrangXuatfile" value="">
                                    </form> 
                                </h5>
                            </div>
                        </div>
                    </div>
                </section>
                <style>
                    #tinhtrangFilter:hover {
                        cursor: pointer;
                    }
                    option:hover {
                        cursor: pointer;
                    }
                </style>
            </div>
        </main>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script>
            <c:url var="ServletUrl" value="/hoaDon" />

            $("#dateHoaDon").change(function () {
                var txtSearchDate = $("#dateHoaDon").val();
                var tinhTrang = $("#tinhtrangFilter").val();
                var dataString = "ngayXuat=" + txtSearchDate + "&tinhtrangFilter=" + tinhTrang + "";
                $("#valueOrderDate").val(txtSearchDate);
                $('#OrderFilter').submit();
                alert("");
            });
            $(".btnOpenDetail").click(function () {
                $(".orderDetail").css({display: 'flex'});
                var cardId = $(this).attr("id");
                var orderId = cardId.split('=')[1];
                var dataString = "orderId=" + orderId + "";
                 
                $.ajax({
                    url: '${ServletUrl}',
                    type: 'GET',
                    data: dataString,
                    success: function (result) {
                        $(".card").html(result);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });
            $("#closeDetail").click(function () {
                $(".orderDetail").css({display: 'none'});
            });
            $(".btnXuLy").click(function () {
                var cardId = $(this).attr("id");
                var orderId = cardId.split('=')[1];
                var orderIdData = "orderId=" + orderId + "";
                $.ajax({
                    url: '${ServletUrl}',
                    type: 'POST',
                    data: orderIdData,
                    success: function (result) {
                        $("#tinhtrang" + orderId).html("Đã xử lý");
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });
            $('#tinhtrangFilter').val(${tinhtrang}).change();
            $('#tinhTrangXuatfile').val($('#tinhtrangFilter').val());
            $("#valueOrderDate").val('${ngayXuat}');
            $("#dateHoaDon").val('${ngayXuat}');
            $('#tinhtrangFilter').on('change', function () {
                $('#OrderFilter').submit();
            });
        </script>
    </body>
</html>