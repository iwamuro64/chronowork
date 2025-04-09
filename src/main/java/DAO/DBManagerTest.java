package DAO;

import java.sql.Connection;
import java.sql.SQLException;

public class DBManagerTest {
    public static void main(String[] args) {
        try {
            Connection conn = DBManager.getConnection();
            if (conn != null) {
                System.out.println("データベース接続成功！");
                conn.close();
            } else {
                System.out.println("データベース接続失敗！");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("データベース接続に失敗しました");
        }
    }
}
