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
    <form class="row g-3" action="" method="post">
        <div class="col-md-12">
            <label for="name" class="form-label">Customer name</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="col-md-12">
            <label for="birthday" class="form-label">Birthday</label>
            <input type="text" class="form-control" id="birthday" name="birthday">
        </div>
        <div class="col-md-12">
            <label for="gender" class="form-label">Gender</label>
            <input type="text" class="form-control" id="gender" name="gender">
        </div>
        <div class="col-md-12">
            <label for="idCard" class="form-label">Id Card</label>
            <input type="text" class="form-control" id="idCard" name="idCard">
        </div>
        <div class="col-md-12">
            <label for="phoneNumber" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
        </div>
        <div class="col-md-12 " id="s1">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email">
        </div>

        <div class="col-md-12 " id="s2" style="display: none">
            <label for="customerTypeId" class="form-label">Customer Type ID</label>
            <input type="text" class="form-control" id="customerTypeId"
                   name="customerType">
        </div>

        <div class="col-md-12 " id="s3" style="display: none">
            <label for="address" class="form-label">Address </label>
            <input type="text" class="form-control" id="address" name="address">
        </div>

        <div class="col-md-12">
            <label class="form-label">Customer Type</label>
            <select name=""  class="form-select" >
                <option value="Villa" >Diamond</option>
                <option value="House" >Platinium</option>
                <option value="Room" >Gold</option>
                <option value="Room" >Silver</option>
                <option value="Room" >Gold</option>
            </select>
        </div>
        <div class="col-12 ">
            <button type="submit" class="btn btn-primary">Gửi</button>
        </div>
    </form>
</div>
<%@include file="../include/footer.jsp"%>
</body>

</html>
