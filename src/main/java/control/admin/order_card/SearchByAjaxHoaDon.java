package control.admin.order_card;

import dao.DAO;
import entity.Account;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchByAjaxHoaDon", urlPatterns = {"/searchAjaxHoaDon"})
public class SearchByAjaxHoaDon extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String s_ngayXuat = request.getParameter("ngayXuat");
        Date ngayXuat = Date.valueOf(s_ngayXuat);
        System.out.println("------------"+ngayXuat);
        DAO dao = new DAO();
        List<Order> listInvoiceByDate = dao.searchByNgayXuat(ngayXuat);
        
        List<Account> listAllAccount = dao.getAllAccount();
        PrintWriter out = response.getWriter();
        double tongGia;
        for (Order o : listInvoiceByDate) {
            for (Account a : listAllAccount) {
                if (o.getAccountID() == a.getId()) {
                    tongGia = Math.round((o.getTongGia()) * 100.0) / 100.0;
                    out.println("<tr>\n" +
"                                                <td><strong>"+o.getNgayXuat()+"</strong></td>\n" +
"                                                <td><strong>"+o.getId()+"</strong></td>\n" +
"                                                <td><strong>"+o.getPhoneNumber()+"</strong></td>\n" +
"                                                <td><strong>"+o.getDiachi()+"</strong></td>\n" +
"                                                <td><strong>"+o.getTongGia()+"</strong></td>\n" +
"                                                <td><strong id='tinhtrang"+o.getId()+"'>\n" +
"                                                    <c:if test='${"+o.getTinhTrang()+" == 1}'>\n" +
"                                                        Đã xử lý\n" +
"                                                    </c:if>    \n" +
"                                                    <c:if test=\'${"+o.getTinhTrang()+" != 1}'\">\n" +
"                                                        <input id=\"btn_XuLy_id="+o.getId()+"\" class=\"btnXuLy\" type=\"button\" value=\"Xử Lý Đơn\">\n" +
"                                                    </c:if>\n" +
"                                                </strong></td>\n" +
"                                                <td><strong><input id=\"btn_OpenDetail_id="+o.getId()+"\" class=\"btnOpenDetail\" type=\"button\" value=\"Xem Chi Tiết\"></strong></td>\n" +
"                                            </tr>   ");
                }
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}