<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>従業員情報画面</title>
<link rel="stylesheet" href="javascript:void(0)">
</head>
<body>
	<!-- セッションからユーザー名を取得して表示 -->
    <%
        String name = (String) session.getAttribute("employeeName");
        if (name == null) {
            response.sendRedirect("employeeLogin.jsp"); // セッションが無効な場合、login.jspにリダイレクト
            return;
        }
    %>
    
     <!-- ヘッダー -->
    <header>
        <div style="text-align:center; padding: 20px;">
            <h1>従業員情報</h1>
        </div>
    </header>
    
    <main>
    	<!-- 従業員情報編集ボタン -->
            <form action="${pageContext.request.contextPath}/EmployeeEditFormServlet" method="get">
                <input type="submit" value="従業員情報編集" class="menu_button">
            </form>
            
            <form action="${pageContext.request.contextPath}/mainJsp/employeeMenu.jsp" method="get">
                <input type="submit" value="戻る" class="button">
            </form>
    </main>
    
</body>
</html>
