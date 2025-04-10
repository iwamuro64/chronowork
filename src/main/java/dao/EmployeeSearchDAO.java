package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.EmployeeSearchDTO;

public class EmployeeSearchDAO {
    public List<EmployeeSearchDTO> searchEmployees(String employeeId, String employeeName, String department,
                                                   String position, String employmentType, String userId) {
        List<EmployeeSearchDTO> employees = new ArrayList<>();
        String sql = "SELECT * FROM employee WHERE 1=1";

        // 検索条件を追加
        if (employeeId != null && !employeeId.isEmpty()) {
            sql += " AND employee_id = ?";
        }
        if (employeeName != null && !employeeName.isEmpty()) {
            sql += " AND name LIKE ?";
        }
        if (department != null && !department.isEmpty()) {
            sql += " AND department LIKE ?";
        }
        if (position != null && !position.isEmpty()) {
            sql += " AND position LIKE ?";
        }
        if (employmentType != null && !employmentType.isEmpty()) {
            sql += " AND employment_type LIKE ?";
        }
        if (userId != null && !userId.isEmpty()) {
            sql += " AND user_id LIKE ?";
        }

        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int index = 1;
            if (employeeId != null && !employeeId.isEmpty()) {
                pstmt.setString(index++, employeeId);
            }
            if (employeeName != null && !employeeName.isEmpty()) {
                pstmt.setString(index++, "%" + employeeName + "%");
            }
            if (department != null && !department.isEmpty()) {
                pstmt.setString(index++, "%" + department + "%");
            }
            if (position != null && !position.isEmpty()) {
                pstmt.setString(index++, "%" + position + "%");
            }
            if (employmentType != null && !employmentType.isEmpty()) {
                pstmt.setString(index++, "%" + employmentType + "%");
            }
            if (userId != null && !userId.isEmpty()) {
                pstmt.setString(index++, "%" + userId + "%");
            }

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                EmployeeSearchDTO employee = new EmployeeSearchDTO();
                employee.setEmployeeId(rs.getInt("employee_id"));
                employee.setName(rs.getString("name"));
                employee.setDepartment(rs.getString("department"));
                employee.setPosition(rs.getString("position"));
                employee.setEmploymentType(rs.getString("employment_type"));
                employee.setUserId(rs.getString("user_id"));
                employees.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
}

