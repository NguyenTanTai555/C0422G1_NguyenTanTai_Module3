package model.customer;

public class CustomerType {
    private int customerTypeId;
    private String customerName;

    public CustomerType(int customerTypeId, String customerName) {
        this.customerTypeId = customerTypeId;
        this.customerName = customerName;
    }

    public CustomerType(String customerName) {
        this.customerName = customerName;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
