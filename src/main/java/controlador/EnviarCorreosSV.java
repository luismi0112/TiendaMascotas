package controlador;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EnviarCorreosSV")
public class EnviarCorreosSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String destinatario = request.getParameter("destinatario");
		String asunto = request.getParameter("asunto");
		String mensajeTexto = request.getParameter("mensaje");

		final String username = "hacehambresiempre@gmail.com";
		final String password = "msjc infv myuj ofxk";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
			message.setSubject(asunto);
			message.setText(mensajeTexto);

			Transport.send(message);
			response.getWriter().println("Correo enviado con éxito a " + destinatario);

		} catch (MessagingException e) {
			throw new ServletException(e);
		}
	}
}
