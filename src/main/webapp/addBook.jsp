<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: Talon
  Date: 2018-12-19
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    // 获取 loginsuccess.jsp 传来的值
    String id = (String)request.getParameter("id");

    // 操作数据库
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = null;
    java.lang.String strConn;
    java.sql.Statement sqlStmt = null;
    java.sql.ResultSet sqlRst = null;
    try {

        conn = java.sql.DriverManager.getConnection("jdbc:mysql://47.93.216.105/BMDB", "root", "991216");
        sqlStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


        // 执行 Sql 语句 查询可选书籍
        String sqlQuery = "select * from Book where Bid not in (select Bid from UB where id =" + id + ")";
        sqlRst = sqlStmt.executeQuery(sqlQuery);
%>
欢迎!<br>
<form name="book" action="addBook" method="post">
    <table>
    <%while (sqlRst.next()) {%>
    <tr>
        <td><input type="checkbox" name="checkbox-book" value=<%=(String)sqlRst.getString("Bid")%>></td>
        <td>书名：<%=sqlRst.getString("Bname")%></td>
        <td>作者：<%=sqlRst.getString("Author")%></td>
    </tr>
    <%}%>
    </table>
    <%--将当前用户 ID 传给 servlet--%>
    <input type="hidden" name="id" value=<%=id%>>
    <input type="submit" value="提交">
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
