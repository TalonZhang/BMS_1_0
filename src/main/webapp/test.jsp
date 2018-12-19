<%@ page import="sun.print.PrinterJobWrapper" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Talon
  Date: 2018-12-17
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = null;
    java.lang.String strConn;
    java.sql.Statement sqlStmt = null;
    java.sql.ResultSet sqlRst = null;
    try {
        conn = java.sql.DriverManager.getConnection("jdbc:mysql://47.93.216.105/BMDB", "root", "991216");
        sqlStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // 执行 Sql 语句
        String sqlQuery = "select Id,Name from User";
        sqlRst = sqlStmt.executeQuery(sqlQuery);
    } catch (java.sql.SQLException e){
        System.out.println(e.toString());
    } finally {
        if (sqlRst!=null) sqlRst.close();
        if (sqlStmt!=null) sqlStmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>
