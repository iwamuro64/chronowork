package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dto.EmployeeDTO;

public class EmployeeAddDAO {
    public boolean addEmployee(EmployeeDTO employee) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        try {
            conn = DBManager.getConnection();
            
            String sql = "INSERT INTO employees (name, department, position, employment_type, user_id, password) "
                       + "VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, employee.getName());
            pstmt.setString(2, employee.getDepartment());
            pstmt.setString(3, employee.getPosition());
            pstmt.setString(4, employee.getEmploymentType());
            pstmt.setString(5, employee.getUserId());
            pstmt.setString(6, employee.getPassword());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return result;
    }
}
