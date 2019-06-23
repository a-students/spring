package Until;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class MailUtil {
    private String email;
    private String code;

    public MailUtil(String email, String code) {
        this.email = email;
        this.code = code;
    }

    public boolean run() {
        String from = "chen2440836638@163.com";//发件人邮箱
        String host = "smtp.163.com";//指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
        Properties properties = System.getProperties();//获取系统属性
        properties.setProperty("mail.smtp.host", host);//设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");
        try {
            //QQ邮箱需要下面这段代码,163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);

            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                @Override
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("chen2440836638@163.com", "chen131456");//发件人邮箱账号,密码
                }
            });
            //创建邮件对象
            Message message = new MimeMessage(session);
            //设置发件人
            message.setFrom(new InternetAddress(from));
            //设置收件人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            //设置邮件主题
            message.setSubject("你的邮件到了");
            //邮件内容
            String content = "<html>" +
                    "<head>" +
                    "</head>" +
                    "<body>" +
                    "<h1>这是一封激活邮件,以下是你的激活码,可用于注册账号或者重置密码" +
                    "如非本人操作,请检查账号安全</h1>" +
                    "<h3>" +
                    "<span>"
                    + code +
                    "</span>"
                    + "</h3>" +
                    "</body>" +
                    "</html>";
            message.setContent(content, "text/html;charset=UTF-8");
            //发送邮件
            Transport.send(message);
            System.out.println("邮件成功发送!");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }


    }
}
