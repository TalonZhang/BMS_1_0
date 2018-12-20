<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-18
  Time: 下午9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    if(id!=null) {
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = null;
        java.lang.String strConn;
        java.sql.Statement sqlStmt = null;
        java.sql.ResultSet sqlRst = null;
        try {
            conn = java.sql.DriverManager.getConnection("jdbc:mysql://47.93.216.105/BMDB", "root", "991216");
            sqlStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            // 执行 Sql 语句
            String sqlQuery = "insert into User value (\""+request.getParameter("id")+"\",\""+request.getParameter("name")+"\",\""+request.getParameter("psw")+"\")";
            sqlStmt.executeUpdate(sqlQuery);
        } catch (java.sql.SQLException e){
            System.out.println(e.toString());
        } finally {
            if (sqlRst!=null) sqlRst.close();
            if (sqlStmt!=null) sqlStmt.close();
            if (conn != null) conn.close();
        }
        response.sendRedirect("index.jsp");
    }

%>
<html>
<head>
    <title>注册</title>
</head>
<body>
<h2>欢迎注册图书管理系统</h2><br>
<form action="register.jsp" method="post" name="form-register">
    学号<input name="id" type="text">
    姓名<input name="name" type="text">
    密码<input name="psw" type="password">
    <input type="submit" value="注册">
</form>

</body>
</html>
