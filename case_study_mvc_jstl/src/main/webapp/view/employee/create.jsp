<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2022
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../include/header.jsp"%>
<div class="container w-50 mt-2 p-2 bg-dark text-white" style="border: 1px solid white; border-radius: 15px">
    <h3 class="text-center text-white">ADD NEW EMPLOYEE</h3>
    <form class="row g-3" action="" method="post">
        <div class="col-md-12">
            <label for="name" class="form-label">Employee name</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="col-md-12">
            <label for="birthday" class="form-label">Birthday</label>
            <input type="text" class="form-control" id="birthday" name="birthday">
        </div>

        <div class="col-md-12">
            <label for="idCard" class="form-label">Id Card</label>
            <input type="text" class="form-control" id="idCard" name="idCard">
        </div>
        <div class="col-md-12">
            <label for="phoneNumber" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
        </div>
        <div class="col-md-12 " id="s1">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email">
        </div>

        <div class="col-md-12">
            <label class="form-label">education_degree_id</label>
            <select name=""  class="form-select" >
                <option value="None" >Choose Id</option>
                <option value="1" >1</option>
                <option value="2" >2</option>
                <option value="3" >3</option>
                <option value="4" >4</option>
            </select>
        </div>
        <div class="col-md-12">
        <label class="form-label">position_id</label>
        <select name=""  class="form-select" >
            <option value="None" >Choose Id</option>
            <option value="1" >1</option>
            <option value="2" >2</option>
            <option value="3" >3</option>
            <option value="4" >4</option>
            <option value="5" >5</option>
            <option value="6" >6</option>
        </select>
    </div>
        <div class="col-md-12 " id="s3" style="display: none">
            <label for="address" class="form-label">Salary</label>
            <input type="number" class="form-control" id="address" name="address">
        </div>
        <div class="col-md-12">
            <label class="form-label">education_degree</label>
            <select name=""  class="form-select" >
                <option value="caoDang" >Cao Đẳng </option>
                <option value="daiHoc" >Đại Học</option>
                <option value="sauDaiHoc" >Sau Đại Học</option>
                <option value="trungCap" >Trung Cấp</option>
            </select>
        </div>
        <div class="col-md-12">
            <label class="form-label">Position</label>
            <select name=""  class="form-select" >
                <option value="leTan" >Lễ Tân</option>
                <option value="phucVu" >Phục Vụ</option>
                <option value="chuyenVien" >Chuyên Viên</option>
                <option value="giamSat" >Giám sát</option>
                <option value="quanLy" >Quản Lý</option>
                <option value="giamDoc" >Giám Đốc</option>
            </select>
        </div>
        <div class="col-md-12">
            <label class="form-label">Division</label>
            <select name=""  class="form-select" >
                <option value="sale" >Sale – Marketing</option>
                <option value="hanhChinh" >Hành Chính, </option>
                <option value="divisionPhucVu" >Phục vụ</option>
                <option value="divisionQuanLy" >Quản lý</option>
            </select>
        </div>
        <div class="col-12 ">
            <button type="submit" class="btn btn-primary">Gửi</button>
        </div>
    </form>
</div>
<%@include file="../include/footer.jsp"%>
</body>
</html>
