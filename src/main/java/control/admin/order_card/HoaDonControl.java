package control.admin.order_card;

import dao.DAO;
import dao.OrderDAO;
import entity.Account;
import entity.Order;
import entity.Product;
import entity.orderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "HoaDonControl", urlPatterns = {"/hoaDon"})
public class HoaDonControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        int uID;
        DAO dao = new DAO();
        if(a == null) {
        	response.sendRedirect("login");
        	return;
        }
        uID= a.getId();
 	   int checkIsAdmin = dao.checkAccountAdmin(uID);
        if(checkIsAdmin == 0)
        {
                 response.sendRedirect("login");
                 return;
        }
       
        String s_orderId = request.getParameter("orderId");
        if(s_orderId==null || s_orderId.isEmpty() ) {            
             int accountID = a.getId();        
             OrderDAO oderDao = new OrderDAO();
             String s_tinhtrang = request.getParameter("tinhtrangFilter");
             List<Order> listOrders = null;
             int tinhtrang=2;
             if(s_tinhtrang == null || s_tinhtrang.equals("")) 
                 s_tinhtrang="2";
             tinhtrang=Integer.parseInt(s_tinhtrang);
             String s_ngayXuat = request.getParameter("ngayXuat");
             if(s_ngayXuat == null || "".equals(s_ngayXuat))
                 listOrders = dao.getAllOrder(tinhtrang);
             else {
                 Date ngayXuat = Date.valueOf(s_ngayXuat);
                 listOrders = dao.searchByNgayXuat_tinhTrang(ngayXuat, tinhtrang);
             }
             
             
             request.setAttribute("listOrders", listOrders);
             request.setAttribute("tinhtrang", tinhtrang);
             request.setAttribute("ngayXuat", s_ngayXuat);
             request.getRequestDispatcher("HoaDon.jsp").forward(request, response);
        } else {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            int orderId = Integer.parseInt(s_orderId);
            OrderDAO oderDao = new OrderDAO();
            Order order = oderDao.getOrderById(orderId); 
            order.setListOrderDetail(oderDao.getOrderDetail(orderId));
            List<Product> listProduct = new ArrayList<>();
            PrintWriter out = response.getWriter();   
            Product product = new Product();
            Account user = (Account) session.getAttribute("acc");
            out.print("<div class=\"card-header px-4 py-3\">\n" +
"                          <h5 class=\"text-muted mb-0\">Thanks for your Order, <span style=\"color: #a8729a;\">"+user.getUser()+"</span>!</h5>\n" +
"                        </div>\n" +
"                        <div class=\"card-body px-4 py-2 \">\n" +
"                          <div class=\"d-flex justify-content-between align-items-center mb-4\">\n" +
"                            <p class=\"lead fw-normal mb-0\" style=\"color: #a8729a;\">Receipt</p>\n" +
"                            <p class=\"small text-muted mb-0\">Receipt Voucher : 1KAU9-84UIL</p>\n" +
"                          </div>\n" +
"                                \n" +
"                            \n" +
"                            <!-- SanPham-->\n" +
"                            <div class =\"ListCard\" style=\"width: 100%; max-height: 290px; overflow: auto\">");
            for(orderDetail oderDetail: order.getListOrderDetail()) {
                product = dao.getProductByID(oderDetail.getProductId()+"");
                
                out.print("<div class=\"card shadow-0 border mb-1\" >\n" +
"                                    <div class=\"card-body\">\n" +
"                                      <div class=\"row\">\n" +
"                                        <div class=\"col-md-2\">\n" +
"                                          <img src=\""+product.getImage()+"\"\n" +
"                                            class=\"img-fluid\" alt=\"Phone\">\n" +
"                                        </div>\n" +
"                                        <div class=\"col-md-2 text-center d-flex justify-content-center align-items-center\">\n" +
"                                          <p class=\"text-muted mb-0\">"+product.getName()+"</p>\n" +
"                                        </div>\n" +
"                                        <div class=\"col-md-2 text-center d-flex justify-content-center align-items-center\">\n" +
"                                          <p class=\"text-muted mb-0 small\">"+product.getColor()+"</p>\n" +
"                                        </div>\n" +
"                                        <div class=\"col-md-2 text-center d-flex justify-content-center align-items-center\">\n" +
"                                          <p class=\"text-muted mb-0 small\">$"+product.getPrice()+"</p>\n" +
"                                        </div>\n" +
"                                        <div class=\"col-md-2 text-center d-flex justify-content-center align-items-center\">\n" +
"                                          <p class=\"text-muted mb-0 small\">Qty: "+ oderDetail.getAmount() +"</p>\n" +
"                                        </div>\n" +
"                                        <div class=\"col-md-2 text-center d-flex justify-content-center align-items-center\">\n" +
"                                          <p class=\"text-muted mb-0 small\">$"+product.getPrice()*oderDetail.getAmount()+"</p>\n" +
"                                        </div>\n" +
"                                      </div>\n" +
"                                      <hr class=\"mb-0\" style=\"background-color: #e0e0e0; opacity: 1;\">\n" +
"                                    </div>\n" +
"                                </div>");
            }
            String tinhtrang = "Chờ xử lý";
            if(order.getTinhTrang() == 1) 
                tinhtrang = "Đã giao hàng";
            out.print("</div>\n" +
"\n" +
"                          <div class=\"d-flex justify-content-between pt-2\">\n" +
"                            <p class=\"fw-bold mb-0\">Order Details</p>\n" +
"                            <p class=\"text-muted mb-0\"><span class=\"fw-bold me-4\">Total</span> $"+(order.getTongGia()/(1+0.1)) +"</p>\n" +
"                          </div>\n" +
"\n" +
"                          <div class=\"d-flex justify-content-between pt-2\">\n" +
"                            <p class=\"text-muted mb-0\">Invoice Number : "+order.getId()+"</p>\n" +

"                          </div>\n" +
"\n" +
"                          <div class=\"d-flex justify-content-between\">\n" +
"                            <p class=\"text-muted mb-0\">Invoice Date : "+order.getNgayXuat()+"</p>\n" +
"                            <p class=\"text-muted mb-0\"><span class=\"fw-bold me-4\">Vat 10%</span></p>\n" +
"                          </div>\n" +
"\n" +
"                          <div class=\"d-flex justify-content-between\">\n" +
"                            <p class=\"text-muted mb-0\">Address: "+order.getDiachi()+"</p>\n" +
"                            <p class=\"text-muted mb-0\"><span class=\"fw-bold me-4\">"+tinhtrang+"</span></p>\n" +
"                          </div>\n" +
"                        </div>\n" +
"                        <div class=\"card-footer border-0 px-4 py-3\"\n" +
"                          style=\"background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;\">\n" +
"                          <h5 class=\"d-flex align-items-center justify-content-end text-white text-uppercase mb-0\">Total\n" +
"                            paid: <span class=\"h2 mb-0 ms-2\">$"+order.getTongGia()+"</span></h5>\n" +
"                        </div>");
            
            
        }             
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDao = new OrderDAO();
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        orderDao.xulyOrder(orderId);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}