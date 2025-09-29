<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/29/2025
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../views/layout/library.jsp"/>
</head>
<body>
<h4>Home</h4>
<a href="/products?action=add" class="btn btn-success">Add product</a>
<a href="/products?action=list" class="btn btn-success">List product</a>
</body>
</html>
