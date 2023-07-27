<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">

    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<section class="vh-100" style="background-color: #eee;">
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">
                                    Login</p>
                                <form class="mx-1 mx-md-4" method="post" action="/user/login">
                                    <!-- 이메일 입력 부분 -->
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="email" id="form3Example3c" name="email" class="form-control"
                                                   required/>
                                            <label class="form-label" for="form3Example3c">Your Email</label>
                                        </div>
                                    </div>
                                    <!-- 비밀번호 입력 부분 -->
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="password" id="form3Example4c" name="password"
                                                   class="form-control" required/>
                                            <label class="form-label" for="form3Example4c">Password</label>
                                        </div>
                                    </div>
                                    <!-- Remember me 체크박스 -->
                                    <div class="form-check mb-4">
                                        <input class="form-check-input" type="checkbox" id="rememberMe"
                                               name="rememberMe" value="false"/>
                                        <label class="form-check-label" for="rememberMe">Remember me</label>
                                    </div>

                                    <!-- 로그인 버튼 -->
                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button type="submit" class="btn btn-primary btn-lg">Login</button>
                                    </div>
                                    <!-- Signup 링크 -->
                                    <div class="d-flex justify-content-between align-items-center">
                                        <a href="/user/signup" class="text-body">Go to Signup</a>
                                    </div>
                                </form>

                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                     class="img-fluid" alt="Sample image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    // 쿠키 저장 및 로그인 시 이메일 값 설정
    document.addEventListener("DOMContentLoaded", function () {
        var rememberMeCheckbox = document.getElementById("rememberMe");
        var emailInput = document.getElementById("form3Example3c");

        // 쿠키에 이메일 저장
        function setEmailCookie() {
            if (rememberMeCheckbox.checked) {
                document.cookie = "email=" + emailInput.value + "; expires=Thu, 1 Jan 2025 12:00:00 UTC; path=/";
            } else {
                document.cookie = "email=; expires=Thu, 1 Jan 1970 00:00:00 UTC; path=/;";
            }
        }

        // 이메일 쿠키 값 가져와서 입력 필드에 설정
        function setEmailFromCookie() {
            var cookies = document.cookie.split(";");
            for (var i = 0; i < cookies.length; i++) {
                var cookie = cookies[i].trim();
                if (cookie.indexOf("email=") === 0) {
                    emailInput.value = cookie.substring("email=".length, cookie.length);
                    rememberMeCheckbox.checked = true;
                    break;
                }
            }
        }

        // Remember me 체크박스 이벤트 리스너
        rememberMeCheckbox.addEventListener("change", setEmailCookie);

        // 페이지 로드 시 이메일 쿠키 값 설정
        setEmailFromCookie();
    });

    // 페이지 로드 시 체크박스 상태 확인 및 쿠키 삭제
    window.onload = function () {
        var rememberMeCheckbox = document.getElementById("rememberMe");
        var emailInput = document.getElementById("form3Example3c");

        // Remember me 체크박스 체크 여부 확인
        function checkRememberMe() {
            var cookies = document.cookie.split(";");
            for (var i = 0; i < cookies.length; i++) {
                var cookie = cookies[i].trim();
                if (cookie.indexOf("email=") === 0) {
                    rememberMeCheckbox.checked = true;
                    break;
                }
            }
        }

        // Remember me 체크박스 체크되지 않았을 때 쿠키 삭제
        function deleteEmailCookie() {
            document.cookie = "email=; expires=Thu, 1 Jan 1970 00:00:00 UTC; path=/;";
            emailInput.value = "";
        }

        // Remember me 체크박스 체크 여부 확인 및 쿠키 삭제
        checkRememberMe();
        if (!rememberMeCheckbox.checked) {
            deleteEmailCookie();
        }
    };

    // 로그아웃 시 체크박스 초기화
    function logout() {
        var rememberMeCheckbox = document.getElementById("rememberMe");
        rememberMeCheckbox.checked = false;
        deleteEmailCookie(); // Clear the email cookie as well
    }
</script>


</body>
</html>
