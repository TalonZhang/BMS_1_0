import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.*;
import java.security.GeneralSecurityException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

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
            msg.setSubject("重置密码");

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
        sendMail("1026244428@qq.com","hahah");
//        // 收件人的电子邮件 ID
//        String to = "1015431793@qq.com";
//
//        // 发件人的电子邮件 ID
//        String from = "1026244428@qq.com";
//
//        // 假设您是从本地主机发送电子邮件
//        String host = "smtp.qq.com";
//
//        // 获取系统的属性
//        Properties properties = System.getProperties();
//
//        // wpmvhhbnkggvbdjg
//        // 设置邮件服务器
//        properties.setProperty("mail.smtp.host", host);
//
//        // 获取默认的 Session 对象
//        Session session = Session.getDefaultInstance(properties);
//
//        // 设置响应内容类型
//        resp.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = resp.getWriter();
//
//        try{
//            // 创建一个默认的 MimeMessage 对象
//            MimeMessage message = new MimeMessage(session);
//            // 设置 From: header field of the header.
//            message.setFrom(new InternetAddress(from));
//            // 设置 To: header field of the header.
//            message.addRecipient(Message.RecipientType.TO,
//                    new InternetAddress(to));
//            // 设置 Subject: header field
//            message.setSubject("This is the Subject Line!");
//            // 现在设置实际消息
//            message.setText("This is actual message");
//            // 发送消息
//            Transport.send(message);
//            String title = "发送电子邮件";
//            String res = "成功发送消息...";
//            String docType = "<!DOCTYPE html> \n";
//            out.println(docType +
//                    "<html>\n" +
//                    "<head><title>" + title + "</title></head>\n" +
//                    "<body bgcolor=\"#f0f0f0\">\n" +
//                    "<h1 align=\"center\">" + title + "</h1>\n" +
//                    "<p align=\"center\">" + res + "</p>\n" +
//                    "</body></html>");
//        }catch (MessagingException mex) {
//            mex.printStackTrace();
//        }
//        try {
//            Properties props = new Properties();
//
//            // 开启debug调试
//            props.setProperty("mail.debug", "true");
//            // 发送服务器需要身份验证
//            props.setProperty("mail.smtp.auth", "true");
//            // 设置邮件服务器主机名
//            props.setProperty("mail.host", "smtp.qq.com");
//            // props.setProperty("mail.port", "465");
//            // 发送邮件协议名称
//            props.setProperty("mail.transport.protocol", "smtp");
//
//
//            Session session = Session.getInstance(props);
//
//            Message msg = new MimeMessage(session);
//            msg.setSubject("邮件服务");
//            StringBuilder builder = new StringBuilder();
//            //            builder.append("url = " + "http://blog.csdn.net/never_cxb/article/details/50524571");
//            builder.append("\nhello qxl from ryan");
//            builder.append("\n时间 " + new Date());
//            msg.setText(builder.toString());
//            msg.setFrom(new InternetAddress("1026244428@qq.com"));
//
//            Transport transport = session.getTransport();
//            transport.connect("smtp.qq.com", "1026244428@qq.com", "tingnichangge.");
//
//            transport.sendMessage(msg, new Address[] { new InternetAddress("zhangkanghao@imudges.com") });
//
//            transport.close();
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//
//        req.setAttribute("message", "邮件上传成功");
//        req.getServletContext().getRequestDispatcher("/mailSendSucc.jsp").forward(req, resp);
//
    }

}


