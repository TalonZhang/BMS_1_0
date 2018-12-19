<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-19
  Time: 下午10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理</title>
</head>
<body>
请输入管理员密码
<form action="adminlogin.jsp" method="post" name="form-admin">
    <input type="password" name="adminPsw">
    <input type="submit" value="登录">
</form>
</body>
</html>
