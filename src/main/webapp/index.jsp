<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書館管理システム</title>
<link rel="stylesheet" href="CSS/index.css">

<style>
.button-like {
    padding: 10px 20px;
    border: none;
    background-color: #3498db;
    color: white;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.2s;
}
.button-like:hover {
    background-color: #2980b9;
}
</style>

</head>
<body>

<h1>図書管理システム！</h1>

<table>
    <tr>
        <td>
            <button class="button-like" onclick="location.href='/jsp/Login.jsp'">
                ログイン
            </button>
        </td>

        <td>
            <button class="button-like" onclick="location.href='jsp/main.jsp'">
                一覧
            </button>
        </td>
    </tr>
    
    <tr>
        <td>
            <button class="button-like" onclick="location.href='newAcount.jsp'">
                新規登録
            </button>
        </td>

        <td>
            <button class="button-like" onclick="location.href='deleteAcount.jsp'">
                削除
            </button>
        </td>
    </tr>
</table>

</body>
</html>