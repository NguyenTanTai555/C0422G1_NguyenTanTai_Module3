<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/27/2022
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form method="post" action="/ConverterServlet">
    <label>Rate:</label><br>
    <input type="text" name="rate" placeholder="Rate" value="22000"></br>
    <label>USD:</label><br>
    <input type="text" name="usd" placeholder="USD" value="0"><br>
    <input type="submit" id="submit" value="Converter">
  </form>
  </body>
</html>
