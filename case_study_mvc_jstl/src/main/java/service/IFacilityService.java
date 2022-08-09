package service;

import model.facility.Facility;
import model.facility.RentType;
import model.facility.ServiceType;

import java.util.List;
import java.util.Map;

public interface IFacilityService {
    Map<String, String> CreateFacility(Facility facility);
    boolean editFacility(Facility facility,int id);
    boolean deleteFacility(int id);
    List<Facility> findAllFacility();
    List<Facility> findByName();
    Facility findById(int id_search);
    List<ServiceType> getServiceTypeList();
    List<RentType> getRentalTypeList();
}
