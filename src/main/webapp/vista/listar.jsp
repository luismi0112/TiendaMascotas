<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*, modelo.Cliente"%>
<html>
<head>
<title>Lista de Clientes</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 40px;
	background: url('vista/4323-shutterstock_13122312712028129.png') no-repeat center center
		fixed;
	background-size: cover;
	color: #333;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.container {
	max-width: 1000px;
	width: 100%;
	background: rgba(255, 255, 255, 0.3);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}

h1 {
	text-align: center;
	color: #007BFF;
	margin-bottom: 20px;
}

.btn {
	text-decoration: none;
	background-color: #28a745;
	color: white;
	padding: 10px 18px;
	border-radius: 6px;
	font-size: 14px;
	transition: background-color 0.3s, transform 0.2s;
}

.btn:hover {
	background-color: #218838;
	transform: translateY(-2px);
}

.search-box {
	margin-top: 20px;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	gap: 10px;
}

.search-box input[type="text"] {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	width: 250px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

.search-box input[type="text"]:focus {
	border-color: #007BFF;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
	outline: none;
}

.search-box button {
	background-color: #007BFF;
	color: white;
	border: none;
	padding: 10px 18px;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.2s;
}

.search-box button:hover {
	background-color: #0056b3;
	transform: translateY(-2px);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	text-align: left;
	background: rgba(255, 255, 255, 0.85);
	border-radius: 8px;
	overflow: hidden;
}

table thead {
	background-color: #007BFF;
	color: white;
}

table th, table td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
}

table tr:hover {
	background-color: #f1f1f1;
}

.acciones a {
	text-decoration: none;
	padding: 6px 12px;
	border-radius: 6px;
	color: white;
	font-size: 13px;
	margin: 0 2px;
	transition: background-color 0.3s;
}

.editar {
	background-color: #ffc107;
}

.editar:hover {
	background-color: #e0a800;
}

.eliminar {
	background-color: #dc3545;
}

.eliminar:hover {
	background-color: #a71d2a;
}

.mensaje {
	text-align: center;
	margin-top: 20px;
	color: #555;
	font-style: italic;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Clientes Registrados</h1>

		<a href="ClienteControlador?accion=nuevo" class="btn">+ Registrar
			nuevo cliente</a>

		<form action="ClienteControlador" method="get" class="search-box">
			<input type="hidden" name="accion" value="buscar"> <input
				type="text" name="filtro" placeholder="Buscar por ID o Nombre">
			<button type="submit">Buscar</button>
		</form>

		<table>
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
					<td class="acciones"><a
						href="ClienteControlador?accion=editar&id=<%=c.getId_cliente()%>"
						class="editar">Editar</a> <a
						href="ClienteControlador?accion=eliminar&id=<%=c.getId_cliente()%>"
						class="eliminar"
						onclick="return confirm('¿Estás seguro de eliminar este cliente?');">Eliminar</a>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="7" class="mensaje">No hay clientes registrados</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
