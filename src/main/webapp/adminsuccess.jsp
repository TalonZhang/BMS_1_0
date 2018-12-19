<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-19
  Time: 下午10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理界面</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

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
        String sqlQuery = "select * from Book";
        sqlRst = sqlStmt.executeQuery(sqlQuery);
%>
<h2 align="center">图书管理</h2><br>
<h5>现有图书：</h5>
<table>
    <tr>
        <td>书号</td>
        <td>书名</td>
        <td>作者</td>
    </tr>
    <%while (sqlRst.next()) {%>
    <tr>
        <td><%=sqlRst.getString("Bid")%></td>
        <td><%=sqlRst.getString("Bname")%></td>
        <td><%=sqlRst.getString("Author")%></td>
    </tr>
    <%}%>
</table>
<a href="adminAddBook.jsp"><button>新增图书</button></a>
<a href="adminDelBook.jsp"><button>删除图书</button></a>
<%
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
