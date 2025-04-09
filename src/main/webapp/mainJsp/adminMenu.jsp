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
    <title>管理者メニュー</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="header">
        <!-- ヘッダーを挿入 -->
            <jsp:include page="../inc/adminHeader.jsp" />
    </div>

    <div class="menu">
        <div class="main_frame">
            <h2>管理者メニュー</h2>

            <!-- 従業員情報管理ボタン -->
            <form action="EmployeeManagementServlet" method="get">
                <input type="submit" value="1．従業員情報管理" class="menu_button">
            </form>

            <!-- 他の管理機能のボタンもここに追加できます -->
            <!-- <form action="AnotherFunctionServlet" method="get">
                <input type="submit" value="2．別の管理機能" class="menu_button">
            </form> -->
        </div>
    </div>

    <div class="footer_design">
        <footer>
            <small>© 2025 CHRONOWORK.</small>
        </footer>
    </div>

</body>
</html>
