package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.EmployeeAddDAO;
import dto.EmployeeDTO;

@WebServlet("/EmployeeAddServlet")
public class EmployeeAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 入力パラメータの取得
        String name = request.getParameter("addName");
        String department = request.getParameter("addDepartment");
        String position = request.getParameter("addPosition");
        String employmentType = request.getParameter("addEmploymentType");
        String userId = request.getParameter("addUserId");
        String password = request.getParameter("addPassword");

        // EmployeeDTOオブジェクトを作成
        EmployeeDTO employee = new EmployeeDTO();
        employee.setName(name);
        employee.setDepartment(department);
        employee.setPosition(position);
        employee.setEmploymentType(employmentType);
        employee.setUserId(userId);
        employee.setPassword(password);

        // EmployeeAddDAOを使ってDBに追加
        EmployeeAddDAO dao = new EmployeeAddDAO();
        boolean success = dao.addEmployee(employee);

        // 結果に基づいてリダイレクト
        if (success) {
            response.sendRedirect("employeeAddConfirmation.jsp?success=true");
        } else {
            response.sendRedirect("employeeAddConfirmation.jsp?success=false");
        }
    }
}