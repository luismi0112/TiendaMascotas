package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Mascota;
import modelo.MascotasDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/registrarmascotasSV")
public class registrarmascotasSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MascotasDAO mascotasDAO = new MascotasDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");
		if (accion == null) {
			accion = "listar";
		}

		try {
			switch (accion) {
			case "buscar":
				String filtro = request.getParameter("filtro");
				List<Mascota> mascotasFiltradas = mascotasDAO.buscarMascotas(filtro);
				request.setAttribute("mascotas", mascotasFiltradas);
				request.getRequestDispatcher("/vista/listarmascotas.jsp").forward(request, response);
				break;

			case "listar":
				List<Mascota> mascotas = mascotasDAO.obtenerTodos();
				request.setAttribute("mascotas", mascotas);
				request.getRequestDispatcher("/vista/listarmascotas.jsp").forward(request, response);
				break;

			case "nuevo":
				request.getRequestDispatcher("/vista/registrarmascotas.jsp").forward(request, response);
				break;

			case "editar":
				int idEditar = Integer.parseInt(request.getParameter("id"));
				Mascota mascotaEditar = mascotasDAO.obtenerPorId(idEditar);
				request.setAttribute("mascota", mascotaEditar);
				request.getRequestDispatcher("/vista/editarmascotas.jsp").forward(request, response);
				break;

			case "eliminar":
				int idEliminar = Integer.parseInt(request.getParameter("id"));
				mascotasDAO.eliminarMascota(idEliminar);
				response.sendRedirect("registrarmascotasSV?accion=listar");
				break;

			default:
				response.sendRedirect("registrarmascotasSV?accion=listar");
				break;
			}
		} catch (NumberFormatException e) {
			response.sendRedirect("registrarmascotasSV?accion=listar");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");

		if ("Registrar".equals(accion)) {
			try {
				Mascota mascota = new Mascota();
				mascota.setId_cliente(Integer.parseInt(request.getParameter("id_cliente"))); // nuevo
				mascota.setCodigo_identificacion(request.getParameter("codigo_identificacion")); // nuevo
				mascota.setNombre(request.getParameter("nombre"));
				mascota.setTipo(request.getParameter("tipo"));
				mascota.setGenero(request.getParameter("genero"));
				mascota.setRaza(request.getParameter("raza"));

				mascotasDAO.crearMascota(mascota);
				response.sendRedirect("registrarmascotasSV?accion=listar");
			} catch (NumberFormatException e) {
				System.err.println("Error en ID de cliente: " + e.getMessage());
				response.sendRedirect("registrarmascotasSV?accion=nuevo");
			}
		}
	}
}
