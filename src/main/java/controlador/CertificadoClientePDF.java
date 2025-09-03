package controlador;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import modelo.Conexion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/CertificadoClientePDF")
public class CertificadoClientePDF extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=CertificadoCliente.pdf");

		try {
			Document document = new Document();
			PdfWriter.getInstance(document, response.getOutputStream());
			document.open();

			Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK);
			Paragraph title = new Paragraph("CERTIFICADO", titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			title.setSpacingAfter(30);
			document.add(title);

			Font textFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);
			Paragraph contenido = new Paragraph("Se certifica que el cliente pertenece a la Tienda de Mascotas "
					+ "y se encuentra registrado en nuestra base de datos institucional.\n\n", textFont);
			contenido.setAlignment(Element.ALIGN_JUSTIFIED);
			contenido.setSpacingAfter(15);
			document.add(contenido);

			Paragraph constancia = new Paragraph("Este certificado se expide a solicitud del interesado, "
					+ "para los fines que considere pertinentes, y da fe de que los registros "
					+ "en la Tienda de Mascotas se encuentran debidamente actualizados.\n\n", textFont);
			constancia.setAlignment(Element.ALIGN_JUSTIFIED);
			constancia.setSpacingAfter(20);
			document.add(constancia);

			LocalDate fecha = LocalDate.now();
			Paragraph fechaParrafo = new Paragraph(
					"En constancia, se firma el presente certificado a los " + fecha + ".", textFont);
			fechaParrafo.setSpacingAfter(40);
			document.add(fechaParrafo);

			Paragraph firma = new Paragraph("________________________\nFirma autorizada", textFont);
			firma.setAlignment(Element.ALIGN_CENTER);
			document.add(firma);

			document.close();

		} catch (Exception e) {
			throw new ServletException("Error al generar el certificado PDF", e);
		}
	}
}
