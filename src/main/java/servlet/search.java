package servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.BookDAO;
import model.Book;

/**
 * 検索画面用Servlet
 */
@WebServlet("/search")
public class search extends HttpServlet {
	// doGet：初期表示（全件）
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    BookDAO dao = new BookDAO();
	    List<Book> bookList = dao.findAll();

	    request.setAttribute("bookList", bookList);
	    request.setAttribute("mode", "all"); // ★初期表示フラグ

	    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/search.jsp");
	    rd.forward(request, response);
	}

	// doPost：検索結果表示
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    request.setCharacterEncoding("UTF-8");

	    String keyword = request.getParameter("keyword");

	    BookDAO dao = new BookDAO();
	    List<Book> bookList = dao.searchByName(keyword);

	    request.setAttribute("bookList", bookList);
	    request.setAttribute("mode", "search"); // ★検索フラグ
	    
	    System.out.println("取得件数：" + bookList.size());
	    
	    request.setAttribute("keyword", keyword); // 表示用（任意）

	    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/search.jsp");
	    rd.forward(request, response);
	}
}