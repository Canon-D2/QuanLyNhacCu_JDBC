package control.admin.product;

import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ManagerControl", urlPatterns = {"/manager"})
public class ManagerControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        // Thêm kiểm tra quyền Admin ở đây
        DAO dao = new DAO();
        int id = a.getId();
        int checkIsAdmin = dao.checkAccountAdmin(id);

        if (checkIsAdmin == 0) {
            // Nếu không phải Admin, chuyển hướng về trang login hoặc trang khác tùy ý
            response.sendRedirect("login");
            return;
        }
        
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        
        List<Product> list = dao.getProductByIndex(indexPage);
        List<Category> listC = dao.getAllCategory();
        int allProductBySellID = dao.countAllProduct();
        int endPage = allProductBySellID / 9;
        if (allProductBySellID % 9 != 0) {
            endPage++;
        }

        request.setAttribute("tag", indexPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listCC", listC);
        request.setAttribute("listP", list);
        
         System.out.println("List Product: ");
        for(Product p : list) {
            System.out.println(p.getName());
        }

        request.getRequestDispatcher("QuanLySanPham.jsp").forward(request, response);
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