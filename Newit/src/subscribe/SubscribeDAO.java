package subscribe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class SubscribeDAO
{
  private DataSource ds;
  private Connection conn;
  private PreparedStatement pstmt;
  private ResultSet rs;
  
  public SubscribeDAO() {
    try {
      Context ctx = new InitialContext();
      ds = (DataSource)ctx.lookup("java:comp/env/jdbc/new_pjt");
    } catch (Exception e) {
      e.printStackTrace();
    } 
  }

  
  public void close() {
    try {
      if (conn != null) conn.close(); 
      if (pstmt != null) pstmt.close(); 
      if (rs != null) rs.close(); 
    } catch (Exception e) {
      e.printStackTrace();
    } 
  }

	
  public void addSubscribe(SubscribeDTO dto) {
    try {
      conn = ds.getConnection();
      String sql = "insert into subscribe values(?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getName());
      pstmt.setString(2, dto.getEmail());
      pstmt.setString(3, dto.getMessage());
      pstmt.executeUpdate();
      
      sendMail(dto.getEmail(), dto.getName());
    }
    catch (Exception e) {
      e.printStackTrace();
    } finally {
      close();
    } 
  }
  
  
	public void sendMail(String email, String name) {
		String sender = "newitletter@gmail.com";
		String subject = "Newit 구독신청 확인 메일입니다";
		String content = name + "님 Newit을 구독해주셔서 감사합니다. 소식지는 매주 월요일마다 발송됩니다";

		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
			Authenticator auth = new GoogleAuthentication();
			Session session = Session.getDefaultInstance(properties, auth);
			Message message = new MimeMessage(session);
			Address senderAd = new InternetAddress(sender);
			Address receiverAd = new InternetAddress(email);
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(senderAd);
			message.addRecipient(RecipientType.TO, receiverAd);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new Date());
			Transport.send(message);
		} catch (Exception var13) {
			System.out.println("Error in SendEmail()");
			var13.printStackTrace();
		} finally {
			close();
		}
	}
}

class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth = new PasswordAuthentication("newitletter", "newit123*");

	public PasswordAuthentication getPasswordAuthentication() {
		return this.passAuth;
	}
}