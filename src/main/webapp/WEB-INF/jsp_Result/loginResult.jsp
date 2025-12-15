<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="model.User" %>
<%
    User loginUser = (User)session.getAttribute("loginUser");

    // Userオブジェクトから名前を取り出す
    String userName = loginUser.getName();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書館管理システム</title>
<link rel="stylesheet" href="CSS/index.css">
</head>
<body>
<h1>ログイン画面</h1>
<% if (loginUser != null){ %>
	<p>ログインに成功しました</p>
	<a href="index.jsp">トップへ</a>
<% } else {%>
	<p>ログインに失敗しました</p>
	<a href="index.jsp">トップへ</a>		
<% } %>
</body>
</html>