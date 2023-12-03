ĐỒ ÁN GIỮA KÌ CHUYÊN ĐỀ J2EE CHỦ ĐỀ
WEBSITE THƯƠNG MẠI NHẠC CỤ SGU-Music (Java Servlet + 3-Layer)

GIAO DIỆN GRADIENT FIGMA:
https://www.figma.com/file/6eXutbsNqT9VYfOywzks9q/Web-Design-%7C-Website-Design-%7C-Software-House-Website-%7C-Software-Company-Website-(Community)?type=design&node-id=1-377&mode=design&t=eQNPrP2jdoGJegXc-0

YÊU CẦU MÁY TÍNH PHẢI CÀI ĐẶT:

+ XAMPP (Có sẵn MYSQL, TOMCAT)
+ NETBEAN IDE 19
+ JDK 1.8
+ TOMCAT v9.0


HƯỚNG DẪN CHẠY CHƯƠNG TRÌNH:

+ Import file quanlynhaccu.sql vào PHPMYADMIN trên XAMPP
+ Thêm JDK 1.8 vào biến môi trường trên Windows
+ Thiết lập Project chạy bằng JDK1.8 VÀ JAVA EE 7 Web
+ Thêm server TOMCAT từ thư mục XAMPP (tài khoản: admin, mật khẩu: admin)
+ Chuột phải vào project ấn run

TỔNG QUAN USER:

+ Đăng nhập, đăng ký, phân quyền
+ Xem sản phẩm, chi tiết sản phẩm, đánh giá từng sản phẩm
+ Cho sản phẩm vào giỏ hàng, thanh toán
+ Xem danh sách, chi tiết từng sản phẩm trong hóa đơn đã mua
+ Gửi mail xác nhận đặt hàng thành công + mail cấp lại mật khẩu
+ Xử lý bất đồng bộ khi tìm kiếm theo màu sắc, tên,...
+ Tích hợp API ChatGPT 3.5 làm trang liên hệ CSKH
+ Nhắn tin nội bộ Admin bằng WebSocket (Local)
+ Đọc báo trực tuyến RSS từ VN Express

TỔNG QUAN ADMIN:

+ Trang tổng quan
+ CRUD tài khoản, sản phẩm, hóa đơn,...
+ Thống kê theo biểu đồ cột, tròn
+ Xuất file dữ liệu ra Excel
+ Xác nhận đã xử lý cho từng hóa đơn
+ Top 10 sản phẩm bán chạy, top 5 nhân viên xuất sắc, top 10 khách hàng tiềm năng

LƯU Ý:

+ Get API ChatGPT mới vào Contact.html 
+ Mật khẩu Email 2 lớp vào ForgotPassword.java, OrderControl.java
+ Project có thể không tương thích Eclipse hoặc IntelliJ IDEA
+ Phiên bản JDK và Tomcat cũ hoặc mới quá có thể dẫn đến lỗi mvn