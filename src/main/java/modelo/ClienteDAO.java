package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.ServletException;

public class ClienteDAO {

	public void crearCliente(Cliente cliente) throws ServletException {
		String sql = "INSERT INTO tbl_clientes (nombre, apellido, cedula, direccion, telefono) VALUES (?, ?, ?, ?, ?)";

		Connection dbConnection = Conexion.conectarBD();
		if (dbConnection == null) {
			System.err.println("Error: No se pudo establecer la conexión a la base de datos.");
		}

		try (PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setString(1, cliente.getNombre());
			pst.setString(2, cliente.getApellido());
			pst.setString(3, cliente.getCedula());
			pst.setString(4, cliente.getDireccion());
			pst.setString(5, cliente.getTelefono());

			pst.executeUpdate();

			crearcliente("¡¡ YUPI !!", "Se ah creado un nuevo registro, ve a verlo");

		} catch (SQLException e) {
			System.err.println("Error al registrar cliente: " + e.getMessage());
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
			System.err.println("Error al obtener clientes: " + e.getMessage());
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

	public void actualizarCliente(Cliente cliente) {
		String sql = "UPDATE tbl_clientes SET nombre = ?, apellido = ?, cedula = ?, direccion = ?, telefono = ? WHERE id_cliente = ?";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setString(1, cliente.getNombre());
			pst.setString(2, cliente.getApellido());
			pst.setString(3, cliente.getCedula());
			pst.setString(4, cliente.getDireccion());
			pst.setString(5, cliente.getTelefono());
			pst.setInt(6, cliente.getId_cliente());

			pst.executeUpdate();

		} catch (SQLException e) {
			System.err.println("Error al actualizar cliente: " + e.getMessage());
		}
	}

	public void eliminarCliente(int idCliente) throws ServletException {
		String sql = "DELETE FROM tbl_clientes WHERE id_cliente = ?";

		try (Connection dbConnection = Conexion.conectarBD();
				PreparedStatement pst = dbConnection.prepareStatement(sql)) {

			pst.setInt(1, idCliente);
			pst.executeUpdate();

			eliminarcliente("¡¡ CUIDADO !!", "Se ah eliminado un registro, ve a verlo");

		} catch (SQLException e) {
			System.err.println("Error al eliminar cliente: " + e.getMessage());

		}
	}

	public void crearcliente(String asunto, String mensaje) throws ServletException {

		final String username = "hacehambresiempre@gmail.com";
		final String password = "msjc infv myuj ofxk";
		final String receptor = "lozadaluisfontalvo@gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receptor));
			message.setSubject(asunto);
			message.setText(mensaje);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new ServletException(e);
		}

	}

	public void eliminarcliente(String asunto, String mensaje) throws ServletException {

		final String username = "hacehambresiempre@gmail.com";
		final String password = "msjc infv myuj ofxk";
		final String receptor = "lozadaluisfontalvo@gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receptor));
			message.setSubject(asunto);
			message.setText(mensaje);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new ServletException(e);
		}

	}

	public void descargarcertificado(String asunto, String mensaje) throws ServletException {

		final String username = "hacehambresiempre@gmail.com";
		final String password = "msjc infv myuj ofxk";
		final String receptor = "lozadaluisfontalvo@gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receptor));
			message.setSubject(asunto);
			message.setText(mensaje);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new ServletException(e);
		}
	}
}
