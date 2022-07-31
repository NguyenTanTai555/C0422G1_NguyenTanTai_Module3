<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/30/2022
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add new Product</title>
</head>
<body>
<h1>Add New Product</h1>
<form action="/product" method="post">
    <input type="text" name="name">
    <input type="number" name="price">
    <input type="text" name="describe">
    <input type="text" name="producer">
    <button type="submit" name="action" value="create">Add now</button>
</form>
</body>
</html>
