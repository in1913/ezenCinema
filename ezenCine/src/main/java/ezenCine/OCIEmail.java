package ezenCine;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class OCIEmail {
	 
    // Replace FROM with your "From" address.
    // This address must be added to Approved Senders in the console.
    static final String FROM = "admin@ezencinema.com";
    static final String FROMNAME = "EzenCinema";
 
    // Replace TO with a recipient address.
    //static final String TO = "1996vicky13@gmail.com";
 
    // Replace smtp_username with your Oracle Cloud Infrastructure SMTP username generated in console.
    static final String SMTP_USERNAME = "ocid1.user.oc1..aaaaaaaat5qleu6gmjvubhm6dehmc5mlntvzvb7gjy7x4s3dnthrirdyufva@ocid1.tenancy.oc1..aaaaaaaauu5a7rvyvwvgggjvdv5ram5kl6zqgbh2fbrt4vjckvjs6t5y3npq.ct.com";
 
    // Replace smtp_password with your Oracle Cloud Infrastructure SMTP password generated in console.
    static final String SMTP_PASSWORD = "!hAoq;8S:w>)qYG-CE10";
 
    // Oracle Cloud Infrastructure Email Delivery hostname.
    static final String HOST = "smtp.email.ap-chuncheon-1.oci.oraclecloud.com";
 
    // The port you will connect to on the SMTP endpoint. Port 25 or 587 is allowed.
    static final int PORT = 587;
 
    static final String SUBJECT = "[EzenCinema] 이메일 인증 메일입니다.";
    /*
    static final String BODY = String.join(
 
        System.getProperty("line.separator"),
        "<h1>Ezen Cinema</h1>",
        "<p>비밀번호 인증코드는 ",
        "<a href='Javamail'>https://github.com/javaee/javamail'>Javamail Package</a>",
       " for <a href='Javahttps://www.java.com'>Java</a>."
 
    );
    */
 
    public static void sendOCIEmail(String to, String oauthCode){
 
        // Create a Properties object to contain connection configuration information.
 
       Properties props = System.getProperties();
       props.put("mail.smtp.host", HOST);
       props.put("mail.transport.protocol", "smtp");
       props.put("mail.smtp.port", PORT);
 
       //props.put("mail.smtp.ssl.enable", "true"); //the default value is false if not set
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.auth.login.disable", "true");  //the default authorization order is "LOGIN PLAIN DIGEST-MD5 NTLM". 'LOGIN' must be disabled since Email Delivery authorizes as 'PLAIN'
       props.put("mail.smtp.starttls.enable", "true");   //TLSv1.2 is required
       props.put("mail.smtp.starttls.required", "true");  //Oracle Cloud Infrastructure required
 
        // Create a Session object to represent a mail session with the specified properties.
       Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
			}
		});
 
        // Create a message with the specified information.
       String receiver = to;
       String contents = "<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/gh/sunn-us/SUITE/fonts/static/woff2/SUITE.css\">\n"
       		+ "    <table style=\"margin-left: auto; margin-right: auto; margin-top: 60px;\">\n"
       		+ "        <tbody style=\"background-color: #fff;\">\n"
       		+ "            <tr style=\"width: 659px;\">\n"
       		+ "                <td>\n"
       		+ "                    <img src=\"https://filerun.ioracle.cloud/wl/?id=bYC0htkydnPAPaCxmYrT9APLCe9NYAyQ&fmode=open\" alt=\"email_top\" style=\"display: block;\">\n"
       		+ "                    <h1 style=\"text-align: center; margin-top: 60px; margin-bottom: 60px; width: 659px; letter-spacing: 30px; font-family: 'SUITE', sans-serif; font-size: 48px;\">" + oauthCode + "</h1>\n"
       		+ "                    <img src=\"https://filerun.ioracle.cloud/wl/?id=hrjxQOrZqD4uBBuw2cX7Csq7HicaMTRw&fmode=open\" alt=\"email_middle\" style=\"display: block; margin-bottom: 60px;\">\n"
       		+ "                    <img src=\"https://filerun.ioracle.cloud/wl/?id=kyHOf65j5uA0JQiptTTYEE3eujadYMEy&fmode=open\" alt=\"email_bottom\" style=\"display: block;\">\n"
       		+ "                </td>\n"
       		+ "                \n"
       		+ "            </tr>\n"
       		+ "        </tbody>\n"
       		+ "    </table>\n"
       		+ "";
       MimeMessage msg = new MimeMessage(session);
       try {
    	   msg.setFrom(new InternetAddress(FROM,FROMNAME, "utf-8"));
    	   msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
    	   msg.setSubject(SUBJECT);
    	   msg.setContent(contents,"text/html; charset=utf-8");
 
        // Create a transport.
    	   Transport.send(msg);
       }catch(Exception e) {
    	   e.printStackTrace();
       }
 
    }
 
}