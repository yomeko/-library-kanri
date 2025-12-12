<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<title>管理画面</title>
<link rel="stylesheet" href="CSS/admin.css">
=======
    <link rel="stylesheet" href="CSS/index.css">
    
    <meta charset="UTF-8">
    <title>管理画面</title>
>>>>>>> bc50a6d50d5b88810bce309b0222d9aa7ba07963
</head>
<body>

<h1>図書館管理者画面</h1>

<<<<<<< HEAD
<!-- .javaに渡す -->
	<form action="Main" method="post">
		ID:<input type = "number" name = "id"><br>
		名前:<input type = "text" name = "name"><br>
		数量<input type = "number" name = "num">
		<input type = "submit" value = "登録">
		<a href="index.jsp">戻る</a>
	</form>
=======
<div class="menu-container">

	<form action="admin_book_servlet" method="get">
		<button type="submit">本登録</button>
	</form>

    <form action="admin_menber_servlet" method="get">
        <button type="submit">会員情報判定</button>
    </form>

    <form action="admin_book_lend_servlet" method="get">
        <button type="submit">本の貸出判定</button>
    </form>
</div>
>>>>>>> bc50a6d50d5b88810bce309b0222d9aa7ba07963
</body>
</html>