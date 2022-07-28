<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/28/2022
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
  <body>

  <table border="2" class="container bg-light">
    <tr style="padding: 10px">
        <th>Name</th>
        <th>Birthday</th>
        <th>Address</th>
        <th>Picture</th>
    </tr>
    <hr>
    <c:forEach var="customer" items="${customerList}">
      <tr>
        <td>${customer.getName()}</td>
        <td>${customer.getBirthday()}</td>
        <td>${customer.getAddress()}</td>
        <td><img src=" ${customer.getPicture()}"style="height: 50px;width: 50px"></td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
