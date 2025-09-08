package controlador;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import modelo.Conexion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ReporteClientespdf")
public class ReporteClientespdf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//configuracion de la respuesta tipo pdf y descarga automatica
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=ReporteClientes.pdf");

		try {
			//crear documento pdf y vincular la salida http
			Document document = new Document();
			PdfWriter.getInstance(document, response.getOutputStream());
			document.open();

			//titulo del reporte
			Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK);
			Paragraph title = new Paragraph("Reporte de Clientes Registrados", titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			title.setSpacingAfter(20);//espacio  despues del titulo
			document.add(title);

			//crear tabla con 6 columnas
			PdfPTable table = new PdfPTable(6);
			table.setWidthPercentage(100);
			table.setSpacingBefore(10f);
			table.setSpacingAfter(10f);

			//encabezados de la tabla
			String[] headers = { "ID", "Nombre", "Apellido", "Cédula", "Dirección", "Teléfono" };
			for (String header : headers) {
				PdfPCell cell = new PdfPCell(new Phrase(header));
				cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell);
			}

			//Conectar la BD y obtener clientes
			Connection con = Conexion.conectarBD();
			String sql = "SELECT id_cliente, nombre, apellido, cedula, direccion, telefono FROM tbl_clientes";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			//llenar la tabla con los datos del cliente
			while (rs.next()) {
				table.addCell(String.valueOf(rs.getInt("id_cliente")));
				table.addCell(rs.getString("nombre"));
				table.addCell(rs.getString("apellido"));
				table.addCell(rs.getString("cedula"));
				table.addCell(rs.getString("direccion"));
				table.addCell(rs.getString("telefono"));
			}

			con.close();

			//agregar tabla al documento
			document.add(table);
			document.close();

		} catch (Exception e) {
			throw new ServletException("Error al generar el PDF", e);
		}
	}
}
