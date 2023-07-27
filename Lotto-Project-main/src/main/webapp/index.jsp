<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<%--<%--%>
<%--    String redirectURL = "/main";--%>
<%--    response.sendRedirect(redirectURL);--%>
<%--%>--%>
<%
    String redirectURL = "/user/login";
    response.sendRedirect(redirectURL);
%>
</body>
<%--<% if (session.getAttribute("email") == null) {%>--%>
<%--<a href="/user/signup">회원가입</a>--%>
<%--<a href="/user/login">로그인</a>--%>
<%--<% } else { %>--%>
<%--<a href="/user/update">정보 수정</a>--%>
<%--<a href="/user/logout">로그아웃</a>--%>
<%--<a href="/user/delete">회원 탈퇴</a>--%>
<%--<% } %>--%>
</html>
