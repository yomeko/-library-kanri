<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書館管理システム</title>
<link rel="stylesheet" href="CSS/index.css">
</head>

<body>

<h1>図書館管理システム</h1>

<!-- ログインユーザー表示 -->
<p>
ログイン中：
<%
    User user = (User) session.getAttribute("loginUser");
    if (user != null) {
        out.print(user.getName()); // 名前だけ表示
    } else {
        out.print("未ログイン");
    }
%>
</p>

<div class="menu-container">

    <form action="Login" method="get">
        <button type="submit">ログイン</button>
    </form>

    <form action="search" method="get">
        <button type="submit">一覧</button>
    </form>

    <form action="newAcount" method="get">
        <button type="submit">新規登録</button>
    </form>

    <form action="Logout" method="post">
        <button type="submit">ログアウト</button>
    </form>

</div>

<form action="deleteAcount" method="get" class="delete-floating">
    <button type="submit">アカウント削除</button>
</form>

</body>
</html>