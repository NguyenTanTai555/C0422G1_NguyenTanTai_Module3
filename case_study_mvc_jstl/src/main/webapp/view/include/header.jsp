<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2022
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body class="bg-warning bg-opacity-50">
<div class="container-fluid">
    <%--    header--%>
    <div class="row bg-dark bg-opacity-75 p-3" style="height: 18%">
        <div class="col-md-3 justify-content-start pt-10 ">
            <img src="/image/logo.png" style="height: 60px; width: 40px">
            <a class="text-white text-opacity-75" href="#">Furama Resort</a>
        </div>
        <div class="text-sm-start font-weight-normal col-md-3">
            <div class="h6 m-0 text-black">
                <a href="#" class="text-white text-opacity-75" href="#" style="text-decoration: none">103 – 105 Đường Võ
                    Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam</a>
            </div>
        </div>
        <div class="col-md-3">
            <ul class="m-0" style="list-style-type: none ;">
                <li style="padding-top: 5px"><a class="text-white text-opacity-75" href="#"
                                                style="text-decoration: none">84-236-3847 333/888</a></li>
                <li style="padding-bottom: 5px"><a href="#" class="text-white text-opacity-75" href="#"
                                                   style="text-decoration: none">reservation@furamavietnam.com</a></li>
            </ul>
        </div>

        <div class="col-md-3 text-end"><span class="text-white text-opacity-75" href="#" style="text-decoration: none">Nguyễn Tấn Tài</span>
        </div>
    </div>
    <%--    navbar--%>
    <nav class="navbar navbar-expand-md navbar-black-oc ">
        <div class="container-fluid">
            <a class="navbar-brand" href="/index.jsp">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page"
                           href="/view/employee/list.jsp">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/view/customer/list.jsp">Customer</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/view/list.jsp">List</a></li>
                            <li><a class="dropdown-item" href="/view/create.jsp">Service</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/view/contract/list.jsp">Contact</a>
                    </li>
                </ul>
                <form class="d-flex justify-content-between">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</html>
