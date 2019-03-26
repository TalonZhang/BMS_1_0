import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/adminDelBook")
public class adminDelBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("UTF-8");

            // 获取选的书籍
            String[] Bid = req.getParameterValues("del-book");


            // 操作数据库
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            java.sql.Connection conn = null;
            java.lang.String strConn;
            java.sql.Statement sqlStmt = null;
            try {

                conn = java.sql.DriverManager.getConnection("jdbc:mysql://47.93.216.105/BMDB", "root", "");
                sqlStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


                // 执行 Sql 语句 删除
                for (int i = 0; i < Bid.length;i++) {
                    String sqlQuery = "delete from Book where Bid = \""+Bid[i]+"\"";
                    sqlStmt.executeUpdate(sqlQuery);
                }
            } catch (java.sql.SQLException e){
                System.out.println(e.toString());
            } finally {
                if (sqlStmt!=null) {
                    try {
                        sqlStmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }


        resp.sendRedirect("adminsuccess.jsp");
    }
}
