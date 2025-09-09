package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Conexion;
import java.io.IOException;

@WebServlet("/TestConexion")
public class TestConexion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		String html = "<!DOCTYPE html>" + "<html>" + "<head>" + "<meta charset='UTF-8'>"
				+ "<title>Prueba de Conexión</title>" + "<style>"
				+ "body { font-family: Arial, sans-serif; background-color: #f0f2f5; text-align: center; padding-top: 100px;}"
				+ ".container { background: white; padding: 40px; border-radius: 10px; max-width: 500px; margin: auto;"
				+ "box-shadow: 0 4px 12px rgba(0,0,0,0.1);}" + "h1 { color: #007BFF; margin-bottom: 20px;}"
				+ ".success { color: green; font-size: 18px; font-weight: bold;}"
				+ ".error { color: red; font-size: 18px; font-weight: bold;}"
				+ "a { display:inline-block; margin-top:20px; text-decoration:none; background:#007BFF; color:white;"
				+ "padding:10px 20px; border-radius:6px; transition: background 0.3s;}"
				+ "a:hover { background:#0056b3;}" + "</style>" + "</head>" + "<body>" + "<div class='container'>"
				+ "<h1>Prueba de Conexión a la Base de Datos</h1>";

		if (Conexion.conectarBD() != null) {
			html += "<p class='success'>✅ Conectado correctamente a la base de datos.</p>";
		} else {
			html += "<p class='error'>❌ No se pudo conectar a la base de datos.</p>";
		}

		html += "<a href='index.jsp'>Volver al inicio</a>" + "</div></body></html>";

		response.getWriter().println(html);
	}
}
