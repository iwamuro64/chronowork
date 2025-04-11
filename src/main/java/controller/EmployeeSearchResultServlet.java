package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.EmployeeSearchDAO;
import dto.EmployeeSearchDTO;

@WebServlet("/EmployeeSearchResultServlet")
public class EmployeeSearchResultServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 検索パラメータを取得
        String employeeId = request.getParameter("employeeId");
        String employeeName = request.getParameter("employeeName");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        String employmentType = request.getParameter("employmentType");
        String userId = request.getParameter("userId");

        // パラメータが空の場合、nullをセット（検索条件なしの場合も想定）
        if (employeeId == null) employeeId = "";
        if (employeeName == null) employeeName = "";
        if (department == null) department = "";
        if (position == null) position = "";
        if (employmentType == null) employmentType = "";
        if (userId == null) userId = "";

        // EmployeeSearchDAOで検索
        EmployeeSearchDAO employeeSearchDAO = new EmployeeSearchDAO();
        List<EmployeeSearchDTO> employees = null;
        
        try {
            employees = employeeSearchDAO.searchEmployees(employeeId, employeeName, department, position, employmentType, userId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 検索結果をリクエスト属性に設定
        request.setAttribute("employees", employees);

        // 結果を表示するJSPに転送
        RequestDispatcher dispatcher = request.getRequestDispatcher("/mainJsp/employeeSearchResult.jsp");
        dispatcher.forward(request, response);
    }
}
