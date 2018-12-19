<%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-19
  Time: 下午10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增图书</title>
</head>
<body>
<h2 align="center">新增图书</h2>
<h4>输入图书信息:</h4>
<form action="adminAddBook" method="post" name="form-adminAddBook">
    书号<input type="text" name="Bid"><br>
    书名<input type="text" name="Bname"><br>
    作者<input type="text" name="Author"><br>
    <input type="submit" value="添加">
</form>
</body>
</html>
