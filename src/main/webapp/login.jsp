<%@ page import="sun.security.util.Password" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-18
  Time: 下午9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    // 获取 index.jsp 的值
    String id = (String)request.getParameter("id");
    String psw = (String)request.getParameter("psw");

    // 操作数据库
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = null;
    java.lang.String strConn;
    java.sql.Statement sqlStmt = null;
    java.sql.ResultSet sqlRst = null;
    try {
        conn = java.sql.DriverManager.getConnection("jdbc:mysql://47.93.216.105/BMDB", "root", "991216");
        sqlStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // 执行 Sql 语句
        String sqlQuery = "select Name,Psw from User where Id = " + id;
        sqlRst = sqlStmt.executeQuery(sqlQuery);
        sqlRst.next();
        String password = sqlRst.getString("Psw");
        String name = sqlRst.getString("Name");
        // 判断密码是否正确
        if (psw.equals(password)) {
            response.sendRedirect("loginsuccess.jsp?id=" + id);
        }
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
