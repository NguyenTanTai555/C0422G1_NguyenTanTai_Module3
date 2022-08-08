package service;

import model.customer.Customer;
import model.employee.Employee;
import model.facility.Facility;

import java.util.List;

public interface IFuramaService {
    List<Customer> findCustomer();
    boolean editCustomer(int id, Customer customer);
    Boolean deleteCustomer(int id);
    List<Employee> findAllEmployee();
    Customer findCustomerById(int id);
    boolean addCustomer(Customer customer);
    boolean addEmployee(Employee employee);
}
