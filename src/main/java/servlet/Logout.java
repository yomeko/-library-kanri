package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher =
				request.getRequestDispatcher("WEB-INF/jsp/Logout.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ① セッション取得（なければ null）
		HttpSession session = request.getSession(false);

		// ② 強制ログアウト（セッション破棄）
		if (session != null) {
			session.invalidate();
		}

		// ③ ログアウト結果画面へ遷移
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("WEB-INF/jsp_Result/logoutResult.jsp");
		dispatcher.forward(request, response);
	}
}