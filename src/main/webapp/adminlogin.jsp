<%--
  Created by IntelliJ IDEA.
  User: talon
  Date: 18-12-19
  Time: 下午10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    // 获取 admin.jsp 的值
    String psw = (String)request.getParameter("adminPsw");
    if(psw.equals("123456")) {
        response.sendRedirect("adminsuccess.jsp");
    }
%>
</body>
</html>
