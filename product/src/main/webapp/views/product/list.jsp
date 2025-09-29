<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/29/2025
  Time: 9:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <c:import url="/views/layout/library.jsp"/>
</head>
<body>
<table class="table table-striped">
    <tr>
        <th>
            Tên sản phẩm
        </th>

        <th>
            Giá sản phẩm
        </th>

        <th>
            Mô tả sản phẩm
        </th>

        <th>
            Nhà sản xuất
        </th>
    </tr>

    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>
                <c:out value="${product.tenSanPham}"/>
            </td>

            <td>
                <fmt:setLocale value="vi_VN"/>
                <fmt:formatNumber value="${product.giaSanPham}" type="currency" groupingUsed="true"/>
            </td>

            <td>
                <c:out value="${product.moTaSanPham}"/>
            </td>

            <td>
                <c:out value="${product.nhaSanXuat}"/>
            </td>
        </tr>
    </c:forEach>
</table>
<a class="btn btn-success" href="/home">Back</a>
</body>
</html>
