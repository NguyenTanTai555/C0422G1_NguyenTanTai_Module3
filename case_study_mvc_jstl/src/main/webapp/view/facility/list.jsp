<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/4/2022
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body class="bg-warning bg-opacity-50" style="text-decoration: none">
<%@include file="../include/header.jsp"%>

    <%--conten--%>
    <div class="col-md-12 p2 container-fluid">
        <div class="container-fluid col-md-12 text-center">
            <h1>Service List</h1>
        </div>

        <div class="d-flex justify-content-end mb-1">
            <button class="btn-primary" onclick="location.href='/facility?action=createFacility'" >Add New Facility</button>
        </div>
        <table class="table text-dark text-center bg-white">
            <thead class="text-center text-opacity-25">
            <tr>
                <th scope="col">Facility Id</th>
                <th scope="col">Name</th>
                <th scope="col">Area</th>
                <th scope="col">Deposit</th>
                <th scope="col">Max People</th>
                <th scope="col">Rent Type Id</th>
                <th scope="col">Facility Type</th>
                <th scope="col">Standard Room</th>
                <th scope="col">description</th>
                <th scope="col">Pool Area</th>
                <th scope="col">Number Of Floor</th>
                <th scope="col">Facility Service</th>
                <th scope="col 2" colspan="2">Action</th>
            </tr>
            <c:forEach var="fac" items="${facilityList}">
                <tr>
                    <td>${fac.id}</td>
                    <td>${fac.name}</td>
                    <td>${fac.area}</td>
                    <td>${fac.deposit}</td>
                    <td>${fac.maxPeople}</td>
                    <td>${fac.rentTypeId}</td>
                    <td>${fac.facilityType}</td>
                    <td>${fac.standardRoom}</td>
                    <td>${fac.description}</td>
                    <td>${fac.poolArea}</td>
                    <td>${fac.numberFloor}</td>
                    <td>${fac.facilityFree}</td>
                    <td>
                        <a href="/facility?action=editFacility&id=${fac.id}"><span class="material-symbols-outlined">update</span></a>
                    </td>
                    <td>
                        <button
                                type="button" class="btn text-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                onclick="deleteFacility(${fac.id})">
                            <span class="material-symbols-outlined">delete</span>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/facility?action=deleteFacility" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Facility</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" id="deleteId" class="form-control-plaintext" name="id">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </form>
</div>
<%@include file="../include/footer.jsp"%>
<script>
    function deleteFacility(id){
        document.getElementById("deleteId").value = id;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>

