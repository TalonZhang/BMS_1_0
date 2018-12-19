import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/findPsw")
public class findPsw extends HttpServlet {

    public static final String HOST ="smtp.likole.com";
    public static final String USERNAME ="homeworkManager@likole.com";
    public static final String PASSWORD ="sFByrf6mnhPe1sYw";

    public static boolean sendMail(String to, String content) {

        Properties props = new Properties();
        props.put("mail.smtp.HOST", HOST);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "25");
        Session session = Session.getDefaultInstance(props,
                new Authenticator() {
                    @Override
                    public PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(USERNAME, PASSWORD);
                    }
                });

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(USERNAME));

            msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(to));
            msg.setSubject("找回密码");

            Multipart mp = new MimeMultipart();
            MimeBodyPart mbpContent = new MimeBodyPart();
            mbpContent.setContent(content, "text/html;charset=utf-8");
            mp.addBodyPart(mbpContent);
            msg.setContent(mp);
            msg.setSentDate(new Date());
            msg.saveChanges();

            //send
            Transport transport = session.getTransport("smtp");
            transport.connect(HOST, USERNAME, PASSWORD);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
        } catch (Exception mex) {
            mex.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取参数
        String id = req.getParameter("id");
        String email = req.getParameter("email");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
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

            // 发送邮件
            sendMail(email,"你好，"+name+"。你的密码为："+password);
        } catch (java.sql.SQLException e){
            System.out.println(e.toString());
        } finally {
            if (sqlRst!=null) {
                try {
                    sqlRst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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
        resp.sendRedirect("index.jsp");

    }

}


