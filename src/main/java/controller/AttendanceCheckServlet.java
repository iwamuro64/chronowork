package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.AttendanceDAO;
import dto.AttendanceDTO;
import dto.EmployeeDTO;

@WebServlet("/AttendanceCheckServlet")
public class AttendanceCheckServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");

        if (employee == null) {
            response.sendRedirect("/mainJsp/employeeLogin.jsp");
            return;
        }

        try {
            // 現在の表示月（パラメータで受け取る or 今月）
            String yearMonthParam = request.getParameter("yearMonth");
            LocalDate baseDate = (yearMonthParam != null)
                    ? LocalDate.parse(yearMonthParam + "-01")
                    : LocalDate.now();

            int year = baseDate.getYear();
            int month = baseDate.getMonthValue();

            // 勤怠データを取得
            AttendanceDAO dao = new AttendanceDAO();
            List<AttendanceDTO> list = dao.getAttendanceByEmployeeAndMonth(employee.getEmployeeId(), year, month);

            if (list == null) {
                list = new ArrayList<>(); // null 対策
            }

            // 合計時間を計算
            Duration totalWork = Duration.ZERO;
            Duration totalOvertime = Duration.ZERO;

            for (AttendanceDTO dto : list) {
                if (dto.getClockIn() != null && dto.getClockOut() != null) {
                    // 稼働時間を計算
                    Duration work = Duration.between(dto.getClockIn(), dto.getClockOut());
                    totalWork = totalWork.plus(work);
                }

                // 残業時間が存在する場合
                if (dto.getOvertimeHours() != null && !dto.getOvertimeHours().isEmpty()) {
                    // 残業時間（HH:mm）をDurationに変換して計算
                    String[] parts = dto.getOvertimeHours().split(":");
                    int hours = Integer.parseInt(parts[0]);
                    int minutes = Integer.parseInt(parts[1]);
                    Duration overtime = Duration.ofHours(hours).plusMinutes(minutes);
                    totalOvertime = totalOvertime.plus(overtime);
                }
            }

            // 合計時間を HH:mm 形式に変換
            String totalWorkStr = String.format("%02d:%02d",
                    totalWork.toHours(), totalWork.toMinutesPart());

            String totalOvertimeStr = String.format("%02d:%02d",
                    totalOvertime.toHours(), totalOvertime.toMinutesPart());

            // リクエストにセット
            request.setAttribute("attendanceList", list);
            request.setAttribute("displayYearMonth", baseDate); // 年月を渡す
            request.setAttribute("totalWorkHours", totalWorkStr); // 稼働時間合計
            request.setAttribute("totalOvertimeHours", totalOvertimeStr); // 残業時間合計

            // JSPへフォワード
            request.getRequestDispatcher("/mainJsp/attendanceCheck.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
