package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dto.EmployeeSearchDTO;

public class EmployeeAddDAO {

    // 従業員情報を追加
    public static void addEmployee(EmployeeSearchDTO employee) throws SQLException {
        String sql = "INSERT INTO employees (name, department, position, employment_type, user_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, employee.getName());
            statement.setString(2, employee.getDepartment());
            statement.setString(3, employee.getPosition());
            statement.setString(4, employee.getEmploymentType());
            statement.setString(5, employee.getUserId());

            System.out.println("SQL Query: " + statement.toString());

            statement.executeUpdate(); // INSERT文を実行
        }
    }
}
