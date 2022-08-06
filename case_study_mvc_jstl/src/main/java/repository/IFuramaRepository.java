package repository;

import model.customer.Customer;
import model.employee.Employee;
import model.facility.House;
import model.facility.Room;
import model.facility.Villa;

import java.util.List;

public interface IFuramaRepository {
    List<Customer> findCustomer();
    boolean editCustomer(int id, Customer customer);
    List<Employee> findAllEmployee();
    Customer findCustomerById(int id);
    boolean addCustomer(Customer customer);
    boolean addEmployee(Employee employee);
    boolean addVilla(Villa villa);
    boolean addHouse(House house);
    boolean addRoom(Room room);

}
