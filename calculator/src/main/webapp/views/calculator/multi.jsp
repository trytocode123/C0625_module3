<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/29/2025
  Time: 4:07 PM
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
<h1>Result</h1>
<p><c:out value="${first}"/> * <c:out value="${second}"/> = <c:out value="${multiplication}"/></p>
<a class="btn btn-info" href="/home">Back</a>
</body>
</html>
