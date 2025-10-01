<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/29/2025
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/views/layout/library.jsp"/>
</head>
<body>
<form action="/products?action=add" method="post">
    <label>Tên sản phẩm</label>
    <input name="nameProduct">

    <label>Giá sản phẩm</label>
    <input name="price">

    <label>Mô tả sản phẩm</label>
    <input name="description">

    <label>Nhà sản xuất</label>
    <input name="producer">

    <label>Danh mục</label>
    <select name="category">
        <option>--Danh mục--</option>
        <c:forEach var="category" items="${categoryList}" varStatus="status">
            <option value="${category.iD}"><c:out value="${category.name}"/></option>
        </c:forEach>
    </select>
    <button>Save</button>
</form>
</body>
</html>
