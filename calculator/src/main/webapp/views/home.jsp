<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/29/2025
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../views/layout/library.jsp"/>
</head>
<body>
<h4>
    Simple Calculator
</h4>
<p>
    Calculator
</p>
<form action="/calculator" method="post">
<label>
    First operand
</label>
<input name="first">
<br>
<label>
    Operator
</label>

<select name="operator">
    <option value="Addition">
        Addition
    </option>

    <option value="Division">
        Division
    </option>

    <option value="Multiplication">
        Multiplication
    </option>

    <option value="Minus">
        Minus
    </option>
</select>
<br>

<label>
    Second Operand
</label>
<input name="second">

<button class="btn btn-success">Calculator</button>
</form>
</body>
</html>
