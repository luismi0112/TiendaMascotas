package controlador;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;

@WebServlet("/ClienteControlador")
public class ClienteControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClienteDAO clienteDAO = new ClienteDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");
		if (accion == null)
			accion = "listar";

		switch (accion) {
		case "buscar":
			String filtro = request.getParameter("filtro");
			List<Cliente> clientesFiltrados = clienteDAO.buscarClientes(filtro);
			request.setAttribute("clientes", clientesFiltrados);
			request.getRequestDispatcher("/vista/listar.jsp").forward(request, response);
			break;

		case "listar":
			List<Cliente> clientes = clienteDAO.obtenerTodos();
			request.setAttribute("clientes", clientes);
			request.getRequestDispatcher("/vista/listar.jsp").forward(request, response);
			break;

		case "nuevo":
			request.getRequestDispatcher("/vista/registrar.jsp").forward(request, response);
			break;

		case "editar":
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				Cliente cliente = clienteDAO.obtenerPorId(id);
				request.setAttribute("cliente", cliente);
				request.getRequestDispatcher("/vista/editar.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				response.sendRedirect("ClienteControlador?accion=listar");
			}
			break;

		case "eliminar":
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				clienteDAO.eliminarCliente(id);
			} catch (NumberFormatException e) {

			}
			response.sendRedirect("ClienteControlador?accion=listar");
			break;

		default:
			response.sendRedirect("ClienteControlador?accion=listar");

		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");

		if ("Registrar".equals(accion)) {
			Cliente cliente = new Cliente();
			cliente.setNombre(request.getParameter("nombre"));
			cliente.setApellido(request.getParameter("apellido"));
			cliente.setCedula(request.getParameter("cedula"));
			cliente.setDireccion(request.getParameter("direccion"));
			cliente.setTelefono(request.getParameter("telefono"));

			clienteDAO.crearCliente(cliente);
			response.sendRedirect("ClienteControlador?accion=listar");

		} else if ("Actualizar".equals(accion)) {
			try {
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));

				Cliente cliente = new Cliente();
				cliente.setId_cliente(id_cliente);
				cliente.setNombre(request.getParameter("nombre"));
				cliente.setApellido(request.getParameter("apellido"));
				cliente.setCedula(request.getParameter("cedula"));
				cliente.setDireccion(request.getParameter("direccion"));
				cliente.setTelefono(request.getParameter("telefono"));

				clienteDAO.actualizarCliente(cliente);
			} catch (NumberFormatException e) {

			}
			response.sendRedirect("ClienteControlador?accion=listar");

		} else {
			response.sendRedirect("ClienteControlador?accion=listar");
		}
	}
}
