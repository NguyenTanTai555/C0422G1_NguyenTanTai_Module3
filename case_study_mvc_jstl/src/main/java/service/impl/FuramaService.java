package service.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Employee;
import repository.impl.FuramaRepository;
import service.IFuramaService;
import unit.VnCharacterUnit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FuramaService implements IFuramaService {
    FuramaRepository furamaRepository = new FuramaRepository();
    private final String REGEX_NAME = "([A-Z][a-z]+\\s?)+";
    private final String PHONE_NUMBER_REGEX = "^((090)|(091)|(\\(84\\)\\+90)|(\\(84\\)\\+91))(([0-9]){7})$";
    private final String ID_CARD_REGEX = "^[0-9]{9,12}$";
    private final String EMAIL_REGEX = "^[a-z]+[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    @Override
    public List<Customer> findCustomer() {
        return furamaRepository.findCustomer();
    }

    @Override
    public boolean editCustomer(int id,Customer customer) {
        return furamaRepository.editCustomer(id,customer);
    }


    @Override
    public Boolean deleteCustomer(int id) {
        return furamaRepository.deleteCustomer(id);
    }


    @Override
    public Customer findCustomerById(int id) {
        return furamaRepository.findCustomerById(id);
    }

    @Override
    public Map<String,String> addCustomer(Customer customer) {
           Map<String,String> mapError = new HashMap<>();
           if (!customer.getName().isEmpty()){
//               String name = VnCharacterUnit.removeAccent(customer.getName());
               if (!customer.getName().matches(REGEX_NAME)){
                   mapError.put("regexName","Please Enter right format!!!!");
               }
           } else {
               mapError.put("regexName","Please input name");
           }
           if (!customer.getPhoneNumber().isEmpty()){
               if (!customer.getPhoneNumber().matches(PHONE_NUMBER_REGEX)){
                   mapError.put("regexPhone","Please Enter right format !!!");
               }
           } else {
               mapError.put("regexPhone","Please input phone number");
           }
           if (!customer.getIdCard().isEmpty()){
               if (!customer.getIdCard().matches(ID_CARD_REGEX)) {

                   mapError.put("regexCard","Please Enter right format !!");
               }
           } else {
               mapError.put("regexCard","Please input ID Card");
           }
           if (!customer.getEmail().isEmpty()){
               if (!customer.getEmail().matches(EMAIL_REGEX)){
                   mapError.put("regexEmail","Please Enter right format !!");
               }
           } else {
               mapError.put("regexEmail","Please input Email !");
           }
           if (customer.getDateOfBirth()== null ){
               mapError.put("regexBirthday" ,"Please input birthday !!");
           }
           if (mapError.size() == 0 ){
               this.furamaRepository.addCustomer(customer);
           }
           return mapError;
    }

    @Override
    public List<CustomerType> findType() {
        return furamaRepository.findType();
    }
}
