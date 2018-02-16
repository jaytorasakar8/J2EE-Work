package com.mentor.email;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class bean {
final String from="yourEmail(Sender's)@gmail.com"; //From
final String userName="yourEmail(Sender's)";    // Gmail's usename which we generally type to login.
final String password="PASSWORD";  // Gmail's password.
   public  void sendEmail(String to, String subject, String msg) {

//to- Rec. Email, Subject- is subject in inbox, msg- is Msg you want to send.

      Properties properties = new Properties();
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.starttls.enable", "true");
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.port", "587");
      Session session = Session.getInstance(properties, new Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(userName, password);
          }
      });

      try {
         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(to));
         message.setSubject(subject);
         message.setText(msg);
         Transport.send(message);
      } catch (MessagingException e) {
         e.printStackTrace();
      }
   }
   
   public  void sendEmailPDF(String to, String subject, String msg,String path) {

//All params are same as above, path is file location which you want to send as an attatchment,
// *.PDF type is not mandetory. all types of file are allowed.
//If u want to send multiple files, change the last parameter to variable arguments
//and modify the following code (likewise wherever needed).

	      Properties properties = new Properties();
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.starttls.enable", "true");
	      properties.put("mail.smtp.host", "smtp.gmail.com");
	      properties.put("mail.smtp.port", "587");
	      Session session = Session.getInstance(properties, new Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(userName, password);
	          }
	      });


	      try {
	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(from));
	         message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(to));
	         message.setSubject(subject);

	         BodyPart part1=new MimeBodyPart();
	         part1.setText(msg);


	         File file=new File(path);
	         BodyPart part2=new MimeBodyPart();
	         DataSource attachment=new FileDataSource(file);
	         part2.setDataHandler(new DataHandler(attachment));
	         part2.setFileName(file.getName());


	         Multipart multiPart=new MimeMultipart();
	         multiPart.addBodyPart(part1);
	         multiPart.addBodyPart(part2);

	         message.setContent(multiPart);

	         Transport.send(message);
	        
	      } catch (MessagingException e) {
	        e.printStackTrace();;
	      }
	   }

}