<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/30/2022
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <fieldset>
        <table>
            <legend>Edit</legend>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="name"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price" value="price"></td>
            </tr>
            <tr>
                <td>Describe:</td>
                <td><input type="text" name="describe" value="describe"></td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td><input type="text" name="producer" value="producer"></td>
            </tr>
            <tr>
                <td><input type="submit" value="editProduct"></td>
                <td><a href="/product">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
