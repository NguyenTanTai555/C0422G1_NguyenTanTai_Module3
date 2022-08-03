<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/1/2022
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title class="text-center">User Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <h1 class="text-center">User Management</h1>
    <h2 class="text-center ">
        <a href="/UserServlet?action=create" class="text-white border-1">Add New User</a>
    </h2>
    <form action="/UserServlet?action=find" method="post" class="text-center ">
        <input type="text" name="country" placeholder="Please Enter Country you want find">
        <button type="submit" class="text-primary">Search By Country</button>
    </form>
    <div class="text-center"> <a href="/UserServlet?action=sort"><button>Sort By Name</button></a></div>
    <hr>
    <table border="1" cellpadding="5" class="table container table-secondary" >
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="listUser" items="${listUser}">
            <tr>
                <td>${listUser.id}</td>
                <td>${listUser.name}</td>
                <td>${listUser.email}</td>
                <td>${listUser.country}</td>
                <td>
                    <a href="/UserServlet?action=edit&id=${listUser.id}"><button>Edit</button></a>

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"  data-bs-target="#exampleModal-${listUser.id}">
                        Delete
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal-${listUser.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel" >Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Do you want to delete !!!!!!!!!!!!!! ${listUser.name}
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary"><a href="/UserServlet?action=delete&id=${listUser.id}">delete</a></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
