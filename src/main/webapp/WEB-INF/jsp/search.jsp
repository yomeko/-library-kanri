<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書検索</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/search.css">
</head>

<body>

<%
    String mode = (String) request.getAttribute("mode");
    String keyword = (String) request.getAttribute("keyword");
    if (keyword == null) keyword = "";
%>

<div class="wrapper">
    <div class="container">

        <!-- 左側：検索ボックス（常に表示） -->
        <div class="left">
            <h2>検索</h2>
            <form action="<%= request.getContextPath() %>/search" method="post">
                <label>書籍名</label>
                <input type="text" name="keyword" value="<%= keyword %>">
                <input type="submit" value="検索">
            </form>
        </div>

        <!-- 右側：全件 or 検索結果 -->
        <div class="right">
            <h2>
                <%= "search".equals(mode)
                        ? "検索結果（「" + keyword + "」）"
                        : "全件表示" %>
            </h2>

            <table>
                <tr>
                    <th>書籍名</th>
                    <th>冊数</th>
                </tr>

                <%
                    List<Book> bookList =
                        (List<Book>) request.getAttribute("bookList");

                    if (bookList != null && !bookList.isEmpty()) {
                        for (Book book : bookList) {
                %>
                <tr>
                    <td><%= book.getName() %></td>
                    <td><%= book.getNumber() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="2" class="no-data">
                        該当する書籍はありません
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>

    </div>
</div>

</body>
</html>