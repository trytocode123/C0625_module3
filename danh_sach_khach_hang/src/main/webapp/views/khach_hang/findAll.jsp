<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/26/2025
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<table class="table table-dark table-striped">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>

    <c:forEach var="khachHang" items="${khachHangList}" varStatus="status">
        <tr>
            <td><c:out value="${khachHang.ten}"></c:out></td>
            <td><c:out value="${khachHang.ngaySinh}"></c:out></td>
            <td><c:out value="${khachHang.diaChi}"></c:out></td>
            <td><img src="${khachHang.img}"></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
