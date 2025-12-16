package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Book;

/**
 * 書籍テーブル(list)用DAO
 */
public class BookDAO {

    // DB接続情報
    private final String JDBC_URL = "jdbc:mysql://localhost/library-touroku";
    private final String DB_USER = "root";
    private final String DB_PASS = "";

    /**
     * 全件取得
     */
    public List<Book> findAll() {
        List<Book> bookList = new ArrayList<>();

        String sql = "SELECT book, number FROM list";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String name = rs.getString("book"); // ★修正
                int number = rs.getInt("number");

                Book bookObj = new Book(name, number);
                bookList.add(bookObj);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookList;
    }


    /**
     * 書籍名 部分一致検索
     */
    public List<Book> searchByName(String keyword) {
        List<Book> bookList = new ArrayList<>();

        String sql = "SELECT book, number FROM list WHERE book LIKE ?";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + keyword + "%");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String name = rs.getString("book"); // ★修正
                int number = rs.getInt("number");

                Book bookObj = new Book(name, number);
                bookList.add(bookObj);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookList;
    }

}