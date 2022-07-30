<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/30/2022
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>product details</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table>
    <tr>
        <td>id: </td>
        <td>${requestScope["products"].getId()}</td>
    </tr>
    <tr>
        <td>Name: </td>
        <td>${requestScope["products"].getName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${requestScope["products"].getPrice()}</td>
    </tr>
    <tr>
        <td>Descibe: </td>
        <td>${requestScope["products"].getDescribe()}</td>
    </tr>
    <tr>
        <td>Producer: </td>
        <td>${requestScope["products"].getProducer()}</td>
    </tr>
</table>
</body>
</html>
