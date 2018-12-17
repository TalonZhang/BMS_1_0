<%@ page import="sun.print.PrinterJobWrapper" %>
<%@ page import="java.io.PrintWriter" %><%--
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
    try {
        conn = java.sql.DriverManager.getConnection("jdbc:mysql://47.93.216.105/BMDB", "root", "991216");
%>
连接数据库成功！
<%
    } catch (java.sql.SQLException e){
        System.out.println(e.toString());
//        out.println(e.toString());
    } finally {
        if (conn != null) conn.close();
    }
%>
</body>
</html>
