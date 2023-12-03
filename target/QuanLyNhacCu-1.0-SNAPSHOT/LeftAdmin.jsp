<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px">
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
        <a href="admin" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
          <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Trang tổng quan</span>
        </a>
        <a href="doanhThuTheoThu" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-chart-pie fa-fw me-3"></i><span>Doanh thu thứ</span>
        </a>
         <a href="doanhThuTheoThang" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-chart-bar fa-fw me-3"></i><span>Doanh thu tháng</span>
        </a>
        <a href="hoaDon" class="list-group-item list-group-item-action py-2 ripple">
            <i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span>Danh sách hóa Đơn</span></a>
       
         <a href="managerAccount" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-user-circle fa-fw me-3"></i><span>Quản lý tài khoản</span>
        </a>
        <a href="manager" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Quản lý sản phẩm</span>
        </a>
        <a href="top10" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Top 10 sản phẩm</span>
        </a>
        <a href="top5khachhang" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-user-circle fa-fw me-3"></i><span>Top 5 khách hàng</span>
        </a>
        <a href="top5nhanvien" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-user-circle fa-fw me-3"></i><span>Top 5 nhân viên</span>
        </a>
         <a href="managerSupplier" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-parachute-box fa-fw me-3"></i><span>Quản lý cung ứng</span>
        </a>
        <a href="home" class="list-group-item list-group-item-action py-2 ripple">
           <i class="fas fa-home fa-fw me-3"></i><span>Về trang chủ</span>
        </a>  
      </div>
    </div>
  </nav>
  <style>
#sidebarMenu {
  background: linear-gradient(to bottom, #4e54c8, #8f94fb);
  color: #fff;
  font-size: 16px;
  border-radius: 20px;
  overflow: hidden;
  margin-top: 70px;
  margin-bottom: 75px;
  width: 250px;
}

#sidebarMenu a {
  color: #fff;
  text-decoration: none;
  transition: background-color 0.3s;
  display: block;
  padding: 0.75rem 1.25rem;
  background: linear-gradient(to bottom, #800080, #0000FF);
  width: 100%;
  border-radius: 10px;
  margin-bottom: 10px;
}
</style>