<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/4/2022
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
</head>
<body class="bg-warning bg-opacity-50" style="text-decoration: none">
<div class="container-fluid" action="/view/list.jsp">
    <%--    header--%>
    <div class="row bg-dark bg-opacity-75 p-3 " style="height: 15%">
        <div class="col-md-3 justify-content-start pt-10 ">
            <img src="/image/logo.png" style="height: 60px; width: 40px">
            <a class="text-white text-opacity-75" href="#" style="text-decoration: none">Furama Resort</a>
        </div>
        <div class="text-sm-start font-weight-normal col-md-3">
            <div class="h6 m-0 text-black">
                <a href="#" class="text-white text-opacity-75" style="text-decoration: none">103 – 105 Đường Võ Nguyên
                    Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam</a>
            </div>
        </div>
        <div class="col-md-3">
            <ul class="m-0" style="list-style-type: none ;">
                <li style="padding-top: 5px"><a href="#" class="text-white text-opacity-75"
                                                style="text-decoration: none">84-236-3847 333/888</a></li>
                <li style="padding-bottom: 5px"><a href="#" class="text-white text-opacity-75"
                                                   style="text-decoration: none">reservation@furamavietnam.com</a></li>
            </ul>
        </div>

        <div class="col-md-3 text-end text-white"><a href="#" class=" p-2 text-white text-opacity-75"
                                                     style="text-decoration: none">Nguyễn Tấn Tài</a></div>
    </div>
    <%--    navbar--%>
    <nav class="navbar navbar-expand-md navbar-black-oc ">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Customer</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">List</a></li>
                            <li><a class="dropdown-item" href="#">Service</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Contact</a>
                    </li>
                </ul>
                <form class="d-flex justify-content-between">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <%--conten--%>
    <div class="col-md-12 p2 container-fluid" style="height:1000px ">
        <div class="container-fluid col-md-12 text-center">
            <h1>List Service</h1>
        </div>
        <table class="table table-dark table-striped">
            <thead class="text-center text-white text-opacity-25">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Tên dịch vụ</th>
                <th scope="col">Diện tích sử dụng</th>
                <th scope="col">Chi phí thuê</th>
                <th scope="col">Số lượng người tối đa</th>
                <th scope="col">Kiểu thuê</th>
                <th scope="col">Tiêu chuẩn phòng</th>
                <th scope="col">Tiện nghi</th>
                <th scope="col">Diện tích hồ bơi</th>
                <th scope="col">Số tầng</th>
                <th scope="col">Dịch vụ miễn phí</th>
                <th scope="col">Action
                    <a href="/view/create.jsp"><span class="material-symbols-outlined text-white ">add</span></a>
                </th>

            </tr>
            </thead>
            <tbody class="text-center text-white text-opacity-25">
            <tr>
                <th scope="row">1</th>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>11</td>
                <td>
                    <a href="/view/edit.jsp"><span class="material-symbols-outlined">update</span></a>
                    <button type="button" class="btn text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <span class="material-symbols-outlined">delete</span>
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn text-white text-opacity-25">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--footer--%>
    <div class="row container-fluid bg-dark" style="padding-bottom: 0px">
        <div class="col-md-12 text-white text-center">
            <h2>Footer</h2>
        </div>
    </div>
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

