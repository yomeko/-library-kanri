<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン用</title>
<link rel="stylesheet" href="CSS/index.css">
</head>
<body>

<<<<<<< HEAD
	<h1>ログイン</h1>
=======
<h1>ログイン</h1>

<!-- Login.java に渡す -->
<form action="Login" method="post">
    ユーザ名：<input type="text" name="username" required><br><br>
    パスワード：<input type="password" name="password" required><br><br>
    <input type="submit" value="ログイン">
</form>

<br>

<a href="index.jsp">戻る</a>
>>>>>>> bc50a6d50d5b88810bce309b0222d9aa7ba07963

<!-- Login.javaに渡す -->
	<form action="Login" method="post">
    	ユーザー名 : <input type="text" name="name"><br>
    	パスワード : <input type="password" name="pass"><br>
    	<input type="submit" value="ログイン">
    	<a href="index.jsp">戻る</a>
	</form>
</body>
</html>