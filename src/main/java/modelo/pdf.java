package modelo;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import java.io.FileOutputStream;
import java.sql.*;

public class pdf {

    public static void main(String[] args) {
        Document document = new Document();

        try {
            PdfWriter.getInstance(document, new FileOutputStream("ReporteClientes.pdf"));
            document.open();

            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLUE);
            Paragraph title = new Paragraph("Reporte de Clientes Registrados", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(20);
            document.add(title);

            PdfPTable table = new PdfPTable(6);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            String[] headers = {"ID", "Nombre", "Apellido", "Cédula", "Dirección", "Teléfono"};
            for (String header : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(header));
                cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
            }

            Connection con = Conexion.conectarBD();
            if (con == null) {
                throw new RuntimeException("No se pudo conectar a la base de datos.");
            }

            String sql = "SELECT id_cliente, nombre, apellido, cedula, direccion, telefono FROM tbl_clientes";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                table.addCell(String.valueOf(rs.getInt("id_cliente")));
                table.addCell(rs.getString("nombre"));
                table.addCell(rs.getString("apellido"));
                table.addCell(rs.getString("cedula"));
                table.addCell(rs.getString("direccion"));
                table.addCell(rs.getString("telefono"));
            }

            con.close();

            document.add(table);

            document.close();

            System.out.println("PDF creado exitosamente: ReporteClientes.pdf");

        } catch (Exception e) {
            System.err.println("Error al generar el PDF: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
