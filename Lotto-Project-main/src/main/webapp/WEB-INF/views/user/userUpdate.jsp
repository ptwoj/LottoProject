<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post" action="/user/update">--%>
<%--    <input type="text" name="password">--%>
<%--    <input type="text" name="name">--%>
<%--    <input type="submit" value="update">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User Info</title>
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">

    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <script type="text/javascript">
        function validateForm() {
            var password = document.getElementById("form3Example4c").value;
            var confirmPassword = document.getElementById("form3Example4cd").value;

            // 비밀번호와 비밀번호 확인이 일치하는지 검사
            if (password !== confirmPassword) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }

            // 비밀번호 유효성 검사: 특수문자와 숫자를 포함해야 함
            var regex = /^(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?])(?=.*\d).{8,}$/;

            if (!regex.test(password)) {
                alert("비밀번호는 특수문자와 숫자를 포함하여 8자 이상이어야 합니다.");
                return false;
            }

            return true;
        }
    </script>
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
                                    Edit User Info</p>
                                <form class="mx-1 mx-md-4" method="post"
                                      action="/user/update"
                                      onsubmit="return validateForm();">
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="text"
                                                   id="form3Example1c"
                                                   name="name"
                                                   value="${name}"
                                                   class="form-control"
                                                   required/>
                                            <label class="form-label"
                                                   for="form3Example1c">Your
                                                Name</label>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="email"
                                                   id="form3Example3c"
                                                   name="email"
                                                   value="${email}"
                                                   class="form-control"
                                                   readonly/>
                                            <label class="form-label"
                                                   for="form3Example3c">Your
                                                Email</label>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <i class=" fas fa-lock fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="password"
                                                   id="form3Example4c"
                                                   name="password"
                                                   class="form-control"
                                                   pattern="^(?=.*[!@#$%^&*()_+\-=\[\]{};':\\|,.<>\/?])(?=.*\d).{8,}$"
                                                   title="비밀번호는 특수문자와 숫자를 포함하여 8자 이상이어야
                                            합니다." required/>
                                            <label class="form-label"
                                                   for="form3Example4c">Password</label>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="password"
                                                   id="form3Example4cd"
                                                   name="confirmPassword"
                                                   class="form-control"
                                                   required/>
                                            <label class="form-label"
                                                   for="form3Example4cd">Repeat
                                                your password</label>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button type="submit"
                                                class="btn btn-primary btn-lg">
                                            EditUserInfo
                                        </button>
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
</body>
</html>
