package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminLogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションを無効化
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();  // セッションを無効化
        }

        // ログインページにリダイレクト
        response.sendRedirect("adminLogin.jsp");
    }
}
