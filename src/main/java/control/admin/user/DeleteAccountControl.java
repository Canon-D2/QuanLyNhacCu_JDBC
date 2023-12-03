package control.admin.user;

import dao.DAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteAccountControl", urlPatterns = {"/deleteAccount"})
public class DeleteAccountControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
         DAO dao = new DAO();
        String undelete = request.getParameter("undelete");
        if (undelete != null || "true".equals(undelete)) {
            dao.editTinhTrangUser(1, Integer.parseInt(id));
            request.setAttribute("mess", "Account unlocked!");
            request.getRequestDispatcher("managerAccount").forward(request, response);

            return;
        }

        System.out.println("id: " + id);
       

        dao.deleteCartByAccountID(Integer.parseInt(id));
        dao.deleteProductBySellID(id);
        dao.deleteReviewByAccountID(id);
//        dao.deleteInvoiceByAccountId(id);
//        dao.deleteTongChiTieuBanHangByUserID(id);
        dao.editTinhTrangUser(0, Integer.parseInt(id));

        request.setAttribute("mess", "Account locked!");
        request.getRequestDispatcher("managerAccount").forward(request, response);
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