package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.EmployeeSearchDAO;

@WebServlet("/EmployeeDeleteServlet")
public class EmployeeDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        try {
			EmployeeSearchDAO.deleteEmployee(employeeId);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}  // DAOのメソッドを呼び出して削除

        // 削除後、従業員検索結果ページにリダイレクト
        response.sendRedirect("/mainJsp/EmployeeSearchResult.jsp");
    }
}

