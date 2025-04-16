<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
	<header>
		<div class="header">
			<!-- ヘッダーを挿入 -->
			<jsp:include page="../inc/employeeHeader.jsp" />
		</div>
	</header>
	<main>
		<h2>ログイン</h2>
		<form action="${pageContext.request.contextPath}/EmployeeLoginServlet"
			method="post">
			<div>
				<label for="user_id">ユーザーID：</label> <input type="text" id="user_id"
					name="user_id" required>
			</div>
			<div>
				<label for="password">パスワード：</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div>
				<button type="submit">ログイン</button>
			</div>
		</form>

		<%
		// エラーメッセージをリクエストから取得
		String error = (String) request.getAttribute("error");
		if (error != null) {
		%>
		<div style="color: red;">
			<p><%=error%></p>
			<!-- エラーメッセージを表示 -->
		</div>
		<%
		}
		%>

		<!-- 戻るボタン -->
		<a href="${pageContext.request.contextPath}/mainJsp/index.jsp">
			<button type="button">戻る</button>
		</a>
		</form>
	</main>
	<footer>
		<div style="text-align: center; padding: 10px;">
			<small>© 2025 CHRONOWORK.</small>
		</div>
	</footer>
</body>
</html>
