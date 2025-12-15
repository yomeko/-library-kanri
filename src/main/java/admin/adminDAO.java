package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import model.Mutter;

public class adminDAO {

    private static final String JDBC_URL =
        "jdbc:mysql://localhost:3306/library-touroku?serverTimezone=Asia/Tokyo&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    // 本登録
    public boolean insert(Mutter mutter) {

        String sql = "INSERT INTO `list` (`book`, `number`) VALUES (?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setString(1, mutter.getBook());
                pstmt.setInt(2, mutter.getNumber());

                return pstmt.executeUpdate() == 1;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}