package dao;

import context.DBContext;
import entity.Order;
import entity.orderDetail;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO extends DAO{
    
    
    public void save(Order order) {
        //Save order
        String sql = "INSERT INTO quanlynhaccu.order(accountID,tongGia,diachi,email,phoneNumber,ngayXuat)VALUES(?,?,?,?,?,?)";
        try {
            System.out.println(order.toString() );
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql, ps.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getAccountID());
            ps.setDouble(2, order.getTongGia());
            ps.setString(3, order.getDiachi());
            ps.setString(4, order.getEmail());
            ps.setString(5, order.getPhoneNumber());
            ps.setDate(6, super.getCurrentDate());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if(rs.next()) {
                order.setId(rs.getInt(1));
            }
            
            //Save orderDetail
            sql = "INSERT INTO orderdetail (productId, orderId, amount) VALUES (?,?,?)";  
            for(orderDetail orderDetail : order.getListOrderDetail() ) {
                
                System.out.println(orderDetail.getOrderId());
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, orderDetail.getProductId());
                    ps.setInt(2, order.getId());
                    ps.setInt(3, orderDetail.getAmount());
                    ps.executeUpdate();                 
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    
    public List<Order> getOrderByUserId(int userId) {
        try {
            String sql = "select * from quanlynhaccu.order where accountID=? ORDER BY id DESC";
            List<Order> list = new ArrayList<>();
            
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),                        
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getInt(8)
                ));
            }
            return list;  
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }   
           
    }
    
    public List<orderDetail> getOrderDetail(int orderId) {
        try {
            String sql = "select * from quanlynhaccu.orderdetail where orderId=?";
            List<orderDetail> listOderDeatail = new ArrayList<>();
            
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOderDeatail.add(new orderDetail(rs.getInt(1),
                        rs.getInt(2),                        
                        rs.getInt(3)                        
                ));
            }
            return listOderDeatail;  
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }   
           
    }
    
    public Order getOrderById(int orderId) {
        try {
            String sql = "select * from quanlynhaccu.order where id=?";
            Order order = null;          
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1),
                        rs.getInt(2),                        
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getInt(8)
                );
            }
            
            return order;  
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }   
           
    }
    
    public void xulyOrder(int orderId) {
        try {
            String sql = "UPDATE quanlynhaccu.order SET tinhTrang = 1 WHERE id = "+orderId;
            Order order = null;          
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   
           
    }
}