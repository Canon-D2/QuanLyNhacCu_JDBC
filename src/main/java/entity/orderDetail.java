package entity;

public class orderDetail {
    private int productId;
    private int orderId;
    private int amount;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public orderDetail(int productId, int orderId, int amount) {
        this.productId = productId;
        this.orderId = orderId;
        this.amount = amount;
    }

    public orderDetail() {
    }
}