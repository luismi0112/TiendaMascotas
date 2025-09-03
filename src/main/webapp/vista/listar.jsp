<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*, modelo.Cliente"%>
<html>
<head>
<title>Lista de Clientes</title>
</head>
<body>
	<h1>Clientes Registrados</h1>

	<a href="ClienteControlador?accion=nuevo">Registrar nuevo cliente</a>
	<br>
	<br>

	<table border="1" cellpadding="8">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Cédula</th>
				<th>Dirección</th>
				<th>Teléfono</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
			if (clientes != null && !clientes.isEmpty()) {
				for (Cliente c : clientes) {
			%>
			<tr>
				<td><%=c.getId_cliente()%></td>
				<td><%=c.getNombre()%></td>
				<td><%=c.getApellido()%></td>
				<td><%=c.getCedula()%></td>
				<td><%=c.getDireccion()%></td>
				<td><%=c.getTelefono()%></td>
				<td><a
					href="ClienteControlador?accion=editar&id=<%=c.getId_cliente()%>">Editar</a>
					| <a
					href="ClienteControlador?accion=eliminar&id=<%=c.getId_cliente()%>"
					onclick="return confirm('¿Estás seguro de eliminar este cliente?');">Eliminar</a>
				</td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="7">No hay clientes registrados.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>
