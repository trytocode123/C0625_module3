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
</head>
<body>
<form action="/users?action=update&id=${id}" method="post">
    <label>Name</label>
    <input name="name">
    <label>Email</label>
    <input name="email">
    <label>Country</label>
    <input name="country">
    <button>Save</button>
</form>
</body>
</html>
