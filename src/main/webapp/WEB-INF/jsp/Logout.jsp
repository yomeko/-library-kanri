<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト用</title>
<link rel="stylesheet" href="CSS/index.css">
</head>
<body>

<h1>ログアウト</h1>

<!-- Logout.java に渡す -->
	<form action="Logout" method="post">
    	ユーザ名：<input type="text" name="name" required><br>
    	パスワード：<input type="password" name="pass" required><br>
    	<input type="submit" value="ログイン">
    	<a href="index.jsp">戻る</a>
	</form>
</body>
</html>