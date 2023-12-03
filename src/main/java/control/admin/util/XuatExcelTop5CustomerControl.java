package control.admin.util;

import dao.DAO;
import entity.Account;
import entity.TongChiTieuBanHang;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "XuatExcelTop5CustomerControl", urlPatterns = {"/xuatExcelTop5CustomerControl"})
public class XuatExcelTop5CustomerControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAO dao = new DAO();
        List<Account> listAllAccount = dao.getAllAccount();
        List<TongChiTieuBanHang> listTop5KhachHang = dao.getTop5KhachHang();

        int maximum = 2147483647;
        int minimum = 1;

        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum = rn.nextInt(range) + minimum;

        FileOutputStream file = new FileOutputStream("D:\\ExcelWebBanNhacCu\\" + "top-5-khach-hang-" + Integer.toString(randomNum) + ".xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet workSheet = workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;

        row = workSheet.createRow(0);
        cell0 = row.createCell(0);
        cell0.setCellValue("ID");
        cell1 = row.createCell(1);
        cell1.setCellValue("Username");
        cell2 = row.createCell(2);
        cell2.setCellValue("Email");
        cell3 = row.createCell(3);
        cell3.setCellValue("Tổng chi tiêu");

        int i = 0;

        for (TongChiTieuBanHang top5 : listTop5KhachHang) {
            for (Account acc : listAllAccount) {
                if (top5.getUserID() == acc.getId()) {
                    i = i + 1;
                    row = workSheet.createRow(i);
                    cell0 = row.createCell(0);
                    cell0.setCellValue(acc.getId());
                    cell1 = row.createCell(1);
                    cell1.setCellValue(acc.getUser());
                    cell2 = row.createCell(2);
                    cell2.setCellValue(acc.getEmail());
                    cell3 = row.createCell(3);
                    cell3.setCellValue(top5.getTongChiTieu());
                }
            }
        }

        workbook.write(file);
        workbook.close();
        file.close();

        request.setAttribute("mess", "Đã xuất file Excel thành công!");
        request.getRequestDispatcher("top5khachhang").forward(request, response);
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