<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page</title>

    <script>
        var selectedNumbers = []; // 선택된 번호를 저장하는 배열

        function selectLottoNumber(number) { // 클릭한 값을 number 매개변수로 가져온다
            var lottoNumberInput = document.getElementById("lottoNumberInput"); // input id 지정

            if (selectedNumbers.length < 6) {
                if (selectedNumbers.includes(number)) { // 이미 선택된 번호인 경우 includes(boolean반환함)로 해당 넘버가 있는지 확인함
                    alert("이미 선택한 번호입니다.");
                } else {
                    selectedNumbers.push(number); // 배열에 숫자 추가
                    lottoNumberInput.value = selectedNumbers.join(','); // 선택된 번호를 쉼표로 구분하여 입력란에 표시
                    // .join()은 배열의 원소들을 ( )안에 있는거를 바탕으로 연결하여 하나의 값으로 만듬
                    //  selectedNumbers 에 받아오는 값을 push로 배열끝에 저장하고  lottoNumberInput.value에 + 가 아닌
                    //  selectedNumbers.join(',')으로 값을 추가가 아닌 새 value를 넣는 형식으로 value를 만듬
                }
            } else {
                alert("6개까지 선택가능합니다.");
            }
        }

        function lottoNumberClear() { // 선택한 로또 번호 삭제
            var lottoNumberInput = document.getElementById("lottoNumberInput");
            selectedNumbers = []; // 선택된 번호 배열을 초기화
            lottoNumberInput.value = ""; // 입력란의 값을 비움
        }

        function lottoNumberAuto() { // 로또 넘버 자동삽입
            var lottoNumberInput = document.getElementById("lottoNumberInput");
            var numbers = [];

            for (var i = 1; i <= 45; i++) {
                numbers.push(i); // numbers 배열에 1~45까지 삽입
            }

            selectedNumbers = []; // 기존에 선택된 번호 초기화

            for (var j = 0; j < 6; j++) {  // 6자리
                var randomIndex = Math.floor(Math.random() * numbers.length);
                //  Math.random은 0~1까지의 소수를 반환하기 떄문에 * numbers.length만큼(인덱스)까지 나오도록 곱해주고
                // Math.floor로 소수점을 버린 정수로 반환한다
                var randomNumber = numbers[randomIndex]; // numbers의 인덱스로 랜덤 숫자를 가져온다
                selectedNumbers.push(randomNumber); // 배열에 해당값을 추가한다.
                numbers.splice(randomIndex, 1);  // 이미 사용된 번호를 지움으로서 중복방지를 한다
                // .splice(인덱스,해당 인덱스부터 몇개를 지울지)
            }

            lottoNumberInput.value = selectedNumbers.join(',');
        }

        function validateForm() {
            var lottoNumberInput = document.getElementById("lottoNumberInput");
            var selectedNumbers = lottoNumberInput.value.split(","); // input value를 split 함수를 사용해서 배열로 저장
            // split(구분자) 구분자를 통해 배열로 만듬.
            if (selectedNumbers.length !== 6) { // 배열 length로 숫자 6개 입력된건지 확인
                alert("로또 번호는 6개를 입력해야 합니다.");
                return false; // 폼 제출을 막음
            }
            return true; // 폼 제출을 허용
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        caption {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 10px;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }


        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        form {
            display: inline;
        }

        .button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #4caf50;
            color: white;
            text-align: center;
            font-size: 14px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }

        .lotto-number {
            position: relative;
        }

        .lotto-number .percentage {
            display: none;
            position: absolute;
            top: -14px;
            left: 100%;
            border: 1px solid lightblue;
            transform: translateX(-50%);
            background-color: #eaf2f8;
            color: black;
            padding: 5px;
            border-radius: 3px;
        }

        .lotto-number:hover .percentage {
            display: block;
        }

        form.cart-form {
            margin-bottom: 20px;
        }

        input[type="text"][readonly] {
            border: 1px solid gray;
            border-radius: 6px;
            width: 250px;
            background-color: transparent;
            font-size: 16px;
            font-weight: bold;
            margin-right: 10px;
        }

        input[type="button"][onclick="lottoNumberAuto()"],
        input[type="button"][onclick="lottoNumberClear()"] {
            margin-right: 10px;
        }

        input[type="submit"][id="cartButton"] {
            margin-left: 10px;
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
    <script>
        function deleteUser(userId) {
            if (confirm("정말로 회원 탈퇴 하시겠습니까?")) {
                window.location.href = "/user/delete";
            }
        }
    </script>
</head>
<body>
<header>
    <ul class="menu">
        <li class="menu-item">이름: <%= session.getAttribute("name") %>
        </li>
        <li class="menu-item">잔액: <%= session.getAttribute("money") %>
        </li>
        <li class="menu-item"><a href="/lotto/userChargeMoneyPage">충전하기</a></li>
        <li class="menu-item"><a href="/user/update">회원 정보 수정</a></li>
        <li class="menu-item"><a onclick="deleteUser('<%=session.getAttribute("id")%>')">회원 탈퇴</a>
        <li class="menu-item"><a href="/main">메인</a></li>
        <li class="menu-item"><a href="/user/logout">로그아웃</a></li>
        </li>
    </ul>
</header>

<% double[] percentages = (double[]) request.getAttribute("percentages"); %>

<table style="width: 600px; height: 300px; margin: 0 auto;">
    <caption style="margin-bottom: 20px">로또 번호 선택</caption>
    <br>
    <!-- 로또 번호들을 클릭 이벤트로 연결 -->
    <% for (int i = 0; i < 5; i++) { %>
    <tr>
        <% for (int j = 1; j <= 10; j++) {
            int num = (i * 10) + j;
            if (num > 45) {
                break;
            }
        %>
        <td class="lotto-number" style="cursor: pointer" onclick="selectLottoNumber(<%= num %>)">
            <%= num %>
            <span class="percentage"><%= percentages[num] %>%</span>
        </td>
        <% } %>
    </tr>
    <% } %>
</table>
<p style="text-align: center; margin-top: 10px; font-size: 12px; color: #888888;">※ 마우스를 올렸을 때 나오는 %는 이용자들의 해당 번호
    구매비율입니다.</p>


<form class="cart-form" action="/main" method="post" onsubmit="return validateForm()"
      style="display: flex; justify-content: center; align-items: center;">
    <input type="text" readonly name="drawDate" value="${drawDate}"
           style="width: 20px; border: 1px solid gray; border-radius: 6px; text-align: center;">회차
    &nbsp;<input type="text" readonly id="lottoNumberInput" name="lottoNumber" placeholder="로또 번호가 입력되는 곳입니다.">

    <input type="button" onclick="lottoNumberAuto()" value="자동" class="button">
    <input type="button" onclick="lottoNumberClear()" value="삭제" class="button">
    <input type="submit" value="장바구니" id="cartButton" class="button">
</form>

<table style="margin-top: 20px;width: 900px;margin: 0 auto;">
    <caption style="margin-bottom: 20px">장바구니</caption>
    <br>
    <tr>
        <th>No.</th>
        <th>회차</th>
        <th>로또번호</th>
    </tr>
    <% int shoppingNum = 1; %>
    <c:forEach items="${shoppingList}" var="shopping">
        <tr>
            <td><%= shoppingNum %>
            </td>
            <td>${ shopping.drawDate }</td>
            <td>${ shopping.lottoNumbers }</td>
        </tr>
        <% shoppingNum++; %>
    </c:forEach>
    <tr>
        <td colspan="3">
            <form method="get" action="/lotto/showBuyPage">
                <input type="submit" value="구매" class="button">
            </form>
        </td>
    </tr>
</table>

<table style="margin-top: 20px;width: 900px;margin: 0 auto;">
    <caption style="margin-bottom: 20px">구매내역</caption>
    <br>
    <tr>
        <td>No.</td>
        <td>회차</td>
        <td>로또번호</td>
        <td>당첨조회</td>
    </tr>
    <% int buyNum = 1; %>
    <c:forEach items="${buyList}" var="buy">
        <form method="get" action="/lotto/result">
            <tr>
                <td><%= buyNum %>
                </td>
                <td>${ buy.drawDate }</td>
                <td>${ buy.lottoNumbers }</td>
                <td>
                    <input type="hidden" name="drawDate" value="${buy.drawDate}">
                    <input type="hidden" name="takeLottoNumber" value="${buy.lottoNumbers}">
                    <input type="submit" value="조회" class="button">
                </td>
            </tr>
        </form>
        <% buyNum++; %>
    </c:forEach>
</table>
</body>
</html>
