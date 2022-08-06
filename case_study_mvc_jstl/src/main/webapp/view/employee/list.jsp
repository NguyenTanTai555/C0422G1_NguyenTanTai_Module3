<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2022
  Time: 3:50 PM
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
<body>
<%@include file="../include/header.jsp" %>
<div class="col-md-12 p2 container-fluid">
    <div class="container-fluid col-md-12 text-center">
        <h1>List Service</h1>
    </div>
    <table class="table table-dark table-striped">
        <thead class="text-center text-white text-opacity-25">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">date_of_birth</th>
            <th scope="col">id_card</th>
            <th scope="col">phone</th>
            <th scope="col">email</th>
            <th scope="col">education_degree_id</th>
            <th scope="col">position_id</th>
            <th scope="col">salary</th>
            <th scope="col">education_degree</th>
            <th scope="col">position</th>
            <th scope="col">division</th>
            <th scope="col">Action
                <a href="/view/employee/create.jsp"><span class="material-symbols-outlined text-white ">add</span></a>
            </th>
        </tr>
        </thead>
        <tbody class="text-center text-white text-opacity-25">
        <tr>
            <th scope="row">1</th>
            <td>Nguyễn Văn B</td>
            <td>1995/17/07</td>
            <td>201710892</td>
            <td>0905068002</td>
            <td>NguyenVanB@gmailcom</td>
            <td>1</td>
            <td>3</td>
            <td>1500000</td>
            <td>Đại Học</td>
            <td>Chuyên viên</td>
            <td>Quản Lý</td>
            <td>
                <a href="/view/employee/edit.jsp"><span class="material-symbols-outlined">update</span></a>
                <button type="button" class="btn text-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <span class="material-symbols-outlined">delete</span>
                </button>
            </td>
        </tr>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Delete confirm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure delete?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn text-white text-opacity-25">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>

<form action="/FuramaServlet" id ="formDelete">
    <input type="hidden" name="actionUser" id="delete">
    <input type="hidden" id="idEmployeeInput" name="idEmployeeDelete">
</form>
<script>
    function submitFormDelete(idEmployee){
        document.getElementById("idEmployeeInput").value = idEmployee;
    }
    function setIdFormDelele(){
        document.getElementById("formDelete").submit();
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
