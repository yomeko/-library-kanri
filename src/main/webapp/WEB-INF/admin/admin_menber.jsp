<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JDBC（java.sql.*）を使うための import -->
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/index.css">
<title>会員情報判定</title>
</head>
<body>

<h1>会員情報一覧</h1>

<%
    // =====================================================
    // 1. DB接続情報の設定
    // =====================================================
    // library-touroku データベースへ接続するための URL
    String url = "jdbc:mysql://localhost:3306/library-touroku?serverTimezone=JST";

    // ユーザー名（XAMPP のデフォルト）
    String user = "root";

    // パスワード（設定していなければ空文字）
    String pass = "";

    // JDBC の接続に使うオブジェクト
    Connection conn = null;         // DB との接続
    PreparedStatement ps = null;    // SQL を送る準備
    ResultSet rs = null;            // SQL の結果を受け取る箱

    try {

        // =====================================================
        // 2. MySQL JDBC Driver をロード
        // =====================================================
        // これがないと DriverManager が MySQL に繋げない
        Class.forName("com.mysql.cj.jdbc.Driver");

        // =====================================================
        // 3. DB に接続（実際に MySQL へ繋ぐ処理）
        // =====================================================
        conn = DriverManager.getConnection(url, user, pass);

        // =====================================================
        // 4. SQL（SELECT 文）を準備
        // =====================================================
        // user テーブルから name と pass を全件取得する
        String sql = "SELECT name, pass FROM user";

        // プリコンパイルされた SQL を DB に送る準備
        ps = conn.prepareStatement(sql);

        // SQL を実行し、結果を rs に格納
        rs = ps.executeQuery();
%>

<!-- =====================================================
     5. HTML のテーブルにデータを埋め込んで一覧表示
     ===================================================== -->
<table border="1">
    <tr>
        <th>名前</th>
        <th>パスワード</th>
    </tr>

<%
    while (rs.next()) {
        String nameVal = rs.getString("name");
        String nameVal1 = rs.getString("pass");
%>
    <tr>
        <td><%= nameVal %></td>
        <td><%= nameVal1 %></td>
    </tr>
<%
    }
%>
</table>

	<a href = "administrator.jsp">管理者画面に戻る</a>

<%
    } catch (Exception e) {

        // 例外が発生したらエラーメッセージを画面に表示
        out.println("エラー：" + e.getMessage());

    } finally {

        // =====================================================
        // 6. DB リソースを解放（重要）
        // Connection / PreparedStatement / ResultSet を閉じる
        // =====================================================
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>