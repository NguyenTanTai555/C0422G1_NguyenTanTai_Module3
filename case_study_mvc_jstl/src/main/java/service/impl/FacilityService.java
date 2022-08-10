package service.impl;

import model.facility.Facility;
import model.facility.RentType;
import model.facility.ServiceType;
import repository.impl.FacilityRepository;
import service.IFacilityService;
import unit.VnCharacterUnit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityService implements IFacilityService {
    FacilityRepository facilityRepository = new FacilityRepository();
    private final String REGEX_NAME_FACILITY = "([A-Z][a-z]+\\s?)+[0-9]*";
    @Override
    public Map<String, String> CreateFacility(Facility facility) {
        Map<String, String> mapErrors = new HashMap<>();

        if (!facility.getName().isEmpty()
                || facility.getNumberFloor() != 0
                || facility.getDeposit() != 0)
        {
            String name = VnCharacterUnit.removeAccent(facility.getName());
            if (!name.matches(REGEX_NAME_FACILITY)){
                mapErrors.put("name", "Please input right format!");
            }
        } else {
            mapErrors.put("name", "Please input name!");
        }
        int numberFloor = facility.getNumberFloor();
        if (numberFloor < 0){
            mapErrors.put("floor","Please input number floor > 0");
        } else {
            mapErrors.put("floor","");
        }
        double deposit = facility.getDeposit();
        if (deposit < 0){
            mapErrors.put("deposit","Please Enter deposit > 0");
        } else {
            mapErrors.put("deposit","Insert success");
        }
        if (mapErrors.size() == 0) {
            facilityRepository.CreateFacility(facility);
        }
        return mapErrors;
    }

    @Override
    public Map<String, String> editFacility(Facility facility, int id) {
        Map<String,String> mapError = new HashMap<>();
        if (!facility.getName().isEmpty()
                || facility.getNumberFloor() != 0
                || facility.getDeposit() != 0)
        {
            String name = VnCharacterUnit.removeAccent(facility.getName());
            int numberFloor = facility.getNumberFloor();
            double deposit = facility.getDeposit();
            if (!name.matches(REGEX_NAME_FACILITY)) {
                mapError.put("name", "Input False , Please re-Enter!");
            }
        } else {
            mapError.put("name", "Please input name!");
        }
        if (mapError.size() == 0) {
            facilityRepository.CreateFacility(facility);
        }
        return mapError;
    }

    @Override
    public boolean deleteFacility(int id) {
        return facilityRepository.deleteFacility(id);
    }

    @Override
    public List<Facility> findAllFacility() {
        return facilityRepository.findAllFacility();
    }

    @Override
    public List<Facility> findByName() {
        return facilityRepository.findByName();
    }

    @Override
    public Facility findById(int id_search) {
        return facilityRepository.findById(id_search);
    }

    @Override
    public List<ServiceType> getServiceTypeList() {
        return facilityRepository.getServiceTypeList();
    }

    @Override
    public List<RentType> getRentalTypeList() {
        return facilityRepository.getRentalTypeList();
    }
}
