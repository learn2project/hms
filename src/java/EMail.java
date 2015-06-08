import java.security.Security;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class EMail
{
    String receiver;
    String msg;
    String sub;

    public void set(String r,String m,String s)
    {
        receiver=r;
        msg=m;
        sub=s;
        
    }
    public void execute()
    {
        try
        {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.debug", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator()
        {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                
                return new PasswordAuthentication("illumelabshospital@gmail.com","finalyearproject");
            }
        });
        session.setDebug(true);
        Transport transport = session.getTransport();
        InternetAddress addressFrom = new InternetAddress("Illume");
        MimeMessage message = new MimeMessage(session);
        message.setSender(addressFrom);

        for(int j=0;j<1;j++)
        {
            message.setSubject(sub);
            message.setContent(msg, "text/plain");
            String sendTo[]={receiver};
            //String sendTo [] = {"919477030174@bulletinmessenger.net"};
            //String sendTo [] = {"917278063878@msg.iridium.com"};
            if (sendTo != null)
            {
                InternetAddress[] addressTo = new InternetAddress[sendTo.length];
                for (int i = 0; i < sendTo.length; i++)
                {
                    addressTo[i] = new InternetAddress(sendTo[i]);
                }
                message.setRecipients(Message.RecipientType.TO, addressTo);
            }
            transport.connect();
            transport.send(message);
            transport.close();
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}