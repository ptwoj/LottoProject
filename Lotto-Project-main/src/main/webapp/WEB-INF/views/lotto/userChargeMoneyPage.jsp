<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Lotto Page</title>
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
        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        input[type="number"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .user-money {
            text-align: center;
            margin-top: 20px;
            font-size: 20px;
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
        <li class="menu-item">이름: <%= session.getAttribute("name") %></li>
        <li class="menu-item">잔액: <%= session.getAttribute("money") %></li>
        <li class="menu-item"><a href="/main">메인</a></li>
        <li class="menu-item"><a href="/user/logout">로그아웃</a></li>
    </ul>
</header>
<div class="container">
    <h1 class="text-center">Lotto Page</h1>
    <div class="user-money">현재 잔액: ${money}</div>
    <form method="post" action="/lotto/userChargeMoneyPage">
        <div class="form-group">
            <input type="number" name="userMoney" class="form-control" placeholder="금액을 입력하세요">
        </div>
        <div class="text-center">
            <input type="submit" class="btn btn-success" value="결제하기">
        </div>
    </form>
</div>
</body>
</html>