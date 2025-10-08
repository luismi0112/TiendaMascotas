<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="modelo.Cliente"%>
<%
Cliente cliente = (Cliente) request.getAttribute("cliente");
if (cliente == null) {
	response.sendRedirect("ClienteControlador?accion=listar");
	return;
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar Cliente</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap"
	rel="stylesheet">

<style>
:root {
	--primary: #007BFF;
	--danger: #dc3545;
	--bg-light: rgba(255, 255, 255, 0.25);
	--bg-form: rgba(255, 255, 255, 0.85);
	--radius: 16px;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Nunito', sans-serif;
	background: url('vista/accesorios-de-mascotas.png') no-repeat center
		center fixed;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
}

.container {
	width: 100%;
	max-width: 600px;
	background: var(--bg-light);
	backdrop-filter: blur(12px);
	-webkit-backdrop-filter: blur(12px);
	padding: 30px;
	border-radius: var(--radius);
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
}

h1 {
	text-align: center;
	color: var(--primary);
	margin-bottom: 20px;
	font-size: 24px;
}

label {
	font-weight: bold;
	display: block;
	margin-top: 15px;
	color: #333;
}

input[type="text"] {
	width: 100%;
	padding: 12px;
	margin-top: 6px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus {
	border-color: var(--primary);
	box-shadow: 0 0 6px rgba(0, 123, 255, 0.4);
	outline: none;
}

.buttons {
	margin-top: 25px;
	display: flex;
	justify-content: space-between;
}

input[type="submit"], a {
	text-decoration: none;
	text-align: center;
	background-color: var(--primary);
	color: white;
	padding: 12px 20px;
	border-radius: var(--radius);
	font-size: 16px;
	border: none;
	cursor: pointer;
	flex: 1;
	margin: 0 5px;
	transition: background-color 0.3s, transform 0.2s;
}

input[type="submit"]:hover, a:hover {
	background-color: #0056b3;
	transform: translateY(-2px);
}

a {
	display: inline-block;
	text-align: center;
	line-height: 22px;
}

.cancel {
	background-color: var(--danger);
}

.cancel:hover {
	background-color: #a71d2a;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Editar Cliente</h1>

		<form action="ClienteControlador" method="post">
			<input type="hidden" name="accion" value="Actualizar" /> <input
				type="hidden" name="id_cliente" value="<%=cliente.getId_cliente()%>" />

			<label>Nombre:</label> <input type="text" name="nombre"
				value="<%=cliente.getNombre()%>" required> <label>Apellido:</label>
			<input type="text" name="apellido" value="<%=cliente.getApellido()%>"
				required> <label>Cédula:</label> <input type="text"
				name="cedula" value="<%=cliente.getCedula()%>" required> <label>Dirección:</label>
			<input type="text" name="direccion"
				value="<%=cliente.getDireccion()%>" required> <label>Teléfono:</label>
			<input type="text" name="telefono" value="<%=cliente.getTelefono()%>"
				required>

			<div class="buttons">
				<input type="submit" value="Actualizar"> <a
					href="ClienteControlador?accion=listar" class="cancel">Cancelar</a>
			</div>
		</form>
	</div>
</body>
</html>
