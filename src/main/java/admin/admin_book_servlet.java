package admin;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Mutter;

@WebServlet("/admin_book_servlet")
public class admin_book_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 登録画面表示
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/admin/admin_book.jsp");
        dispatcher.forward(request, response);
    }

    // 登録処理
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String bookName = request.getParameter("bookName");
        int number = Integer.parseInt(request.getParameter("number"));

        Mutter mutter = new Mutter(number, bookName);
        adminDAO dao = new adminDAO();

        boolean result = dao.insert(mutter);

        request.setAttribute("message",
                result ? "本を登録しました" : "登録に失敗しました");

        request.getRequestDispatcher(
                "/WEB-INF/admin/admin_book_result.jsp")
                .forward(request, response);
    }
}