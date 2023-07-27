<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f8f8;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }

        .menu {
            list-style: none;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            background-color: #f5f5f5;
            padding: 10px;
            margin: 0;
            border-bottom: 2px solid #ccc;
        }

        .menu-item {
            margin-right: 10px;
        }

        .menu-item:last-child {
            margin-right: 0;
        }

        .menu-item a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            border-bottom: 2px solid transparent;
            transition: border-bottom-color 0.3s ease;
        }

        .menu-item a:hover {
            border-bottom-color: #f00;
        }
    </style>
</head>
<body>
<header>
    <ul class="menu">
        <li class="menu-item">이름: <%= session.getAttribute("name") %>
        </li>
        <li class="menu-item"><a href="/admin/main">메인</a></li>
        <li class="menu-item"><a href="/user/logout">로그아웃</a></li>
    </ul>
</header>
<h1>User Money List</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Email</th>
        <th>Name</th>
        <th>Money</th>
    </tr>
    <%-- Loop through the user list and display the information --%>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.email}</td>
            <td>${user.name}</td>
            <td>${user.money}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
