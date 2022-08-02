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
    <title>User Management Application</title></head>
<body>
    <h1>User Management</h1>
    <h2>
        <a href="/UserServlet?action=create">Add New User</a>
    </h2>
    <form action="/UserServlet?action=find" method="post">
        <input type="text" name="country" placeholder="Please Enter Country you want find">
        <button type="submit">Search By Country</button>
    </form>
    <a href="/UserServlet?action=sort"><button>Sort By Name</button></a>
    <table border="1" cellpadding="5" >
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
                    <a href="/UserServlet?action=delete&id=${listUser.id}"><button>Delete</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
