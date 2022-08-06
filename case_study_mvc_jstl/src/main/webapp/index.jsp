<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/4/2022
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="webapp/bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body class="bg-warning bg-opacity-50" >
<div class="container-fluid">
    <%--    header--%>
    <div class="row bg-dark bg-opacity-75 p-3" style="height: 18%">
        <div class="col-md-3 justify-content-start pt-10 ">
            <img src="image/logo.png" style="height: 60px; width: 40px">
            <a class="text-white text-opacity-75" href="#">Furama Resort</a>
        </div>
        <div class="text-sm-start font-weight-normal col-md-3">
            <div class="h6 m-0 text-black">
                <a href="#" class="text-white text-opacity-75" href="#" style="text-decoration: none">103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam</a>
            </div>
        </div>
        <div class="col-md-3">
            <ul class="m-0" style="list-style-type: none ;">
                <li style="padding-top: 5px"><a class="text-white text-opacity-75" href="#" style="text-decoration: none">84-236-3847 333/888</a></li>
                <li style="padding-bottom: 5px"><a href="#"class="text-white text-opacity-75" href="#" style="text-decoration: none">reservation@furamavietnam.com</a></li>
            </ul>
        </div>

        <div class="col-md-3 text-end"><span class="text-white text-opacity-75" href="#" style="text-decoration: none">Nguyễn Tấn Tài</span></div>
    </div>
    <%--    navbar--%>
        <nav class="navbar navbar-expand-md navbar-black-oc ">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/furama?action=list_employee">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/furama?action=list_customer">Customer</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Service
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="http://localhost:8080/view/list.jsp">List</a></li>
                                <li><a class="dropdown-item" href="#">Service</a></li>
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
    <%--   left content--%>
    <div class="container-fluid ">
        <div class="row p-2">
            <div class="col-md-3">
                <div class="row">
                    <div class="card bg-dark bg-opacity-75" style="width: 18rem;">
                        <img src="/image/house.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title ">Price :</h5>
                            <p class="card-text"></p>
                            <a href="#" class="btn btn-dark bg-opacity-50">Xem Chi Tiết</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card bg-dark bg-opacity-75" style="width: 18rem;">
                        <img src="/image/villa.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Price :</h5>
                            <p class="card-text"></p>
                            <a href="#" class="btn btn-dark bg-opacity-50">Xem Chi Tiết</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card bg-dark bg-opacity-75" style="width: 18rem;">
                        <img src="/image/room.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Price :</h5>
                            <p class="card-text">
                            </p>
                            <a href="#" class="btn btn-dark bg-opacity-50">Xem Chi Tiết</a>
                        </div>
                    </div>
                </div>
            </div>
<%--            right conten--%>
            <div class="col-md-9 p2">
                <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="10000">
                            <img src="/image/meting.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="/image/RECREATION.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/image/nhau.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
        <div class="container my-5">

            <footer class="bg-dark text-center text-lg-start text-white">
                <!-- Grid container -->
                <div class="container p-4">
                    <!--Grid row-->
                    <div class="row mt-4">
                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">See other books</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="#" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>Bestsellers</a>
                                </li>
                                <li>
                                    <a href="#" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>All books</a>
                                </li>
                                <li>
                                    <a href="#" class="text-white"><i class="fas fa-user-edit fa-fw fa-sm me-2"></i>Our authors</a>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Execution of the contract</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="#!" class="text-white"><i class="fas fa-shipping-fast fa-fw fa-sm me-2"></i>Supply</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white"><i class="fas fa-backspace fa-fw fa-sm me-2"></i>Returns</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white"><i class="far fa-file-alt fa-fw fa-sm me-2"></i>Regulations</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white"><i class="far fa-file-alt fa-fw fa-sm me-2"></i>Privacy policy</a>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Publishing house</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="#!" class="text-white">The BookStore</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">123 Street</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">05765 NY</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white"><i class="fas fa-briefcase fa-fw fa-sm me-2"></i>Send us a book</a>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Write to us</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="#!" class="text-white"><i class="fas fa-at fa-fw fa-sm me-2"></i>Help in purchasing</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white"><i class="fas fa-shipping-fast fa-fw fa-sm me-2"></i>Check the order status</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white"><i class="fas fa-envelope fa-fw fa-sm me-2"></i>Join the newsletter</a>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->
                </div>
                <!-- Grid container -->

                <!-- Copyright -->
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
                    © 2021 Copyright:
                    <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a>
                </div>
                <!-- Copyright -->
            </footer>

        </div>
        <!-- End of .container -->
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
