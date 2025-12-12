package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.User;
import model_Logic.deleteAcountLogic;

@WebServlet("/deleteAcount")
public class deleteAcount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteAcount() {
        super();
    }

    // 削除確認画面を表示
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/jsp/deleteAcount.jsp");
        dispatcher.forward(request, response);
    }

    // 削除フォームを受け取って結果画面へ
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name"); // 削除するユーザー名
        String pass = request.getParameter("pass");
        
        User user = new User(name, pass);
        
        deleteAcountLogic deleteAcountLogic = new deleteAcountLogic();
        boolean isDelete = deleteAcountLogic.delete(user);
        
        if (isDelete) {
        	HttpSession session = request.getSession();
        	session.setAttribute("loginUser", user);
        	
        	System.out.println(user);
            System.out.println(name + pass);
        }
        
        request.setAttribute("isDelete", isDelete);
        request.setAttribute("user", user);

        // 実際に削除するなら DAO をここで呼ぶ
        // UserDAO dao = new UserDAO();
        // dao.delete(name);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/jsp_Result/deleteAcountResult.jsp");
        dispatcher.forward(request, response);
    }
}