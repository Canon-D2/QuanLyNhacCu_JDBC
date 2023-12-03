<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn Hàng</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <style>
        .btnOpenDetail {
            background-color: #007BFF; /* Màu xanh dương */
            color: #fff; /* Màu chữ trắng */
            border: none;
            padding: 10px 20px;
            border-radius: 20px; /* Bo tròn */
            cursor: pointer;
        }

        .btnOpenDetail:hover {
            background-color: #0056b3; /* Màu xanh dương đậm khi di chuột qua */
        }
</style>

    <body onload="loadTotalMoney()" style="position: relative">
        
        <jsp:include page="Menu.jsp"></jsp:include>

        <div class="orderDetail" style="height: 100%; width: 100%; position: fixed; top: 4%; display: none; justify-content: center; z-index: 3; ">
            
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
        <div class="shopping-cart" style="margin-top:100px">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
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
                                        <tr>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="p-2 px-3 text-uppercase">Ngày Đặt Hàng</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="p-2 px-3 text-uppercase">Mã Đơn Hàng</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Số Điện Thoại</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Địa Chỉ Giao Hàng</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Tổng Tiền</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Tình Trạng</div>
                                            </th>                                            
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Xem Chi Tiết Đơn Hàng</div>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrders}" var="o">
                                                <tr>
                                                    <td class="align-middle"><strong>${o.ngayXuat}</strong></td>
                                                    <td class="align-middle"><strong>${o.id}</strong></td>
                                                    <td class="align-middle"><strong>${o.phoneNumber}</strong></td>
                                                    <td class="align-middle"><strong>${o.diachi}</strong></td>
                                                    <td class="align-middle"><strong>${o.tongGia}</strong></td>
                                                            <td class="align-middle"><strong>
                                                                <c:if test="${o.tinhTrang == 1}">
                                                                    Đã xử lý
                                                                </c:if>    
                                                                <c:if test="${o.tinhTrang != 1}">
                                                                    Chờ xử lý
                                                                </c:if>
                                                        </strong></td>
                                                        <td class="align-middle"><strong><input id="btn_OpenDetail_id=${o.id}" class="btnOpenDetail" type="button" value="Xem Chi Tiết"></strong></td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
        <c:url var="ServletUrl" value="/UserOrder" />
            $(".btnOpenDetail").click(function(){                
               $(".orderDetail").css({display:'flex'});
                var cardId = $(this).attr("id");
                var orderId = cardId.split('=')[1]; 
                var dataString = "orderId="+orderId+"";
                $.ajax({
                    url: '${ServletUrl}',
                    type: 'GET',
                    data: dataString,
                    success: function(result) {
                        $(".card").html(result);
                    },
                    error: function (error) {
                        console.log(error)
                    }
		})
            });
            $("#closeDetail").click(function(){
                 $(".orderDetail").css({display:'none'});
            });
        </script>
    </body>
</html>
</html>
