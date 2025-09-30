<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/30/2025
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/views/layout/library.jsp"/>
</head>
<body>
<table class="table table-striped table ">
    <tr>
        <th>
            Name
        </th>

        <th>
            Email
        </th>

        <th>
            Country
        </th>
    </tr>

    <c:forEach var="user" items="${userList}" varStatus="status">
        <tr>
            <td>
                <c:out value="${user.name}"/>
            </td>

            <td>
                <c:out value="${user.email}"/>
            </td>

            <td>
                <c:out value="${user.country}"/>
            </td>

            <td>
                <a href="/users?action=delete&id=${user.id}" class="btn btn-danger">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="/users?action=add" class="btn btn-info">Add user</a>
</body>
</html>
