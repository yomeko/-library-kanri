package admin;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class adminservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adminservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // フォーム値取得
        String idStr = request.getParameter("id");
        String book = request.getParameter("book");
        String numberStr = request.getParameter("number");

        // 未入力チェック
        if (idStr == null || idStr.isEmpty()
                || book == null || book.isEmpty()
                || numberStr == null || numberStr.isEmpty()) {

            request.setAttribute("error", "未入力の項目があります。すべて入力してください。");
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/administrator.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // 数値変換
        int id = Integer.parseInt(idStr);
        int number = Integer.parseInt(numberStr);

        // DAO実行
        adminDAO dao = new adminDAO();
        boolean success = dao.insert(id, book, number);

        // JSPへ結果を渡す
        request.setAttribute("success", success);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/jsp/admin_result.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/jsp_Result/administrator.jsp");
        dispatcher.forward(request, response);
    }
}