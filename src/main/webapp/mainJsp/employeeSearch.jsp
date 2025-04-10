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
            <h2>従業員検索</h2>
            <form action="EmployeeSearchResultServlet" method="get">
                <table>
                    <tr>
                        <td><label for="employeeId">従業員ID</label></td>
                        <td><input type="text" id="employeeId" name="employeeId" placeholder="従業員ID"></td>
                    </tr>
                    <tr>
                        <td><label for="employeeName">名前</label></td>
                        <td><input type="text" id="employeeName" name="employeeName" placeholder="名前"></td>
                    </tr>
                    <tr>
                        <td><label for="department">部署</label></td>
                        <td><input type="text" id="department" name="department" placeholder="部署"></td>
                    </tr>
                    <tr>
                        <td><label for="position">役職</label></td>
                        <td><input type="text" id="position" name="position" placeholder="役職"></td>
                    </tr>
                    <tr>
                        <td><label for="employmentType">雇用形態</label></td>
                        <td><input type="text" id="employmentType" name="employmentType" placeholder="雇用形態"></td>
                    </tr>
                    <tr>
                        <td><label for="userId">ユーザーID</label></td>
                        <td><input type="text" id="userId" name="userId" placeholder="ユーザーID"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="reset" value="リセット" class="button"> <input type="submit" value="検索" class="button"></td>
                    </tr>
                </table>
            </form>

            <!-- TOPボタン -->
            <form action="adminMenu.jsp" method="get">
                <input type="submit" value="TOPに戻る" class="button">
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
