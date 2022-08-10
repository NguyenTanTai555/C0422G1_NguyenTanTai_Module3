<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2022
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>--%>
</head>
<body class="bg-warning bg-opacity-50">
<%@include file="../include/header.jsp"%>
<div class="container w-50 mt-2 p-2 bg-white text-dark" style="border: 1px solid white; border-radius: 15px">
    <h3 class="text-center text-white">ADD NEW CUSTOMER</h3>
<%--    <c:if test="${message != null}">--%>
<%--        <h4>${message}</h4>--%>
<%--    </c:if>--%>
    <form class="row g-3" action="/furama?action=insert_customer" method="post">
        <div class="col-md-12">
            <label for="inputTypeId" class="form-label">Customer Type id</label>
            <select type="text" class="form-select" id="inputTypeId" name="typeId" value="${customer.customerTypeId}">
                   <c:forEach items="${customerType}" var="customerType">
                       <option value="${customerType.customerTypeId}" selected>${customerType.customerName}</option>
                   </c:forEach>

            </select>
        </div>
        <div class="col-md-12">
            <label for="name" class="form-label">Customer name</label>
            <input type="text"  class="form-control" id="name" name="name" value="${customer.name}">
            <div style="color: red">${regexName}</div>
        </div>
        <div class="col-md-12">
            <label for="staticDate" class="form-label">Birthday</label>
            <div class="col-sm-8">
                <input type="date"  class="form-control" id="staticDate" name="dateOfBirth"
                       value="${customer.dateOfBirth}" >
            </div>
        </div>
        <div class="col-md-12">
            <label for="gender" class="form-label">Gender</label>
            <select type="text" class="form-control" id="gender" name="gender"
                    value="${customer.gender}">
                <option value="1">Male</option>
                <option value="0">Female</option>
            </select>
        </div>
        <div class="col-md-12">
            <label for="idCard" class="form-label">Id Card</label>
            <input type="text"  class="form-control" id="idCard" name="idCard" value="${customer.idCard}" >
            <div style="color:red">${regexCard}</div>

        </div>
        <div class="col-md-12">
            <label for="phoneNumber" class="form-label">Phone</label>
            <input type="text"  class="form-control" id="phoneNumber" name="phoneNumber" value="${customer.phoneNumber}" >
            <div style="color:red">${regexPhone}</div>
        </div>
        <div class="col-md-12 " id="s1">
            <label for="email" class="form-label">Email</label>
            <input type="text"  class="form-control" id="email" name="email" value="${customer.email}">
            <div style="color: red">${regexEmail}</div>
        </div>
        <div class="col-md-12 " id="s3" >
            <label for="address" class="form-label">Address </label>
            <input type="text" required class="form-control" id="address" name="address" value="${customer.address}">
        </div>
        <div class="col-12 ">
            <button class="btn btn-danger" type="button" onclick="location.href='/furama?action=list_customer'">Cancel</button>
            <button type="submit" class="btn btn-primary">Create</button>
        </div>
    </form>
</div>
<%@include file="../include/footer.jsp"%>
</body>
<%--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"--%>
<%--        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"--%>
<%--        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>--%>
</html>
