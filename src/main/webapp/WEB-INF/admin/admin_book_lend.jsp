<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/index.css">
<title>本の貸出判定</title>
</head>
<body>
<!-- 絶対条件　数量が１冊以上なら貸出できますと出力させること　本の名前　と　貸出可能な数量を出すこと -->
<h1>本の貸出状況を見ます！</h1>

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
        String sql = "SELECT book, number FROM list";

        // プリコンパイルされた SQL を DB に送る準備
        ps = conn.prepareStatement(sql);

        // SQL を実行し、結果を rs に格納
        rs = ps.executeQuery();
        
     	// 取得したデータを 1 件ずつ画面に表示
        while (rs.next()) {

            // 本の名前
            String bookName = rs.getString("book");

            // 数量（0 → 貸出不可）
            int number = rs.getInt("number");

            // 貸出判定
            String message = (number >= 1)
                ? "貸出できます！"
                : "貸出できません。";
%>

<!-- --- ▼ 結果の表示部分 ▼ --- -->
<hr>
<p>本の名前：<strong><%= bookName %></strong></p>
<p>貸出可能な数量：<strong><%= stock %></strong> 冊</p>
<p>判定：<span style="color: blue;"><%= message %></span></p>

<%
      	  } // while 終了

    	} catch (Exception e) {
        	out.println("エラー：" + e.getMessage());
    	} finally {
        	// ▼ DB クローズ
        	if (rs != null) try { rs.close(); } catch (Exception e) {}
        	if (ps != null) try { ps.close(); } catch (Exception e) {}
        	if (conn != null) try { conn.close(); } catch (Exception e) {}
    	}
%>
</body>
</html>
