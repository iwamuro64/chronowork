<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ログイン</title>
</head>
<body>
    <h2>ログイン</h2>
    <form action="${pageContext.request.contextPath}/EmployLoginServlet" method="post">
        <div>
            <label for="user_id">ユーザーID：</label>
            <input type="text" id="user_id" name="user_id" required>
        </div>
        <div>
            <label for="password">パスワード：</label>
            <input type="password" id="password" name="password" required>
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
        <p><%= error %></p>  <!-- エラーメッセージを表示 -->
    </div>
    <% } %>
</body>
</html>
