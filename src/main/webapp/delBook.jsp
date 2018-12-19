<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-19
  Time: 下午11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除图书</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    // 获取参数
    String id = request.getParameter("id");

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
        String sqlQuery = "select Book.Bid,Bname,Author from Book,UB where id = \"" + id + "\" and Book.Bid = UB.Bid";
        sqlRst = sqlStmt.executeQuery(sqlQuery);
%>
<h2 align="center">删除图书</h2><br>
<h5>已选图书：</h5>
<form action="delBook" method="post">
    <table>
        <%while (sqlRst.next()) {%>
        <tr>
            <td><input type="checkbox" name="del-book" value=<%=sqlRst.getString("Bid")%>></td>
            <td><%=sqlRst.getString("Bid")%></td>
            <td><%=sqlRst.getString("Bname")%></td>
            <td><%=sqlRst.getString("Author")%></td>
        </tr>
        <%}%>
    </table>
    <input type="hidden" name="id" value=<%=id%>>
    <input type="submit" value="删除">
</form>
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
