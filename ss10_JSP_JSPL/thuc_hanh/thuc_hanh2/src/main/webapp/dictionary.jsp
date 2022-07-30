<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/28/2022
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%!
  Map<String,String> dic = new HashMap<>();
%>
<%
    dic.put("hello","xin chao");
    dic.put("how","the nao");
    dic.put("book","quyen vo");
    dic.put("computer","may tinh");
    String search = request.getParameter("search");
    String result = dic.get(search);
    PrintWriter wt = response.getWriter();
    if (result!=null){
        wt.println("Word: " + search);
        wt.println("Result: " + result);
    }
    else {
        wt.println("Not found");
    }
%>

</body>
</html>
