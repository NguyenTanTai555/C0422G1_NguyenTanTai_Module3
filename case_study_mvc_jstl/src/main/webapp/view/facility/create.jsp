<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2022
  Time: 8:28 AM
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
<%-- form add--%>
<div class="container w-50 mt-2 p-2 bg-light" style="border: 1px solid grey; border-radius: 15px">
  <h3 align="center">Add New Facility</h3>
<%--  <c:if test="${message != null}">--%>
<%--    <h4>${message}</h4>--%>
<%--  </c:if>--%>
  <form class="row g-3" action="/facility?action=insertFacility" method="post">
    <div class="col-md-12">
      <label class="form-label">Facility type</label>
      <select name="create"  class="form-select" onchange="showServiceInput(this)">
        <option value="None" >Select Facility</option>
        <option value="1" >Villa</option>
        <option value="2" >House</option>
        <option value="3" >Room</option>
      </select>
    </div>
<%--    <div class="col-md-12">--%>
<%--      <label for="id" class="form-label">Facility id</label>--%>
<%--      <input type="text" class="form-control" id="id" name="id">--%>
<%--    </div>--%>
    <div class="col-md-12">
      <label for="name" class="form-label">Facility Name</label>
      <input type="text" class="form-control" id="name" name="name" >
    </div>
    <div class="col-md-12">
      <label for="area" class="form-label">Area</label>
      <input type="text"  class="form-control" id="area" name="area">
    </div>
    <div class="col-md-12">
      <label for="cost" class="form-label">Deposit</label>
      <input type="text"   class="form-control" id="cost"  name="cost" >
    </div>
    <div class="col-md-12">
      <label for="inputAddress2" class="form-label">Max people</label>
      <input type="text"   class="form-control" id="inputAddress2"  name="max_people" >
    </div>
    <div class="col-md-12">
      <label for="inputCity" class="form-label">Rent Type</label>
      <select type="text"   class="form-select" id="inputCity" name="rent_type_id">
            <option value="1">Year</option>
            <option value="2">Month</option>
            <option value="3">Day</option>
            <option value="4">Hour</option>
      </select>
    </div>
    <div class="col-md-12 " id="s1" style="display: none">
      <label for="standard_room" class="form-label">Standard Room</label>
      <input type="text"  class="form-control" id="standard_room" name="standard_room">
    </div>

    <div class="col-md-12 " id="s2" style="display: none">
      <label for="description_other_convenience" class="form-label">Description</label>
      <input type="text"  class="form-control" id="description_other_convenience" name="description_other_convenience">
    </div>

    <div class="col-md-12 " id="s3" style="display: none">
      <label for="pool_area" class="form-label">Pool Area</label>
      <input type="text"  class="form-control" id="pool_area" name="pool_area">
    </div>

    <div class="col-md-12" id="s4" style="display: none">
      <label for="number_of_floors" class="form-label">Number Floor</label>
      <input type="text"  class="form-control" id="number_of_floors" name="number_of_floors">
    </div>

    <div class="col-md-12 " id="s5" style="display: none">
      <label for="facility_free" class="form-label">Facility Free</label>
      <input type="text"  class="form-control" id="facility_free" name="facility_free">
    </div>

    <div class="col-12 ">
      <button type="button" class="btn btn-danger" onclick="location.href='/facility?action=list_facility'">Cancel</button>
      <button type="submit" class="btn btn-s uccess">Create</button>
    </div>
  </form>
</div>
<%--footer--%>
<%@include file="../include/footer.jsp"%>

<script>
  function showServiceInput(value) {
    var v = value.value;
    switch (v) {
      case 'None':
        document.getElementById("s1").style.display="none";
        document.getElementById("s2").style.display="none";
        document.getElementById("s3").style.display="none";
        document.getElementById("s4").style.display="none";
        document.getElementById("s5").style.display="none";
        break;
      case "1":
        document.getElementById("s1").style.display="block";
        document.getElementById("s2").style.display="block";
        document.getElementById("s3").style.display="block";
        document.getElementById("s4").style.display="block";
        document.getElementById("s5").style.display="none";
        break;
      case "2":
        document.getElementById("s1").style.display="block";
        document.getElementById("s2").style.display="block";
        document.getElementById("s4").style.display="block";
        document.getElementById("s5").style.display="none";
        document.getElementById("s3").style.display="none";
        break;
      case "3":
        document.getElementById("s1").style.display="none";
        document.getElementById("s2").style.display="none";
        document.getElementById("s3").style.display="none";
        document.getElementById("s4").style.display="none";
        document.getElementById("s5").style.display="block";
        break;
    }
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
