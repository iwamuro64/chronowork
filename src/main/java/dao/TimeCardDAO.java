package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class TimeCardDAO {
    // 出勤時間登録（新規レコード）
    public void insertClockIn(int employeeId, LocalDateTime clockInTime) {
        String sql = "INSERT INTO attendance (employee_id, work_date, clock_in) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, employeeId);
            stmt.setDate(2, Date.valueOf(clockInTime.toLocalDate()));
            stmt.setTimestamp(3, Timestamp.valueOf(clockInTime));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 退勤時間更新
    public void updateClockOut(int employeeId, LocalDateTime clockOutTime) {
        String sql = "UPDATE attendance SET clock_out = ? WHERE employee_id = ? AND work_date = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setTimestamp(1, Timestamp.valueOf(clockOutTime));
            stmt.setInt(2, employeeId);
            stmt.setDate(3, Date.valueOf(clockOutTime.toLocalDate()));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 休憩開始更新
    public void updateBreakStart(int employeeId, LocalDateTime breakStart) {
        String sql = "UPDATE attendance SET break_start = ? WHERE employee_id = ? AND work_date = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setTimestamp(1, Timestamp.valueOf(breakStart));
            stmt.setInt(2, employeeId);
            stmt.setDate(3, Date.valueOf(breakStart.toLocalDate()));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 休憩終了更新
    public void updateBreakEnd(int employeeId, LocalDateTime breakEnd) {
        String sql = "UPDATE attendance SET break_end = ? WHERE employee_id = ? AND work_date = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setTimestamp(1, Timestamp.valueOf(breakEnd));
            stmt.setInt(2, employeeId);
            stmt.setDate(3, Date.valueOf(breakEnd.toLocalDate()));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

