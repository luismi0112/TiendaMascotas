package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;

public class MascotasDAO {

	// Crear nueva mascota
	public void crearMascota(Mascota mascota) throws ServletException {
		String sql = "INSERT INTO tbl_mascotas (id_cliente, nombre, tipo, genero, raza, codigo_identificacion) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setInt(1, mascota.getId_cliente());
			pst.setString(2, mascota.getNombre());
			pst.setString(3, mascota.getTipo());
			pst.setString(4, mascota.getGenero());
			pst.setString(5, mascota.getRaza());
			pst.setString(6, mascota.getCodigo_identificacion());

			pst.executeUpdate();

		} catch (SQLException e) {
			System.err.println("Error al registrar mascota: " + e.getMessage());
		}
	}

	// Obtener todas las mascotas
	public List<Mascota> obtenerTodos() {
		List<Mascota> lista = new ArrayList<>();
		String sql = "SELECT id_mascota, id_cliente, nombre, tipo, genero, raza, codigo_identificacion FROM tbl_mascotas";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql);
				ResultSet rs = pst.executeQuery()) {

			while (rs.next()) {
				Mascota mascota = new Mascota(rs.getInt("id_mascota"), rs.getInt("id_cliente"), rs.getString("nombre"),
						rs.getString("tipo"), rs.getString("genero"), rs.getString("raza"),
						rs.getString("codigo_identificacion"));
				lista.add(mascota);
			}

		} catch (SQLException e) {
			System.err.println("Error al obtener mascotas: " + e.getMessage());
		}

		return lista;
	}

	// Obtener mascota por ID
	public Mascota obtenerPorId(int idMascota) {
		String sql = "SELECT id_mascota, id_cliente, nombre, tipo, genero, raza, codigo_identificacion FROM tbl_mascotas WHERE id_mascota = ?";
		Mascota mascota = null;

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setInt(1, idMascota);

			try (ResultSet rs = pst.executeQuery()) {
				if (rs.next()) {
					mascota = new Mascota(rs.getInt("id_mascota"), rs.getInt("id_cliente"), rs.getString("nombre"),
							rs.getString("tipo"), rs.getString("genero"), rs.getString("raza"),
							rs.getString("codigo_identificacion"));
				}
			}

		} catch (SQLException e) {
			System.err.println("Error al obtener mascota por ID: " + e.getMessage());
		}

		return mascota;
	}

	// Actualizar mascota
	public void actualizarMascota(Mascota mascota) {
		String sql = "UPDATE tbl_mascotas SET id_cliente = ?, nombre = ?, tipo = ?, genero = ?, raza = ?, codigo_identificacion = ? WHERE id_mascota = ?";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setInt(1, mascota.getId_cliente());
			pst.setString(2, mascota.getNombre());
			pst.setString(3, mascota.getTipo());
			pst.setString(4, mascota.getGenero());
			pst.setString(5, mascota.getRaza());
			pst.setString(6, mascota.getCodigo_identificacion());
			pst.setInt(7, mascota.getId_mascota());

			pst.executeUpdate();

		} catch (SQLException e) {
			System.err.println("Error al actualizar mascota: " + e.getMessage());
		}
	}

	// Eliminar mascota
	public void eliminarMascota(int idMascota) {
		String sql = "DELETE FROM tbl_mascotas WHERE id_mascota = ?";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setInt(1, idMascota);
			pst.executeUpdate();

		} catch (SQLException e) {
			System.err.println("Error al eliminar mascota: " + e.getMessage());
		}
	}

	// Buscar mascotas por ID o nombre
	public List<Mascota> buscarMascotas(String filtro) {
		List<Mascota> lista = new ArrayList<>();
		String sql;

		boolean esNumero = filtro.matches("\\d+");

		if (esNumero) {
			sql = "SELECT id_mascota, id_cliente, nombre, tipo, genero, raza, codigo_identificacion "
					+ "FROM tbl_mascotas WHERE id_mascota = ?";
		} else {
			sql = "SELECT id_mascota, id_cliente, nombre, tipo, genero, raza, codigo_identificacion "
					+ "FROM tbl_mascotas WHERE nombre LIKE ?";
		}

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			if (esNumero) {
				pst.setInt(1, Integer.parseInt(filtro));
			} else {
				pst.setString(1, "%" + filtro + "%");
			}

			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					Mascota mascota = new Mascota(rs.getInt("id_mascota"), rs.getInt("id_cliente"),
							rs.getString("nombre"), rs.getString("tipo"), rs.getString("genero"), rs.getString("raza"),
							rs.getString("codigo_identificacion"));
					lista.add(mascota);
				}
			}

		} catch (SQLException e) {
			System.err.println("Error al buscar mascota: " + e.getMessage());
		}

		return lista;
	}
}
