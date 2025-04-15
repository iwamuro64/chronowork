package controller;

import java.io.IOException;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.TimeCardDAO;

@WebServlet("/TimeCardServlet")
public class TimeCardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("loginUser"); // ログインユーザー
        String action = request.getParameter("action");
        int employeeId = employee.getId(); // 例：ID取得

        LocalDateTime now = LocalDateTime.now();

        TimeCardDAO dao = new TimeCardDAO();
        switch (action) {
            case "clock_in":
                dao.insertClockIn(employeeId, now);
                break;
            case "clock_out":
                dao.updateClockOut(employeeId, now);
                break;
            case "break_start":
                dao.updateBreakStart(employeeId, now);
                break;
            case "break_end":
                dao.updateBreakEnd(employeeId, now);
                break;
        }

        response.sendRedirect("timeCard.jsp");
    }
}

