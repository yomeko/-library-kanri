package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class adminDAO {

    private final String JDBC_URL = "jdbc:mysql://localhost/library";
    private final String DB_USER = "root";
    private final String DB_PASS = "";

    // INSERT処理
    public boolean insert(int id, String book, int number) {

        String sql = "INSERT INTO list (id, book, number) VALUES (?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.setString(2, book);
            pstmt.setInt(3, number);

            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}