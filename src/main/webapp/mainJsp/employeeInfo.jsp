<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.EmployeeSearchDTO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>従業員情報表示</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

    <div class="menu">
        <div class="main_frame">
            <h2>従業員情報</h2>

            <!-- 従業員情報の表示 -->
            <table>
                <tr>
                    <th>名前</th>
                    <td><%= request.getAttribute("employeeName") %></td>
                </tr>
                <tr>
                    <th>部署</th>
                    <td><%= request.getAttribute("employeeDepartment") %></td>
                </tr>
                <tr>
                    <th>役職</th>
                    <td><%= request.getAttribute("employeePosition") %></td>
                </tr>
                <tr>
                    <th>雇用形態</th>
                    <td><%= request.getAttribute("employeeEmploymentType") %></td>
                </tr>
                <tr>
                    <th>ユーザーID</th>
                    <td><%= request.getAttribute("employeeUserId") %></td>
                </tr>
            </table>

            <br>

            <!-- 従業員情報編集ボタン -->
            <form action="${pageContext.request.contextPath}/EmployeeInfoUpdateServlet" method="get">
                <input type="hidden" name="employeeId" value="<%= request.getAttribute("employeeId") %>">
                <input type="submit" value="従業員情報編集" class="button">
            </form>

            <br>

            <!-- 従業員マイページに戻るボタン -->
            <form action="${pageContext.request.contextPath}/mainJsp/employeeMyPage.jsp" method="get">
                <input type="submit" value="従業員マイページに戻る" class="button">
            </form>
        </div>
    </div>

    <div class="footer_design">
        <footer>
            <small>© 2025 CHRONOWORK.</small>
        </footer>
    </div>
</body>
</html>
