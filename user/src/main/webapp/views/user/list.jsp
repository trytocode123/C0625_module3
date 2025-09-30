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
    <button class="btn btn-info">Search</button>
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
                <button onclick="deleteUser('${user.id}','${user.name}')" type="button" class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
                <a href="/users?action=update&id=${user.id}" class="btn btn-warning">Update</a>
            </td>

        </tr>
    </c:forEach>
</table>
<!-- Modal -->
<form action="/users?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" id="inputId" name="idDelete">
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    function deleteUser(id, name) {
        document.querySelector(".modal-body").innerHTML = "Are you sure to delete " + name + "?";
        document.querySelector("#inputId").value = id;
    }
</script>
</body>
</html>
