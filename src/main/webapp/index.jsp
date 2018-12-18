<%@ page import="sun.print.PrinterJobWrapper" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Talon
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学生图书管理系统</title>
</head>
<body>
<header>
    <h2 align="center">图书管理系统</h2>
</header>
<form action="index.jsp" method="post" name="login-form">
    学号<input type="text" name="id" value=""><br>
    密码<input type="password" name="psw" value=""><br>
    <input type="button" value="注册" name="register">
    <input type="submit" value="登录" name="login">
</form>
</body>
<script src="test.js"></script>
</html>