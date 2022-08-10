package service;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Employee;

import java.util.List;
import java.util.Map;

public interface IFuramaService {
    List<Customer> findCustomer();
    boolean editCustomer( int id ,Customer customer);
    Boolean deleteCustomer(int id);
    Customer findCustomerById(int id);
    Map<String,String> addCustomer(Customer customer);
    List<CustomerType> findType();
}
