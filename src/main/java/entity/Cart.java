package entity;

import java.util.List;

public class Cart {

    private int accountID;
    private int productID;
    private int amount;
    private int maCart;
//    private String size;
    
    private List<Product> listProducts;

    public List<Product> getListProducts() {
        return listProducts;
    }

    public void setListProducts(List<Product> listProducts) {
        this.listProducts = listProducts;
    }

    public Cart() {
    }

    public Cart(int accountID, int productID, int amount, int maCart) {
        this.accountID = accountID;
        this.productID = productID;
        this.amount = amount;
        this.maCart = maCart;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getMaCart() {
        return maCart;
    }

    public void setMaCart(int maCart) {
        this.maCart = maCart;
    }

    @Override
    public String toString() {
        return "Cart{" + "accountID=" + accountID + ", productID=" + productID + ", amount=" + amount + ", maCart=" + maCart + '}';
    }
}