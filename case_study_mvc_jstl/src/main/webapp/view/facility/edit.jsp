<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2022
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Facility</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
<body class="bg-warning bg-opacity-50">
<%@include file="../include/header.jsp"%>
    <%--        form edit--%>
    <div class="container w-50 mt-2 p-2 bg-dark text-white" style="border: 1px solid white; border-radius: 15px">
        <h3 class="text-center text-white">FACILITY SERVICE FORM</h3>
        <form class="row g-3" action="/facility?action=editFacility" method="post">
            <div class="col-md-12">
                <label class="form-label">Facility Type</label>
                <select name="create" class="form-select" onchange="showServiceInput(this)" id="serviceSelect">
                    <option value="None" disabled >Select Facility</option>
                    <c:forEach items="${facilityType}" var="serviceTypes">
                        <c:choose>
                            <c:when test="${serviceTypes.id == fac.facilityType}">
                                <option value="${serviceTypes.id}" selected>${serviceTypes.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${serviceTypes.id}">${serviceTypes.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-12">
                <label for="id" class="form-label">Facility Id</label>
                <input type="text" class="form-control" id="id" name="id" value="${fac.id}">
            </div>
            <div class="col-md-12">
                <label for="name" class="form-label">Facility Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${fac.name}">
            </div>
            <div class="col-md-12">
                <label for="area" class="form-label">Area</label>
                <input type="text" class="form-control" id="area" name="area" value="${fac.area}">
            </div>
            <div class="col-md-12">
                <label for="cost" class="form-label">Deposit</label>
                <input type="text" class="form-control" id="cost" name="cost" value="${fac.deposit}">
            </div>
            <div class="col-md-12">
                <label for="inputAddress2" class="form-label">Max People</label>
                <input type="text" class="form-control" id="inputAddress2" name="max_people" value="${fac.maxPeople}">
            </div>
            <div class="col-md-12">
                <label class="form-label">Rent Type</label>
                <select name="rent_type_id"  class="form-select">
                    <option value="None" disabled selected>Chọn kiểu thuê</option>
                    <c:forEach items="${rentType}" var="rentalTypeList">
                        <c:choose >
                            <c:when test="${rentalTypeList.id == fac.rentTypeId}">
                                <option value="${rentalTypeList.id}"selected >${rentalTypeList.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${rentalTypeList.id}">${rentalTypeList.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-12 " id="s1" style="display: none">
                <label for="standard_room" class="form-label">Standard Room </label>
                <input type="text" class="form-control" id="standard_room" name="standard_room" value="${fac.standardRoom}">
            </div>

            <div class="col-md-12 " id="s2" style="display: none">
                <label for="description_other_convenience" class="form-label">Description</label>
                <input type="text" class="form-control" id="description_other_convenience"
                       name="description_other_convenience" value="${fac.description}">
            </div>

            <div class="col-md-12 " id="s3" style="display: none">
                <label for="pool_area" class="form-label">Pool Area</label>
                <input type="text" class="form-control" id="pool_area" name="pool_area" value="${fac.poolArea}">
            </div>

            <div class="col-md-12" id="s4" style="display: none">
                <label for="number_of_floors" class="form-label">Number Of Floor </label>
                <input type="text" class="form-control" id="number_of_floors" name="number_of_floors"
                       value="${fac.numberFloor}">
            </div>

            <div class="col-md-12 " id="s5" style="display: none">
                <label for="facility_free" class="form-label">Facility Free</label>
                <input type="text" class="form-control" id="facility_free" name="facility_free"
                value="${fac.facilityFree}">
            </div>
            <div class="col-12 ">
                <button type="button" class="btn btn-danger">Back</button>
                <button type="submit" class="btn btn-success">Edit</button>
            </div>
        </form>
    </div>

<%@include file="../include/footer.jsp"%>
    <script>
        function showServiceInput(value) {
            var v = value.value;
            switch (v) {
                case 'None':
                    document.getElementById("s1").style.display = "none";
                    document.getElementById("s2").style.display = "none";
                    document.getElementById("s3").style.display = "none";
                    document.getElementById("s4").style.display = "none";
                    document.getElementById("s5").style.display = "none";
                    break;
                case "1":
                    document.getElementById("s1").style.display = "block";
                    document.getElementById("s2").style.display = "block";
                    document.getElementById("s3").style.display = "block";
                    document.getElementById("s4").style.display = "block";
                    document.getElementById("s5").style.display = "none";
                    break;
                case "2":
                    document.getElementById("s1").style.display = "block";
                    document.getElementById("s2").style.display = "block";
                    document.getElementById("s4").style.display = "block";
                    document.getElementById("s5").style.display = "none";
                    document.getElementById("s3").style.display = "none";
                    break;
                case "3":
                    document.getElementById("s1").style.display = "none";
                    document.getElementById("s2").style.display = "none";
                    document.getElementById("s3").style.display = "none";
                    document.getElementById("s4").style.display = "none";
                    document.getElementById("s5").style.display = "block";
                    break;
            }
        }
        window.onload=function (){
            if( document.getElementById("serviceSelect").value =='1'){
                document.getElementById("s1").style.display="block";
                document.getElementById("s2").style.display="block";
                document.getElementById("s3").style.display="block";
                document.getElementById("s4").style.display="block";
                document.getElementById("s5").style.display="none";
            }
            if( document.getElementById("serviceSelect").value =='2') {
                document.getElementById("s1").style.display="block";
                document.getElementById("s2").style.display="block";
                document.getElementById("s4").style.display="block";
                document.getElementById("s5").style.display="none";
                document.getElementById("s3").style.display="none";
            }
            if( document.getElementById("serviceSelect").value =='3') {
                document.getElementById("s1").style.display="none";
                document.getElementById("s2").style.display="none";
                document.getElementById("s3").style.display="none";
                document.getElementById("s4").style.display="none";
                document.getElementById("s5").style.display="block";
            }
        }

    </script>

        <%@include file="../include/footer.jsp"%>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</html>
