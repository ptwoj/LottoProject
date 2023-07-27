<%--
Created by IntelliJ IDEA.
User: Playdata
Date: 2023-07-06
Time: 오후 7:42
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
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
<div class="container">
    <h1 class="text-center">Admin Page</h1>
    <div class="row justify-content-center mt-5">
        <div class="col-sm-4">
            <form action="/admin/userMoneyList">
                <button type="submit" class="btn btn-primary btn-block">유저 금액 리스트</button>
            </form>
        </div>
        <div class="col-sm-4">
            <form action="/admin/delete">
                <button type="submit" class="btn btn-danger btn-block">유저 삭제</button>
            </form>
        </div>
        <div class="col-sm-4">
            <form action="/admin/outUser">
                <button type="submit" class="btn btn-warning btn-block">탈퇴 유저</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>