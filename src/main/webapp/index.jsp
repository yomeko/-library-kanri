<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書館管理システム</title>
<link rel="stylesheet" href="CSS/index.css">
</head>

<body>

<h1>図書館管理システム</h1>

<div class="menu-container">

	<!-- ログイン画面(Login.jsp)に移動 -->
    <form action="Login" method="get">
        <button type="submit">ログイン</button>
    </form>
    
	<!-- 本の一覧画面(search.jsp)に移動 -->
    <form action="search" method="post">
        <button type="submit">一覧</button>
    </form>

	<!-- 新規登録画面(newAcount.jsp)に移動 -->
    <form action="newAcount" method="get">
        <button type="submit">新規登録</button>
    </form>

	<!-- 削除画面(deleteAcount.jsp)に移動 -->
    <form action="deleteAcount" method="get">
        <button type="submit">削除</button>
    </form>

</div>

</body>
</html>
