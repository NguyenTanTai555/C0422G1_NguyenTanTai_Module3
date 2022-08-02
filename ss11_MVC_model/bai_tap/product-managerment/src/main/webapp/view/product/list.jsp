<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/30/2022
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div>
    <fieldset>
<form method="get" action="/product">
    <tr>
        <td><input type="text" name="name" placeholder="Enter name your want search"></td>
        <td><button type="submit" name="action" value="searchName">search</button></td>
    </tr>
    <tr>
        <td><input type="text" name="id" placeholder="Enter id your want search"></td>
        <td><button type="submit" name="action" value="search">search by id</button></td>
    </tr>
    <table border="1px solid black bg-light">
        <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Product Describe</th>
            <th>Product Producer</th>
            <th>Edit Product</th>
            <th>Delete Product</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td><img src="${product.describe}" style="width: 30px ;height: 30px"></td>
                <td><img src="${product.producer}" style="width: 30px ;height: 30px" ></td>
                <td><button><a href="/product?action=update&id=${product.id}">Update</a></button></td>
                <td><button><a href="/product?action=delete&id=${product.id}">Delete</a></button></td>
            </tr>
        </c:forEach>
    </table>
    <tr>
        <td>
                <button><a href="/product?action=create">Add Product</a></button>
        </td>
    </tr>
</form>
    </fieldset>
</div>
</body>
</html>
