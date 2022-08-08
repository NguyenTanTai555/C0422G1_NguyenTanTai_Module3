package model.facility;

public class Facility {
    private int id;
    private String name;
    private int area;
    private double deposit;
    private int maxPeople;
    private int rentTypeId;
    private int facilityType;
    private String standardRoom;
    private String description;
    private double poolArea;
    private int numberFloor;
    private String facilityFree;

    public Facility(String name, int area, double deposit, int maxPeople, int rentTypeId, int facilityType, String standardRoom, String description, double poolArea, int numberFloor, String facilityFree) {
        this.name = name;
        this.area = area;
        this.deposit = deposit;
        this.maxPeople = maxPeople;
        this.rentTypeId = rentTypeId;
        this.facilityType = facilityType;
        this.standardRoom = standardRoom;
        this.description = description;
        this.poolArea = poolArea;
        this.numberFloor = numberFloor;
        this.facilityFree = facilityFree;
    }

    public Facility(int id, String name, int area, double deposit, int maxPeople, int rentTypeId, int facilityType, String standardRoom, String description, double poolArea, int numberFloor, String facilityFree) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.deposit = deposit;
        this.maxPeople = maxPeople;
        this.rentTypeId = rentTypeId;
        this.facilityType = facilityType;
        this.standardRoom = standardRoom;
        this.description = description;
        this.poolArea = poolArea;
        this.numberFloor = numberFloor;
        this.facilityFree = facilityFree;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public int getFacilityType() {
        return facilityType;
    }

    public void setFacilityType(int facilityType) {
        this.facilityType = facilityType;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberFloor() {
        return numberFloor;
    }

    public void setNumberFloor(int numberFloor) {
        this.numberFloor = numberFloor;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}
