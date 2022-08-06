package model.contract;

import model.employee.Employee;

import java.time.LocalDate;

public class Contract {
    private int id ;
    private String starDay;
    private String endDay;
    private double deposit ;
    private int employeeId;
    private int customerId;
    private int facilityId;

    public Contract(String starDay, String endDay, double deposit, int employeeId, int customerId, int facilityId) {
        this.starDay = starDay;
        this.endDay = endDay;
        this.deposit = deposit;
        this.employeeId = employeeId;
        this.customerId = customerId;
        this.facilityId = facilityId;
    }

    public Contract(int id, String starDay, String endDay, double deposit, int employeeId, int customerId, int facilityId) {
        this.id = id;
        this.starDay = starDay;
        this.endDay = endDay;
        this.deposit = deposit;
        this.employeeId = employeeId;
        this.customerId = customerId;
        this.facilityId = facilityId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStarDay() {
        return starDay;
    }

    public void setStarDay(String starDay) {
        this.starDay = starDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getFacilityId() {
        return facilityId;
    }

    public void setFacilityId(int facilityId) {
        this.facilityId = facilityId;
    }
}
