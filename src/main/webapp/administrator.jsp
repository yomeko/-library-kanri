<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/admin.css">
<meta charset="UTF-8">
<title>管理画面</title>

</head>
<body>
	<form action="Main" method="post">
		ID:<input type = "number" name = "id"><br>
		名前:<input type = "text" name = "name"><br>
		数量<input type = "number" name = "num">
		<input type = "submit" value = "登録">
		
	</form>
</body>
</html>