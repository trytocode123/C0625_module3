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
    <link rel="stylesheet" href="bootstrap502/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <script src="views/jquery/jquery-3.5.1.min.js"></script>
    <script src="datatables/js/jquery.dataTables.min.js"></script>
    <script src="datatables/js/dataTables.dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#tableProduct').dataTable({
                "dom": 'lrtip',
                "lengthChange" : false,
                "pageLength":5
            });
        });
    </script>
</head>
<body>
<!-- Toast container -->
<div class="position-fixed top-0 end-0 p-3" style="z-index: 9999">
    <div id="toast" class="toast align-items-center border-0" role="alert"
         aria-live="assertive" aria-atomic="true" data-bs-delay="4000" data-bs-autohide="true">
        <div class="d-flex">
            <div class="toast-body">
                <c:out value="${toastMessage}"/>
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
<form action="/products?action=search" method="post">
    <input name="nameProduct" value="${nameProductSearch}">
    <select name="category">
        <option value="">--Danh mục--</option>
        <c:forEach var="category" items="${categoryList}" varStatus="status">
            <option value="${category.iD}"><c:out value="${category.name}"/></option>
        </c:forEach>
    </select>
    <button>Tìm kiếm</button>
</form>
<table id="tableProduct" class="table table-striped">
    <thead>
    <tr>
        <th>
            STT
        </th>
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

        <th>Danh mục</th>

        <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>
                <c:out value="${status.index + 1}"/>
            </td>
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

            <td>
                <c:out value="${product.category}"/>
            </td>

            <td>
                <button onclick="delProduct('${product.tenSanPham}','${product.id}')" type="button"
                        class="btn btn-danger"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
                <a href="/products?action=update&id=${product.id}" class="btn btn-primary">Update</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a class="btn btn-success" href="/home">Back</a>

<!-- Modal -->
<form action="/products?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input name="idDel" id="idDel" type="hidden">
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
</form>


<script>
    function delProduct(name, iD) {
        document.querySelector(".modal-body").innerHTML = "Bạn có chắc muốn xoá sản phẩm " + name + "?";
        document.querySelector("#idDel").value = iD;
    }

    <c:if test="${not empty toastMessage}">
    const toastEl = document.getElementById("toast");
    <%-- Set màu nền dựa trên toastType --%>
    <c:choose>
    <c:when test="${toastType == 'success'}">
    toastEl.classList.add("text-bg-success");
    </c:when>
    <c:otherwise>
    toastEl.classList.add("text-bg-danger");
    </c:otherwise>
    </c:choose>
    const toast = new bootstrap.Toast(toastEl);
    toast.show();
    </c:if>


</script>
</body>
</html>
