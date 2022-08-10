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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body class="bg-warning bg-opacity-50">
<%@include file="../include/header.jsp"%>

<div class="container w-50 mt-2 p-2 bg-dark text-white" style="border: 1px solid white; border-radius: 15px">
    <h3 class="text-center text-white">EDIT EMPLOYEE FORM</h3>
    <form class="row g-3" action="/furama?action=edit_customer" method="post">
        <div class="col-md-12">
            <label for="editId" class="form-label" >Customer ID</label>
            <input type="text" class="form-control" id="editId" name="id" value="${customer.id}" readonly>
        </div>
        <div class="col-md-12 " id="s2">
            <label for="inputTypeId" class="form-label">Customer Type id</label>
            <select type="text" class="form-select" id="inputTypeId" name="typeId" required>
                <c:forEach items="${customerType}" var="customerType">
                    <option value="${customerType.customerTypeId}">${customerType.customerName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-12">
            <label for="name" class="form-label">Customer name</label>
            <input type="text" required class="form-control" id="name" name="name" value=" <c:out value='${customer.name}'/>">
        </div>
        <div class="col-md-12">
            <label for="birthday" class="form-label">Birthday</label>
            <input type="text" required class="form-control" id="birthday" name="date" value= "<c:out value='${customer.dateOfBirth}'/>">
        </div>
        <div class="col-md-12">
            <label for="gender" class="form-label">Gender</label>
            <select type="text" required class="form-control" id="gender" name="gender" value="<c:out value='${customer.gender}'/>">
                <option value="1">Male</option>
                <option value="0">Female</option>
            </select>
        </div>
        <div class="col-md-12">
            <label for="idCard"  class="form-label">Id Card</label>
            <input type="text" required class="form-control" id="idCard" name="idCard" value="<c:out value='${customer.idCard}'/>">
        </div>
        <div class="col-md-12">
            <label for="phoneNumber" class="form-label">Phone</label>
            <input type="text" required class="form-control" id="phoneNumber" name="phone" value="<c:out value='${customer.phoneNumber}'/>">
        </div>
        <div class="col-md-12 " id="s1">
            <label for="email" class="form-label">Email</label>
            <input type="text" required class="form-control" id="email" name="email" value="<c:out value='${customer.email}'/>">
        </div>
        <div class="col-md-12 " id="s3">
            <label for="address" class="form-label">Address </label>
            <input type="text" required class="form-control" id="address" name="address" value="<c:out value='${customer.address}'/>">
        </div>
        <div class="col-12 ">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='/furama?action=list_customer'">Cancel</button>
            <button type="submit" class="btn btn-primary">Edit Now</button>
        </div>
    </form>
</div>
<c:if test="${message != null}">
    <h1>${message}</h1>
</c:if>
<div class="col-md-5 bg-dark mt-5 p-3 text-center text-danger" style="margin: auto">

        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='/furama?action=list_customer'">Back</button>
    </div>
<%@include file="../include/footer.jsp"%>
</body>

</html>
