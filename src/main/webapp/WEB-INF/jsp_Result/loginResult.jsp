<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>

<%
    User loginUser = (User) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書館管理システム</title>
<link rel="stylesheet" href="CSS/index.css">
</head>
<body>
<h1>ログイン結果</h1>

<% if (loginUser != null) { 
       String userName = loginUser.getName();
%>
    <p>ログインに成功しました</p>
    <p>ようこそ、<%= userName %> さん</p>
    <form action="mainservlet" method="get">
    <a href="main.jsp">ホームへ</a>
    </form>
<% } else { %>
    <p>ログインに失敗しました</p>
    <a href="index.jsp">トップへ</a>
<% } %>

</body>
</html>
