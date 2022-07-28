<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/27/2022
  Time: 7:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/CalculatorServlet" method="post">
    <input type="text" name="ProductDescription"><br>
    <input type="number" name="price" placeholder="List Pricebr "> <br>
    <input type="number" name="discount" placeholder="Discount Percent"> <br>
    <button>Discount</button>
  </form>
  </body>
</html>
