package repository.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Employee;
import model.facility.Facility;
import repository.IFuramaRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FuramaRepository implements IFuramaRepository {
    private final String SELECT_CUSTOMER = "CALL findAllCustomer();";
    private final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang where ma_khach_hang = ? ";
    private final String DELETE_CUSTOMER = "CALL delete_customer(?)";
    private final String ADD_NEW_CUSTOMER = "CALL insert_new_customer(?, ?, ?, ?, ?, ?, ?, ?);";
    private final String EDIT_CUSTOMER = "CALL edit_customer(?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private final String SELECT_CUSTOMER_TYPE = "SELECT * FROM loai_khach;";
    @Override
    public List<Customer> findCustomer() {
        List<Customer> list = new ArrayList<>();
        Customer customer;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_CUSTOMER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id  = resultSet.getInt("ma_khach_hang");
                int typeId =resultSet.getInt("ma_loai_khach");
                String name = resultSet.getString("ho_ten");
                String date = resultSet.getString("ngay_sinh");
                int gender = resultSet.getInt("gioi_tinh");
                String idCard = resultSet.getString("so_cmnd");
                String phoneNumber = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String address = resultSet.getString("dia_chi");
                customer = new Customer(id,typeId,name,date,gender,idCard,phoneNumber,email,address);
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean editCustomer(int id,Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        int check;
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_CUSTOMER);
            callableStatement.setInt(1, id);
            callableStatement.setInt(2, customer.getCustomerTypeId());
            callableStatement.setString(3, customer.getName());
            callableStatement.setString(4, customer.getDateOfBirth());
            callableStatement.setInt(5, customer.getGender());
            callableStatement.setString(6, customer.getIdCard());
            callableStatement.setString(7, customer.getPhoneNumber());
            callableStatement.setString(8, customer.getEmail());
            callableStatement.setString(9, customer.getAddress());
            check = callableStatement.executeUpdate();
            return check > 0? true: false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        int check ;
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1,id);
            check = callableStatement.executeUpdate();
            return check>0? true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> findAllEmployee() {
        return null;
    }

    @Override
    public Customer findCustomerById(int id) {
        Customer customer = null ;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_CUSTOMER_BY_ID);
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int typeId = resultSet.getInt("ma_loai_khach");
                String name = resultSet.getString("ho_ten");
                String date = resultSet.getString("ngay_sinh");
                int gender = resultSet.getInt("gioi_tinh");
                String idCard = resultSet.getString("so_cmnd");
                String phoneNumber = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String address = resultSet.getString("dia_chi");
                customer = new Customer(id, typeId, name, date, gender, idCard, phoneNumber, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_CUSTOMER);
            callableStatement.setInt(1, customer.getCustomerTypeId());
            callableStatement.setString(2, customer.getName());
            callableStatement.setString(3, customer.getDateOfBirth());
            callableStatement.setInt(4, customer.getGender());
            callableStatement.setString(5, customer.getIdCard());
            callableStatement.setString(6, customer.getPhoneNumber());
            callableStatement.setString(7, customer.getEmail());
            callableStatement.setString(8, customer.getAddress());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean addEmployee(Employee employee) {
        return false;
    }



    @Override
    public boolean addNewFacility(Facility facility) {
        return false;
    }

    @Override
    public List<CustomerType> findType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        CustomerType customerType ;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int typeId = resultSet.getInt("ma_loai_khach");
                String nameType = resultSet.getString("ten_loai_khach");
                customerType = new CustomerType(typeId,nameType);
                customerTypes.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypes;
    }

}
