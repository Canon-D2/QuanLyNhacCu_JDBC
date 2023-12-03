package entity;

import java.util.Date;
import java.util.List;

public class Order {

    private int id;
    private int accountID;
    private double tongGia;
    private String diachi;
     private String email;
    private String phoneNumber;   
    Date ngayXuat;
    private int tinhTrang;
    private List<orderDetail> listOrderDetail;

    public Order(int aInt, int aInt0, double aDouble, java.sql.Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Order(int id, int accountID, double tongGia, String diachi, String email, String phoneNumber, Date ngayXuat, int tinhTrang) {
        this.id = id;
        this.accountID = accountID;
        this.tongGia = tongGia;
        this.diachi = diachi;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.ngayXuat = ngayXuat;
        this.tinhTrang = tinhTrang;
    }

    public int getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(int tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    
    
    
    public List<orderDetail> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setListOrderDetail(List<orderDetail> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public double getTongGia() {
        return tongGia;
    }

    public void setTongGia(double tongGia) {
        this.tongGia = tongGia;
    }

    public Date getNgayXuat() {
        return ngayXuat;
    }

    public void setNgayXuat(Date ngayXuat) {
        this.ngayXuat = ngayXuat;
    }

    @Override
    public String toString() {
        return "Order{" + "accountID=" + accountID + ", tongGia=" + tongGia + ", diachi=" + diachi + ", email=" + email + ", phoneNumber=" + phoneNumber + ", ngayXuat=" + ngayXuat + '}';
    }
}