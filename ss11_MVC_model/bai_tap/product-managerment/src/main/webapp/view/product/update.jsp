<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/31/2022
  Time: 7:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit Product</h1>
<form action="/product" method="post">
    <input type="text" name="name" value="${product.name}">
    <input type="number" name="price" value="${product.price}">
    <input type="text" name="describe" value="${product.describe}">
    <input type="text" name="producer"value="${product.producer}">
    <button type="submit" name="action" value="create">Update</button>
</form>
</body>
</html>
