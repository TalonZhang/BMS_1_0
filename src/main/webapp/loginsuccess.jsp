<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-18
  Time: 下午10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    // 获取用户ID
    String id = request.getParameter("id");

    // 操作数据库
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = null;
    java.lang.String strConn;
    java.sql.Statement sqlStmt = null;
    java.sql.ResultSet sqlRst = null,sqlRstName = null;
    try {
        conn = java.sql.DriverManager.getConnection("jdbc:mysql://47.93.216.105/BMDB", "root", "991216");
        sqlStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // 执行 Sql 语句
        String sqlQueryName = "select Name from User where id = \"" + id + "\"";
        sqlRstName = sqlStmt.executeQuery(sqlQueryName);
        sqlRstName.next();
        String name = sqlRstName.getString("Name");

        String sqlQuery = "select Book.Bid,Bname,Author from Book,UB where id = \"" + id + "\" and Book.Bid = UB.Bid";
        sqlRst = sqlStmt.executeQuery(sqlQuery);
%>
<h2 align="center"><%=name%>，欢迎登陆</h2><br>
<h5>已选图书：</h5>
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
<% String url1 = "addBook.jsp?id="+id;%>
<% String url2 = "delBook.jsp?id="+id;%>
<a href=<%=url1%>><button>添加图书</button></a>
<a href=<%=url2%>><button>删除图书</button></a>
<a href="index.jsp"><button>退出登录</button></a>
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
