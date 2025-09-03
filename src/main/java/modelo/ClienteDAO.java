package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

	public boolean crearCliente(Cliente cliente) {
		String sql = "INSERT INTO tbl_clientes (nombre, apellido, cedula, direccion, telefono) VALUES (?, ?, ?, ?, ?)";

		Connection dbConnection = Conexion.conectarBD();
		if (dbConnection == null) {
			System.err.println("Error: No se pudo establecer la conexión a la base de datos.");
			return false;
		}

		try (PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setString(1, cliente.getNombre());
			pst.setString(2, cliente.getApellido());
			pst.setString(3, cliente.getCedula());
			pst.setString(4, cliente.getDireccion());
			pst.setString(5, cliente.getTelefono());

			return pst.executeUpdate() > 0;

		} catch (SQLException e) {
			System.err.println("Error al registrar cliente: " + e.getMessage());
			return false;
		} finally {
			try {
				dbConnection.close();
			} catch (SQLException e) {
				System.err.println("Error al cerrar la conexión: " + e.getMessage());
			}
		}
	}

	public List<Cliente> obtenerTodos() {
		List<Cliente> lista = new ArrayList<>();
		String sql = "SELECT id_cliente, nombre, apellido, cedula, direccion, telefono FROM tbl_clientes";

		Connection dbConnection = Conexion.conectarBD();
		if (dbConnection == null) {
			System.err.println("Error: No se pudo establecer la conexión a la base de datos.");
			return lista;
		}

		try (PreparedStatement pst = dbConnection.prepareStatement(sql); ResultSet rs = pst.executeQuery()) {

			while (rs.next()) {
				Cliente cliente = new Cliente(rs.getInt("id_cliente"), rs.getString("nombre"), rs.getString("apellido"),
						rs.getString("cedula"), rs.getString("direccion"), rs.getString("telefono"));
				lista.add(cliente);
			}

		} catch (SQLException e) {
			System.err.println("❌ Error al obtener clientes: " + e.getMessage());
		} finally {
			try {
				dbConnection.close();
			} catch (SQLException e) {
				System.err.println("Error al cerrar la conexión: " + e.getMessage());
			}
		}

		return lista;
	}

	public Cliente obtenerPorId(int idCliente) {
		String sql = "SELECT id_cliente, nombre, apellido, cedula, direccion, telefono FROM tbl_clientes WHERE id_cliente = ?";
		Cliente cliente = null;

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setInt(1, idCliente);

			try (ResultSet rs = pst.executeQuery()) {
				if (rs.next()) {
					cliente = new Cliente(rs.getInt("id_cliente"), rs.getString("nombre"), rs.getString("apellido"),
							rs.getString("cedula"), rs.getString("direccion"), rs.getString("telefono"));
				}
			}

		} catch (SQLException e) {
			System.err.println("Error al obtener cliente por ID: " + e.getMessage());
		}

		return cliente;
	}

	public boolean actualizarCliente(Cliente cliente) {
		String sql = "UPDATE tbl_clientes SET nombre = ?, apellido = ?, cedula = ?, direccion = ?, telefono = ? WHERE id_cliente = ?";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setString(1, cliente.getNombre());
			pst.setString(2, cliente.getApellido());
			pst.setString(3, cliente.getCedula());
			pst.setString(4, cliente.getDireccion());
			pst.setString(5, cliente.getTelefono());
			pst.setInt(6, cliente.getId_cliente());

			return pst.executeUpdate() > 0;

		} catch (SQLException e) {
			System.err.println("Error al actualizar cliente: " + e.getMessage());
			return false;
		}
	}

	public boolean eliminarCliente(int idCliente) {
		String sql = "DELETE FROM tbl_clientes WHERE id_cliente = ?";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setInt(1, idCliente);
			return pst.executeUpdate() > 0;

		} catch (SQLException e) {
			System.err.println("Error al eliminar cliente: " + e.getMessage());
			return false;
		}
	}
}
