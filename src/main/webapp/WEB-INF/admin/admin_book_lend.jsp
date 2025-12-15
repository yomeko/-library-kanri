<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/index.css">
<title>本の貸出判定</title>

<style>
/* 最低限のテーブル装飾（CSSに移してもOK） */
table {
    border-collapse: collapse;
    width: 80%;
}
th, td {
    border: 1px solid #333;
    padding: 8px;
    text-align: center;
}
th {
    background-color: #f0f0f0;
}
</style>

</head>
<body>

<h1>本の貸出状況を見ます！</h1>

<%
    // =====================================================
    // 1. DB接続情報
    // =====================================================
    String url  = "jdbc:mysql://localhost:3306/library-touroku?serverTimezone=JST";
    String user = "root";
    String pass = "";

    // =====================================================
    // 2. JDBC用オブジェクト
    // =====================================================
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // =====================================================
        // 3. JDBCドライバロード
        // =====================================================
        Class.forName("com.mysql.cj.jdbc.Driver");

        // =====================================================
        // 4. DB接続
        // =====================================================
        conn = DriverManager.getConnection(url, user, pass);

        // =====================================================
        // 5. SQL準備
        // =====================================================
        String sql = "SELECT book, number FROM list";
        ps = conn.prepareStatement(sql);

        // =====================================================
        // 6. SQL実行
        // =====================================================
        rs = ps.executeQuery();
%>

<!-- ===== テーブル開始 ===== -->
<table>
    <tr>
        <th>本の名前</th>
        <th>貸出可能な数量</th>
        <th>判定</th>
    </tr>

<%
        // =====================================================
        // 7. 結果を1行ずつ表示
        // =====================================================
        while (rs.next()) {

            String bookName = rs.getString("book");
            int number = rs.getInt("number");

            String message = (number >= 1)
                    ? "貸出できます！"
                    : "貸出できません。";
%>

    <tr>
        <td><%= bookName %></td>
        <td><%= number %></td>
        <td><%= message %></td>
    </tr>

<%
        } // while終了
%>

</table>
<!-- ===== テーブル終了 ===== -->

<a href = "administrator.jsp">管理者画面に戻る</a>

<%
    } catch (Exception e) {
        out.println("<p style='color:red;'>エラー：" + e.getMessage() + "</p>");
    } finally {
        if (rs != null)   try { rs.close(); }   catch (Exception e) {}
        if (ps != null)   try { ps.close(); }   catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>

</body>
</html>