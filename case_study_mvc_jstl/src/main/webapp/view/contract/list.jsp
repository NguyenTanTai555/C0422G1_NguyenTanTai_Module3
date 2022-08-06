<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/6/2022
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Contract</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
</head>
<body class="bg-warning bg-opacity-50">
<%@include file="../include/header.jsp"%>
<div class="container text-center  text-dark pd-5">
    <h2>LIST CONTRACT</h2>
    <table class="table table-dark text-center ">
        <tr class="bg-info bg-dark text-white">
            <th>Id</th>
            <th>Facility</th>
            <th>Customer name</th>
            <th>Start day</th>
            <th>End day</th>
            <th>Deposit</th>
            <th>Total money</th>
            <th>Attach facility</th>
            <th colspan="2">Action
                <a href="/view/contract/create.jsp"><span class="material-symbols-outlined text-white ">add</span></a>
            </th>
        </tr>
        <%--        <c:forEach var="con" items="${contract}">--%>
        <tr>
            <td>1</td>
            <td>Room </td>
            <td>Nguyễn Tấn Tài</td>
            <td>17/07/2021</td>
            <td>09/09/2021</td>
            <td>1200</td>
            <td>1400</td>
            <td>2 xe máy</td>
            <td>
                <a href="/view/contract/edit.jsp"><p class="material-symbols-outlined">update</p></a>
                <button type="button" class="btn text-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <p class="material-symbols-outlined">delete</p>
                </button>
            </td>
        </tr>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/FuramaServlet?action=delete">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Contract</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" readonly id="deleteId" class="form-control-plaintext">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    function editFacility(id){
        document.getElementById("editId").value = id;
    }
    function removeFacility(id){
        document.getElementById("deleteId").value = id;
    }
</script>
<%@include file="../include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
