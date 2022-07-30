<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/30/2022
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/product">Back to customer list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>products information</legend>
        <table>
            <tr>
                <td>Id: </td>
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
                <td>Describe: </td>
                <td>${products.getDescribe()}</td>
            </tr>
            <tr>
                <td>Producer: </td>
                <td>${requestScope["products"].getProducer()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="DeleteProduct"></td>
                <td><a href="/product">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
<c:if test='${requestScope["message"] != null}'>
    <h3 class="message">${requestScope["message"]}</h3>
</c:if>
</body>
</html>
