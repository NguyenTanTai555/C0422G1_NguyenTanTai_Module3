package repository;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Employee;
import model.facility.Facility;

import java.util.List;

public interface IFuramaRepository {
    List<Customer> findCustomer();
    boolean editCustomer(int id, Customer customer);
    Boolean deleteCustomer(int id);
    List<Employee> findAllEmployee();
    Customer findCustomerById(int id);
    void addCustomer(Customer customer);
    boolean addEmployee(Employee employee);
    boolean addNewFacility(Facility facility);
    List<CustomerType> findType();
}
