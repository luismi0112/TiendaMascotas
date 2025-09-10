package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modelo.Conexion;

import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginSV")
public class LoginSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String correo = request.getParameter("correo");
		String clave = request.getParameter("clave");
		String rolIngresado = request.getParameter("rol");

		try (Connection conectarBD = Conexion.conectarBD()) {
			if (conectarBD != null) {

				String sql = "SELECT * FROM tbl_usuarios WHERE correo=? AND clave=?";
				PreparedStatement ps = conectarBD.prepareStatement(sql);
				ps.setString(1, correo);
				ps.setString(2, clave);

				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					String rolBD = rs.getString("rol");

					// validamos que el rol del formulario coincida con el de la BD
					if (rolBD.equalsIgnoreCase(rolIngresado)) {
						HttpSession sesion = request.getSession();
						sesion.setAttribute("nombre_usuario", rs.getString("nombre_usuario"));
						sesion.setAttribute("rol", rolBD);

						response.sendRedirect("index.jsp?login=ok");
					} else {
						// rol incorrecto
						response.sendRedirect("Login.jsp?login=rol_invalido");
					}
				} else {
					response.sendRedirect("Login.jsp?login=fail");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("Login.jsp?login=error");
		}
	}
}
