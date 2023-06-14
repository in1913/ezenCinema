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
    static final String FROM = "admin@ioracle.cloud";
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
       		+ "    <div class=\"c-mail-view\" style=\"width: 100%;\n"
       		+ "    height: 100%;\n"
       		+ "    background-color: #fff;\">\n"
       		+ "\n"
       		+ "        <div class=\"c-mail-container\" style=\"width: 659px;\n"
       		+ "        padding-top: 60px;\n"
       		+ "        padding-bottom: 80px;\n"
       		+ "        margin-left: auto;\n"
       		+ "        margin-right: auto;\n"
       		+ "        margin-top: 46px;\n"
       		+ "        display: flex;\n"
       		+ "        flex-direction: column;\n"
       		+ "        align-items: center;\n"
       		+ "        color: #333333;\n"
       		+ "        font-family: 'SUITE', sans-serif;\">\n"
       		+ "            <img src=\"https://filerun.ioracle.cloud/wl/?id=UyS1fvL4EUgbvQs1AIbUBKKbXFrCrMKN&fmode=open\" alt=\"logo\" class=\"mail-logo\" style=\"width: 82.19px;\n"
       		+ "            height: 80px;\">\n"
       		+ "            <h2 style=\"margin-top: 30px;\n"
       		+ "            font-size: 35px;\n"
       		+ "            font-weight: 600;\">이메일 인증</h2>\n"
       		+ "            <p class=\"top\" style=\"margin-top: 15px;\n"
       		+ "            font-size: 24px;\">이메일 인증 화면에서 아래의 인증번호를 입력하고 인증을 완료해주세요.</p>\n"
       		+ "            <div class=\"code\" style=\"margin-top: 60px;\n"
       		+ "            font-size: 50px;\n"
       		+ "            font-weight: 500;\n"
       		+ "            letter-spacing: 30px;\n"
       		+ "            margin-bottom: 60px;\">\n"
       		+ "                " + oauthCode + "\n"
       		+ "            </div>\n"
       		+ "            <hr style=\"margin: 0;\n"
       		+ "            padding: 0;\n"
       		+ "            color: #ccc;\n"
       		+ "            border: 1px solid;\n"
       		+ "            width: 100%;\">\n"
       		+ "            <p class=\"middle\" style=\"margin-top: 20px;\n"
       		+ "            font-size: 18px;\n"
       		+ "            color: #878787;\n"
       		+ "            text-align: center;\n"
       		+ "            line-height: 30px;\n"
       		+ "            font-weight: 300;\n"
       		+ "            margin-bottom: 60px;\">이젠시네마는 앞으로도 더 나은 서비스를 드리기 위해 최선을 다하겠습니다. <br> 감사합니다.</p>\n"
       		+ "            <ul class=\"mail-list\" style=\"list-style:disc;\n"
       		+ "            margin: 0;\n"
       		+ "            padding: 0;\n"
       		+ "            width: 100%;\n"
       		+ "            color: #878787;\n"
       		+ "            padding-left: 30px;\">\n"
       		+ "                <li>이메일은 발신 전용으로 회신되지 않습니다.</li>\n"
       		+ "                <li>이메일 인증요청을 하지 않은 경우 무시해주시기 바랍니다.</li>\n"
       		+ "            </ul>\n"
       		+ "            <p class=\"copy\" style=\"width: 100%;\n"
       		+ "            padding-left: 7px;\n"
       		+ "            margin-top: 20px;\n"
       		+ "            color: #ccc;\">&copy; EZEN Cinema Inc.</p>\n"
       		+ "        </div>\n"
       		+ "    </div>";
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