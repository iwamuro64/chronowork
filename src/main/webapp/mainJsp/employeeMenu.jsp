<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>従業員メニュー</title>
<link rel="stylesheet" href="javascript:void(0)">
<style>
.menu-container {
	text-align: center;
	margin-top: 50px;
}

.menu-container button {
	width: 200px;
	height: 50px;
	font-size: 18px;
	margin: 10px;
	cursor: pointer;
}

.menu-container h2 {
	font-size: 24px;
	margin-bottom: 20px;
}
</style>
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
		<div class="header">
			<!-- ヘッダーを挿入 -->
			<jsp:include page="../inc/employeeHeader.jsp" />
		</div>
	</header>

	<main>
		<div class="menu-container">
			<h2>
				ようこそ、<%=name%>さん！
			</h2>
			<!-- ユーザー名の表示 -->
			<!-- タイムカードボタン -->
			<form action="${pageContext.request.contextPath}/TimeCardServlet"
				method="get">
				<button type="submit">タイムカード</button>
			</form>


			<!-- 勤怠確認画面ボタン -->
			<form action="${pageContext.request.contextPath}/AttendanceCheckServlet"
				method="get">
				<button type="submit">勤怠確認</button>
			</form>

			<!-- 従業員マイページボタン -->
			<form
				action="${pageContext.request.contextPath}/EditAttendanceServlet"
				method="get">
				<button type="submit">従業員情報確認</button>
			</form>

			<!-- ログアウトボタン -->
			<form
				action="${pageContext.request.contextPath}/EmployeeLogoutServlet"
				method="post">
				<button type="submit">ログアウト</button>
			</form>
		</div>
	</main>

	<footer>
		<div style="text-align: center; padding: 10px;">
			<small>© 2025 CHRONOWORK.</small>
		</div>
	</footer>
</body>
</html>
