<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>打刻画面</title>
</head>
<body>
	<div class="menu">
		<div class="main_frame">
			<p>従業員用メニュー画面</p>
		</div>
	</div>
	<div class="main_wrapper">
		<div class="employee_button">
			<form action="${pageContext.request.contextPath}/TimeCardServlet"
				method="post">
				<input type="hidden" name="action" value="clock_in">
				<button type="submit" class="a_display_button">出勤</button>
			</form>
			<form action="${pageContext.request.contextPath}/TimeCardServlet"
				method="post">
				<input type="hidden" name="action" value="clock_out">
				<button type="submit" class="a_display_button">退勤</button>
			</form>
			<form action="${pageContext.request.contextPath}/TimeCardServlet"
				method="post">
				<input type="hidden" name="action" value="break_start">
				<button type="submit" class="a_display_button">休憩</button>
			</form>
			<form action="${pageContext.request.contextPath}/TimeCardServlet"
				method="post">
				<input type="hidden" name="action" value="break_end">
				<button type="submit" class="a_display_button">休憩終了</button>
			</form>
		</div>

	</div>
</body>
</html>