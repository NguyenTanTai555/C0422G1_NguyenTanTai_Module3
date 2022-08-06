package service.impl;

import model.customer.Customer;
import model.employee.Employee;
import model.facility.House;
import model.facility.Room;
import model.facility.Villa;
import repository.impl.FuramaRepository;
import service.IFuramaService;

import java.util.List;

public class FuramaService implements IFuramaService {
    FuramaRepository furamaRepository = new FuramaRepository();
    @Override
    public List<Customer> findCustomer() {
        return furamaRepository.findCustomer();
    }

    @Override
    public boolean editCustomer(int id, Customer customer) {
        return furamaRepository.editCustomer(id,customer);
    }

    @Override
    public List<Employee> findAllEmployee() {
        return furamaRepository.findAllEmployee();
    }

    @Override
    public Customer findCustomerById(int id) {
        return furamaRepository.findCustomerById(id);
    }

    @Override
    public boolean addCustomer(Customer customer) {
        return furamaRepository.addCustomer(customer);
    }

    @Override
    public boolean addEmployee(Employee employee) {
        return furamaRepository.addEmployee(employee);
    }

    @Override
    public boolean addVilla(Villa villa) {
        return furamaRepository.addVilla(villa);
    }

    @Override
    public boolean addHouse(House house) {
        return false;
    }

    @Override
    public boolean addRoom(Room room) {
        return false;
    }
}
