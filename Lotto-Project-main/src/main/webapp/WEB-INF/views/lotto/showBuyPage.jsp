<%--
Created by IntelliJ IDEA.
User: Playdata
Date: 2023-07-05
Time: 오후 2:07
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Lotto List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        css
        Copy code
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        td button {
            padding: 5px 10px;
            font-size: 14px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .buy-button {
            display: flex;
            justify-content: center;
        }

        .buy-button button {
            margin: 0 auto;
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            function validateForm() {
                var userMoney = parseInt($('.userMoney').val());

                if (userMoney === 0) {
                    alert("잔액이 부족합니다.");
                    return false;
                }
            }
        });
    </script>
</head>
<body>
<header>
    <ul class="menu">
        <li class="menu-item">이름: <%= session.getAttribute("name") %></li>
        <li class="menu-item">잔액: <%= session.getAttribute("money") %></li>
        <li class="menu-item"><a href="/main">메인</a></li>
        <li class="menu-item"><a href="/user/logout">로그아웃</a></li>
    </ul>
</header>
<div class="container">
    <h1 class="text-center">Lotto List</h1>
    <table class="table">
        <thead>
        <tr>
            <th>로또 번호</th>
            <th>회차</th>
            <th>구매하기</th>
            <th>현재 잔액: ${userMoney}</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lottoList}" var="lotto">
            <c:if test="${lotto.status eq false}">
                <tr>
                    <td>${lotto.lottoNumbers}</td>
                    <td>${lotto.drawDate}</td>
                    <td class="buy-button">
                        <form method="post" action="/lotto/showBuyPage" onsubmit="return validateForm();">
                            <input type="hidden" name="lottoNumbers" value="${lotto.lottoNumbers}">
                            <button type="submit" class="btn btn-success">구매</button>
                        </form>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>