package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/cerrarsesionSV")
public class cerrarsesionSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Invalida la sesion actual
		HttpSession sesion = request.getSession(false);
		if (sesion != null) {
			sesion.invalidate();
		}

		// Redirige al login con un mensaje
		response.sendRedirect("Login.jsp?logout=ok");
	}
}
