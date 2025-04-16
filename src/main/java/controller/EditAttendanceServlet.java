package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.AttendanceDAO;
import dto.AttendanceDTO;

@WebServlet("/EditAttendanceServlet")
public class EditAttendanceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int timecardId = Integer.parseInt(request.getParameter("id"));
        try {
            AttendanceDAO dao = new AttendanceDAO();
            AttendanceDTO dto = dao.findById(timecardId);
            request.setAttribute("attendance", dto);
            request.getRequestDispatcher("/mainJsp/editAttendance.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
