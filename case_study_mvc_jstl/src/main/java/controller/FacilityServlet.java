package controller;

import model.facility.Facility;
import service.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = {"/facility"} )
public class FacilityServlet extends HttpServlet {
    FacilityService facilityService = new FacilityService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null){
            action= "";
        }
        switch (action){
            case "list_facility":
                showListFacility(request, response);
                break;
            case "createFacility":
                showCreateFacility(request, response);
                break;
            case "editFacility":
                showEditFacility(request,response);
                break;
            default:
                RequestDispatcher rq = request.getRequestDispatcher("index.jsp");
                rq.forward(request, response);

        }
    }

    private void showEditFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.findById(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/edit.jsp");
        request.setAttribute("facility",facility);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateFacility(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilities = facilityService.findAllFacility();
        request.setAttribute("facilityList",facilities);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "insert_facility":
                createFacility(request,response);
                break;
            case "editFacility":
                editFacility(request,response);
                break;
            case "deleteFacility":
                deleteFacility(request,response);
                break;
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        facilityService.deleteFacility(id);
        List<Facility> facilities = facilityService.findAllFacility();
        request.setAttribute("facilityList",facilities);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editFacility(HttpServletRequest request, HttpServletResponse response) {

    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        Facility facility;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double deposit = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int typeId = Integer.parseInt(request.getParameter("rent_type_id"));
        int facilityType = Integer.parseInt(request.getParameter("create"));
        String standardRoom = request.getParameter("standard_room");
        String description = request.getParameter("description_other_convenience");
        String poolArea1 = request.getParameter("pool_area");
        double poolArea;
        if (poolArea1.equals("")){
            poolArea = 0;
        }else {
            poolArea = Double.parseDouble(poolArea1);
        }
        String numberFloor1 = request.getParameter("number_of_floors");
        int numberFloor;
        if (numberFloor1.equals("")){
            numberFloor = 0;
        }else {
            numberFloor = Integer.parseInt(numberFloor1);
        }
        String free = request.getParameter("facility_free");
        facility = new Facility(id, name, area, deposit, maxPeople, typeId, facilityType, standardRoom, description, poolArea, numberFloor,free);
        facilityService.CreateFacility(facility);
        List<Facility> facilityList = facilityService.findAllFacility();
        request.setAttribute("facilityList", facilityList);
        RequestDispatcher rq = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            rq.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
