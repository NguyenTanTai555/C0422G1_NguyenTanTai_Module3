<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2022
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
</head>
<body class="bg-opacity-50 bg-warning">
<%@include file="../include/header.jsp" %>
<div class="col-md-12 p2 container-fluid">
    <div class="container-fluid col-md-12 text-center">
        <h1>Customer List</h1>
    </div>
    <div class="d-flex justify-content-end mb-1">
        <button class="btn-primary" onclick="location.href='/furama?action=create_customer'" >Add New Customer</button>
    </div>
    <table class="table bg-white table-responsive text-dark">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Customer ID</th>
            <th scope="col">Type ID</th>
            <th scope="col">Name</th>
            <th scope="col">BirthDay</th>
            <th scope="col">Gender</th>
            <th scope="col">ID Card</th>
            <th scope="col">Phone</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col" colspan="2">Action</th>

        </tr>
        <c:forEach var="customer" items="${customerList}" varStatus="stt">
            <tr>
                    <td>${stt.count}</td>
                    <td>${customer.id}</td>
                <c:forEach var="type" items="${customerType}">
                    <c:if test="${customer.customerTypeId == type.customerTypeId}">
                        <td>${type.customerName}</td>
                    </c:if>
                </c:forEach>
                    <td>${customer.name}</td>
                    <td>${customer.dateOfBirth}</td>
                    <c:if test="${customer.gender ==1}">
                        <td>Male</td>
                    </c:if>
                    <c:if test="${customer.gender ==0}">
                        <td>Female</td>
                    </c:if>
                    <td>${customer.idCard}</td>
                    <td>${customer.phoneNumber}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                <td>
                <a href="/furama?action=show_edit_customer&id=${customer.id}"><span class="material-symbols-outlined">update</span></a>
                    <button class="btn text-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteModal"
                            onclick="setIdToFormDelete('${customer.id}')">
                        <span class="material-symbols-outlined">delete</span>
                    </button>
                </td>
            </tr>
        </c:forEach>

    </table>

    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form action="/furama?action=deleteCustomer" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure delete Customer ${customer.name}???

                        <input id="deleteId" type="text" name="id">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger text-white ">Delete</button>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
<%@include file="../include/footer.jsp"%>

<script>
  function setIdToFormDelete(id){
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
