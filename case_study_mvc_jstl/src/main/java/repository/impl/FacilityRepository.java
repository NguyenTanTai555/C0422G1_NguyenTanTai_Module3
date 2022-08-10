package repository.impl;

import model.facility.Facility;
import model.facility.RentType;
import model.facility.ServiceType;
import repository.IFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String FIND_FACILITY = "CALL findAllService();";
    private final String CREATE_FACILITY = "CALL addNewFacility(?,?,?,?,?,?,?,?,?,?,?);";
    private final String DELETE_FACILITY = "CALL delete_facility(?);";
    private final String EDIT_FACILITY = "CALL edit_facility(?,?,?,?,?,?,?,?,?,?,?,?);";
    private final String SELECT_BY_ID = "SELECT * FROM dich_vu WHERE ma_dich_vu = ?;";
    private final String SELECT_TYPE_FACILITY = "SELECT * FROM loai_dich_vu;";
    private final String SELECT_RENT_TYPE = "SELECT * FROM kieu_thue;";

    @Override
    public void  CreateFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        String standardRoom = facility.getStandardRoom();
        String description = facility.getDescription();
        double poolArea = facility.getPoolArea();
        int numberFloor = facility.getNumberFloor();
        String facilityFree = facility.getFacilityFree();
        if (facility.getFacilityType() == 1){
            facilityFree = null;
        }else if (facility.getFacilityType() == 2){
            facilityFree = null;
            poolArea = 0;
        }else {
            standardRoom = null;
            description = null;
            poolArea = 0;
            numberFloor = 0;
        }
        try {
            CallableStatement callableStatement = connection.prepareCall(CREATE_FACILITY);
            callableStatement.setString(1, facility.getName());
            callableStatement.setInt(2, facility.getArea());
            callableStatement.setDouble(3, facility.getDeposit());
            callableStatement.setInt(4, facility.getMaxPeople());
            callableStatement.setInt(5, facility.getRentTypeId());
            callableStatement.setInt(6, facility.getFacilityType());
            callableStatement.setString(7, standardRoom);
            callableStatement.setString(8, description);
            callableStatement.setDouble(9, poolArea);
            callableStatement.setInt(10, numberFloor);
            callableStatement.setString(11, facilityFree);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void editFacility(Facility facility, int id) {
        Connection connection = BaseRepository.getConnectDB();
        String standardRoom = facility.getStandardRoom();
        String description = facility.getDescription();
        double poolArea = facility.getPoolArea();
        int numberFloor = facility.getNumberFloor();
        String facilityFree = facility.getFacilityFree();
        if (facility.getFacilityType() == 1){
            facilityFree = null;
        }else if (facility.getFacilityType() == 2){
            facilityFree = null;
            poolArea = 0;
        }else {
            standardRoom = null;
            description = null;
            poolArea = 0;
            numberFloor = 0;
        }
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_FACILITY);
            callableStatement.setInt(1, facility.getId());
            callableStatement.setString(2, facility.getName());
            callableStatement.setInt(3, facility.getArea());
            callableStatement.setDouble(4, facility.getDeposit());
            callableStatement.setInt(5, facility.getMaxPeople());
            callableStatement.setInt(6, facility.getRentTypeId());
            callableStatement.setInt(7, facility.getFacilityType());
            callableStatement.setString(8, standardRoom);
            callableStatement.setString(9, description);
            callableStatement.setDouble(10, poolArea);
            callableStatement.setInt(11, numberFloor);
            callableStatement.setString(12, facilityFree);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteFacility(int id) {
        int check;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_FACILITY);
            callableStatement.setInt(1, id);
            check = callableStatement.executeUpdate();
            return check > 0? true: false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Facility> findAllFacility() {
        List<Facility> facilities = new ArrayList<>();
        Facility facility ;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement =connection.prepareCall(FIND_FACILITY);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("ma_dich_vu");
                String name = resultSet.getString("ten_dich_vu");
                int area = resultSet.getInt("dien_tich");
                double deposit = resultSet.getDouble("chi_phi_thue");
                int maxPeople = resultSet.getInt("so_nguoi_toi_da");
                int rentType = resultSet.getInt("ma_kieu_thue");
                int facilityType = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String description = resultSet.getString("mo_ta_ten_tien_nghi_khac");
                double poolArea =  resultSet.getDouble("dien_tich_ho_boi");
                int numberFloor = resultSet.getInt("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                facility = new Facility(id,name,area,deposit,maxPeople,rentType,facilityType,standardRoom,description,poolArea,numberFloor,facilityFree);
                facilities.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilities;
    }

    @Override
    public List<Facility> findByName() {
        return null;
    }

    @Override
    public Facility findById(int id_search) {
        Connection connection = BaseRepository.getConnectDB();
        Facility facility = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id_search);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("ma_dich_vu");
                String name = resultSet.getString("ten_dich_vu");
                int area = resultSet.getInt("dien_tich");
                double deposit = resultSet.getInt("chi_phi_thue");
                int maxPeople = resultSet.getInt("so_nguoi_toi_da");
                int rentType = resultSet.getInt("ma_kieu_thue");
                int facilityType = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String description = resultSet.getString("mo_ta_ten_tien_nghi_khac");
                double poolArea = resultSet.getInt("dien_tich_ho_boi");
                int numberFloor = resultSet.getInt("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                facility = new Facility(id, name, area, deposit, maxPeople, rentType, facilityType, standardRoom, description, poolArea, numberFloor, facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public List<ServiceType> getServiceTypeList() {
        List<ServiceType> typeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement pr = connection.prepareStatement(SELECT_TYPE_FACILITY);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                int id = rs.getInt("ma_loai_dich_vu");
                String name = rs.getString("ten_loai_dich_vu");
                typeList.add(new ServiceType(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeList;
    }

    @Override
    public List<RentType> getRentalTypeList() {
        List<RentType> rentTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement pr = connection.prepareStatement(SELECT_RENT_TYPE);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                int id = rs.getInt("ma_kieu_thue");
                String name = rs.getString("ten_kieu_thue");
                rentTypes.add(new RentType(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypes;
        }
}
