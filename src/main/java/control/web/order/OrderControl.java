package control.web.order;

import dao.DAO;
import dao.OrderDAO;
import entity.Account;
import entity.Cart;
import entity.Email;
import entity.EmailUtils;
import entity.Order;
import entity.Product;
import entity.SoLuongDaBan;
import entity.orderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();
        DAO dao = new DAO();
        PrintWriter out = response.getWriter();   
        List<Cart> listProductCart = dao.getCartByAccountID(accountID);
        if(listProductCart.isEmpty()) {
            request.setAttribute("error", "Thất Bại! Giỏ hàng của bạn không có sản phẩm!");
            out.print("<script>alert('Thất bại! không có sản phẩm trong giỏ hàng') </script>");
            response.sendRedirect("ManagerCartControl");
            return;
        } 
        List<Cart> list = dao.getCartByAccountID(accountID);
        request.getRequestDispatcher("DatHang.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String emailAddress = request.getParameter("email");
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String deliveryAddress = request.getParameter("deliveryAddress");

            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            if (a == null) {
                response.sendRedirect("login");
                return;
            }
            int accountID = a.getId();
            DAO dao = new DAO();
            List<Cart> listProductCart = dao.getCartByAccountID(accountID);
            if(listProductCart.isEmpty()) {
                request.setAttribute("error", "Thất Bại! Giỏ hàng của bạn không có sản phẩm!");
            } else {
                String mess= "";
                List<orderDetail> ListorderDetail = new ArrayList<>();
                double totalMoney = 0;                
                Product product = new Product();
                System.out.println("List GH: ");
                mess=mess+"List GH: /n";
                for (Cart c : listProductCart) {
                    mess=mess+" "+c.getAccountID() + "-" + c.getProductID() + "-" + c.getAmount();
                    orderDetail orderDetail = new orderDetail();
                    orderDetail.setProductId(c.getProductID());
                    orderDetail.setAmount(c.getAmount());
                    ListorderDetail.add(orderDetail);
                    
                    product = dao.getProductByID(c.getProductID()+"");
                    SoLuongDaBan s = dao.checkSoLuongDaBanExist(product.getId());
                    if (s == null) {
                        dao.insertSoLuongDaBan(product.getId(), orderDetail.getAmount());
                    } else {
                        dao.editSoLuongDaBan(product.getId(), orderDetail.getAmount());
                    }
                    
                    totalMoney = totalMoney + (product.getPrice() * c.getAmount());
                }
                double totalMoneyVAT = totalMoney + totalMoney * 0.1;
                OrderDAO oderDao = new OrderDAO();
                Order order = new Order();
                order.setDiachi(name);
                order.setEmail(emailAddress);
                order.setPhoneNumber(phoneNumber);
                order.setDiachi(deliveryAddress);
                order.setAccountID(accountID);
                order.setListOrderDetail(ListorderDetail);
                order.setTongGia(totalMoneyVAT);
                //Lưu đơn hàng vào CSDL
                oderDao.save(order);
                request.setAttribute("mess", mess);
                // Xóa giỏ hàng cũ đi
                dao.deleteCartByAccountID(accountID);
                response.sendRedirect(request.getContextPath() +"/UserOrder");
                
            //Gửi Mail xác nhận cho khách hàng
            List<Cart> list = dao.getCartByAccountID(accountID);
            List<Product> list2 = dao.getAllProduct();
            
            Email email = new Email();
            email.setFrom("example@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
            email.setFromPassword("abcd xyzt abcd xyzt"); //mat khau ung dung 2 lop
            email.setTo(emailAddress);
            email.setSubject("Đặt hàng thành công từ SGU Music");
            StringBuilder sb = new StringBuilder();
            sb.append("Kính gửi: ").append(name).append("<br>");
            sb.append("Bạn vừa đặt hàng từ SGU Music. <br> ");
            sb.append("Địa chỉ nhận hàng của bạn là: <b>").append(deliveryAddress).append(" </b> <br>");
            sb.append("SĐT khi nhận hàng của bạn là: <b>").append(phoneNumber).append(" </b> <br>");
            sb.append("Danh sách sản phẩm đã đặt: <br>");
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProductID() == p.getId()) {
                        sb.append(p.getName()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Amount:").append(c.getAmount()).append(" | ").append("<br>");
                    }
                }
            }
            sb.append("Tổng tiền: ").append(String.format("%.02f", totalMoneyVAT)).append("$").append("<br>");
            sb.append("Rất cảm ơn sự ủng hộ của bạn<br>");
            sb.append("Administrator");

            email.setContent(sb.toString());
                try {
                    EmailUtils.send(email);
                    //request.setAttribute("mess", "Dat hang thanh cong!");
                } catch (Exception ex) {
                    Logger.getLogger(OrderControl.class.getName()).log(Level.SEVERE, null, ex);
                    //request.setAttribute("error", "Dat hang that bai!");
                }
                return;
            }
        request.getRequestDispatcher("DatHang.jsp").forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
