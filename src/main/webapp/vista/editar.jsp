<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="modelo.Cliente"%>
<%
Cliente cliente = (Cliente) request.getAttribute("cliente");
if (cliente == null) {
	response.sendRedirect("ClienteControlador?accion=listar");
	return;
}
%>
<html>
<head>
<title>Editar Cliente</title>
</head>
<body>
	<h1>Editar Cliente</h1>

	<form action="ClienteControlador" method="post">
		<input type="hidden" name="accion" value="Actualizar" /> <input
			type="hidden" name="id_cliente"
			value="<%=cliente.getId_cliente()%>" /> <label>Nombre:</label><br>
		<input type="text" name="nombre" value="<%=cliente.getNombre()%>"
			required><br>
		<br> <label>Apellido:</label><br> <input type="text"
			name="apellido" value="<%=cliente.getApellido()%>" required><br>
		<br> <label>Cédula:</label><br> <input type="text"
			name="cedula" value="<%=cliente.getCedula()%>" required><br>
		<br> <label>Dirección:</label><br> <input type="text"
			name="direccion" value="<%=cliente.getDireccion()%>" required><br>
		<br> <label>Teléfono:</label><br> <input type="text"
			name="telefono" value="<%=cliente.getTelefono()%>" required><br>
		<br> <input type="submit" value="Actualizar"> <a
			href="ClienteControlador?accion=listar">Cancelar</a>
	</form>
</body>
</html>
