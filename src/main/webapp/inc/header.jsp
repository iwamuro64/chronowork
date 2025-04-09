<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ヘッダー -->
<header>
	<div class="header_inline_block">
		<nav>
			<ul>
				<!-- ヘッダー左ロゴ (HOME)-->
				<li>
					<form action="${pageContext.request.contextPath}/Index" method="get">
						<button type="submit" name="action" value="home" class="logo-button">
							<img src="${pageContext.request.contextPath}/images/PhoenixTicketLogo.png" alt="非会員ホームページへ">
						</button>
					</form>
				</li>
				<!-- ヘッダー右側 -->
				<div class="nav">
					<!-- ログイン -->
					<li>
						<button
							onclick="location.href='${pageContext.request.contextPath}/NonMemberLogin'">ログイン</button>
					</li>
					<!-- 新規登録 -->
					<li>
						<button
							onclick="location.href='${pageContext.request.contextPath}/NewUser'">新規登録</button>
					</li>
				</div>
			</ul>
		</nav>
	</div>
</header>
