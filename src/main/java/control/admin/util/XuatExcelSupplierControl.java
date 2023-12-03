package control.admin.util;

import dao.DAO;
import entity.Category;
import entity.Supplier;
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

@WebServlet(name = "XuatExcelSupplierControl", urlPatterns = {"/xuatExcelSupplierControl"})
public class XuatExcelSupplierControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAO dao = new DAO();
        List<Supplier> listAllSupplier = dao.getAllSupplier();
        List<Category> listAllCategory = dao.getAllCategory();

        int maximum = 2147483647;
        int minimum = 1;

        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum = rn.nextInt(range) + minimum;

        FileOutputStream file = new FileOutputStream("D:\\ExcelWebBanNhacCu\\" + "nha-cung-cap-" + Integer.toString(randomNum) + ".xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet workSheet = workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        XSSFCell cell4;
        XSSFCell cell5;

        row = workSheet.createRow(0);
        cell0 = row.createCell(0);
        cell0.setCellValue("ID");
        cell1 = row.createCell(1);
        cell1.setCellValue("Tên nhà cung cấp");
        cell2 = row.createCell(2);
        cell2.setCellValue("Số điện thoại");
        cell3 = row.createCell(3);
        cell3.setCellValue("Email");
        cell4 = row.createCell(4);
        cell4.setCellValue("Địa chỉ");
        cell5 = row.createCell(5);
        cell5.setCellValue("Phân phối cho");

        int i = 0;

        for (Supplier supplier : listAllSupplier) {
            for (Category category : listAllCategory) {
                if (supplier.getCateID() == category.getCid()) {
                    i = i + 1;
                    row = workSheet.createRow(i);
                    cell0 = row.createCell(0);
                    cell0.setCellValue(supplier.getIdSupplier());
                    cell1 = row.createCell(1);
                    cell1.setCellValue(supplier.getNameSupplier());
                    cell2 = row.createCell(2);
                    cell2.setCellValue(supplier.getPhoneSupplier());
                    cell3 = row.createCell(3);
                    cell3.setCellValue(supplier.getEmailSupplier());
                    cell4 = row.createCell(4);
                    cell4.setCellValue(supplier.getAddressSupplier());
                    cell5 = row.createCell(5);
                    cell5.setCellValue(category.getCname());
                }
            }
        }

        workbook.write(file);
        workbook.close();
        file.close();

        request.setAttribute("mess", "Đã xuất file Excel thành công!");
        request.getRequestDispatcher("managerSupplier").forward(request, response);
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