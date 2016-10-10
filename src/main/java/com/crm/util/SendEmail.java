package com.crm.util;

import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.SSLContext;

public class SendEmail
{
   public static void main(String [] args) throws NoSuchAlgorithmException
   {
      // 鏀朵欢浜虹數瀛愰偖绠?
      String to = "616935100@qq.com"
    		  ;

      // 鍙戜欢浜虹數瀛愰偖绠?
      String from = "1803240383@qq.com";

      // 鎸囧畾鍙戦€侀偖浠剁殑涓绘満涓?smtp.qq.com
      String host = "smtp.qq.com";  //QQ 閭欢鏈嶅姟鍣?
      Properties props = new Properties();
      props.put("mail.smtp.host", "smtp.qq.com"); //SMTP Host
      props.put("mail.smtp.ssl.enable","true");
      props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
      props.put("mail.smtp.socketFactory.class",
               "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
      props.put("mail.smtp.socketFactory.fallback", "false"); 
      props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
      props.put("mail.smtp.port", "465"); //SMTP Port
      // 鑾峰彇榛樿session瀵硅薄
      Session session = Session.getDefaultInstance(props,new Authenticator(){
	    public PasswordAuthentication getPasswordAuthentication()
	    {
	     System.out.println("enter");
	     return new PasswordAuthentication("1803240383@qq.com", "jufcbyzvuhfjddfg"); //鍙戜欢浜洪偖浠剁敤鎴峰悕銆佸瘑鐮?
	    }
	   });
      session.setDebug(true);
      try{
         // 鍒涘缓榛樿鐨?MimeMessage 瀵硅薄
         MimeMessage message = new MimeMessage(session);

         // Set From: 澶撮儴澶村瓧娈?
         message.setFrom(new InternetAddress(from));

         // Set To: 澶撮儴澶村瓧娈?
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(to));

         // Set Subject: 澶撮儴澶村瓧娈?
         message.setSubject("This is the Subject Line!");

         // 璁剧疆娑堟伅浣?
         message.setText("This is actual message");

         // 鍙戦€佹秷鎭?
         Transport.send(message);
         System.out.println("Sent message successfully....from w3cschool.cc");
      }catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
}