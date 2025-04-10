<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // セッションから管理者名を取得
    String adminName = (String) session.getAttribute("adminName");

    // ログインしていない場合はログイン画面へリダイレクト
    if (adminName == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>従業員管理</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="header">
        <jsp:include page="../inc/adminHeader.jsp" />
    </div>

    <div class="menu">
        <div class="main_frame">
            <h2>従業員追加</h2>
            <form action="EmployeeAddServlet" method="post" id="employeeAddForm">
                <table>
                    <tr>
                        <td><label for="addName">名前</label></td>
                        <td><input type="text" id="addName" name="addName" placeholder="名前" required></td>
                    </tr>
                    <tr>
                        <td><label for="addDepartment">部署</label></td>
                        <td><input type="text" id="addDepartment" name="addDepartment" placeholder="部署" required></td>
                    </tr>
                    <tr>
                        <td><label for="addPosition">役職</label></td>
                        <td><input type="text" id="addPosition" name="addPosition" placeholder="役職" required></td>
                    </tr>
                    <tr>
                        <td><label for="addEmploymentType">雇用形態</label></td>
                        <td><input type="text" id="addEmploymentType" name="addEmploymentType" placeholder="雇用形態" required></td>
                    </tr>
                    <tr>
                        <td><label for="addUserId">ユーザーID</label></td>
                        <td><input type="text" id="addUserId" name="addUserId" placeholder="ユーザーID" required></td>
                    </tr>
                    <tr>
                        <td><label for="addPassword">パスワード</label></td>
                        <td><input type="password" id="addPassword" name="addPassword" placeholder="パスワード" required></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="reset" value="リセット" class="button">
                            <input type="submit" value="確認" class="button">
                        </td>
                    </tr>
                </table>
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
