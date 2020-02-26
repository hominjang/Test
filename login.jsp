<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="login.css">
    </head>
    <body>
        <a class="login_logo" href="main.jsp"><img src="logo.jpg"></a>
        <div class="login_form">
            <form method="post" action="loginSelect.jsp" ><br><br><br><br> 아이디  : <input type="text" name="id"><br><br><br>비밀번호: <input type="password" name="password"><br><br><br><br><br><input class="submit" type="submit" value="로그인">
            </form>
        </div>
    </body>
</html>