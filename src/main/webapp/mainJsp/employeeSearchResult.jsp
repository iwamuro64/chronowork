<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // セッションから管理者名を取得
    String adminName = (String) session.getAttribute("adminName");

    // ログインしていない場合はログイン画面へリダイレクト
    if (adminName == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    // 検索結果を取得
    List<EmployeeSearchDTO> employees = (List<EmployeeSearchDTO>) request.getAttribute("employees");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>従業員検索結果</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="header">
        <jsp:include page="../inc/adminHeader.jsp" />
    </div>

    <div class="menu">
        <div class="main_frame">
            <h2>従業員検索結果</h2>

            <%-- 検索結果表示 --%>
            <%
                if (employees != null && !employees.isEmpty()) {
            %>
                <table border="1">
                    <tr>
                        <th>従業員ID</th>
                        <th>名前</th>
                        <th>部署</th>
                        <th>役職</th>
                        <th>雇用形態</th>
                        <th>ユーザーID</th>
                    </tr>
                    <% for (EmployeeSearchDTO employee : employees) { %>
                    <tr>
                        <td><%= employee.getEmployeeId() %></td>
                        <td><%= employee.getName() %></td>
                        <td><%= employee.getDepartment() %></td>
                        <td><%= employee.getPosition() %></td>
                        <td><%= employee.getEmploymentType() %></td>
                        <td><%= employee.getUserId() %></td>
                    </tr>
                    <% } %>
                </table>
            <%
                } else {
            %>
                <p>該当する従業員は見つかりませんでした。</p>
            <% 
                }
            %>

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
