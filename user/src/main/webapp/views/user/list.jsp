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
<a href="/users?action=add" class="btn btn-info">Add user</a>
<a href="/users?action=list" class="btn btn-info">Reset</a>

<form action="/users?action=search" method="post">
    <label>Tìm kiếm</label>
    <input name="search">
    <button class="btn btn-info" href="/users/search">Search</button>
</form>

<table class="table table-striped table ">
    <tr>
        <th>
            Ordinal number
        </th>
        <th>
            Name
        </th>

        <th>
            Email
        </th>

        <th>
            Country
        </th>

        <th>
            Modify
        </th>


    </tr>

    <c:forEach var="user" items="${userList}" varStatus="status">
        <tr>

            <td>
                <c:out value="${status.index + 1}"/>
            </td>
            <td>
                <c:out value="${user.name}"/>
            </td>

            <td>
                <c:out value="${user.email}"/>
            </td>

            <td>
                <c:out value="${user.country}"/>
            </td>

            <td class="d-flex justify-content-between">
                <a href="/users?action=delete&id=${user.id}" class="btn btn-danger">Delete</a>

                <a href="/users?action=update&id=${user.id}" class="btn btn-warning">Update</a>
            </td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
