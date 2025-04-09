<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 鐘ケ江 -->
<!-- ヘッダー -->
<header>
	<div class="header_inline_block">
		<nav>
			<ul>
				<!-- ヘッダー左ロゴ (HOME)-->
				<li>
					<form action="${pageContext.request.contextPath}/MemberTopServlet" method="get">
						<button type="submit" name="action" value="home" class="logo-button">
							<img src="${pageContext.request.contextPath}/images/PhoenixTicketmembers.png" alt="会員ホームページへ">
						</button>
					</form>
				</li>
				<!-- ヘッダー右側 -->
				<div class="nav">
					<!-- ログアウト -->
					<li>
						<button
							onclick="location.href='${pageContext.request.contextPath}/LogoutConfirmation'">ログアウト</button>
					</li>
					<!-- マイページ -->
					<li>
						<button
							onclick="location.href='${pageContext.request.contextPath}/myPage'">マイページ</button>
					</li>
				</div>
			</ul>
		</nav>
	</div>
</header>