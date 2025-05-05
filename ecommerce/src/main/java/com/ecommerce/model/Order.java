package com.ecommerce.model;

public class Order {
    private int id;
    private String customer;
    private String product;
    private String status;

    public Order(int id, String customer, String product, String status) {
        this.id = id;
        this.customer = customer;
        this.product = product;
        this.status = status;
    }

    public int getId() { return id; }
    public String getCustomer() { return customer; }
    public String getProduct() { return product; }
    public String getStatus() { return status; }
}

