<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*, modelo.Mascota"%>
<html>
<head>
<title>Lista de mascotas</title>
<style>
/* --- ESTILOS --- */
body {
	font-family: Arial, sans-serif;
	background-color: #f0f2f5;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1000px;
	margin: 50px auto;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
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
		<h1>Mascotas Registradas</h1>

		<!-- Botón para registrar nueva mascota -->
		<a href="registrarmascotasSV?accion=nuevo" class="btn">Registrar
			nueva mascota</a>

		<!-- Formulario de búsqueda -->
		<form action="registrarmascotasSV" method="get" class="search-box">
			<input type="hidden" name="accion" value="buscar"> <input
				type="text" name="filtro" placeholder="Buscar por ID o Nombre">
			<button type="submit">Buscar</button>
		</form>

		<!-- Tabla de mascotas -->
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Tipo</th>
					<th>Género</th>
					<th>Raza</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Mascota> mascotas = (List<Mascota>) request.getAttribute("mascotas");
				if (mascotas != null && !mascotas.isEmpty()) {
					for (Mascota m : mascotas) {
				%>
				<tr>
					<td><%=m.getId_mascota()%></td>
					<td><%=m.getNombre()%></td>
					<td><%=m.getTipo()%></td>
					<td><%=m.getGenero()%></td>
					<td><%=m.getRaza()%></td>
					<td class="acciones"><a
						href="registrarmascotasSV?accion=editar&id=<%=m.getId_mascota()%>"
						class="editar">Editar</a> <a
						href="registrarmascotasSV?accion=eliminar&id=<%=m.getId_mascota()%>"
						class="eliminar"
						onclick="return confirm('¿Estás seguro de eliminar esta mascota?');">Eliminar</a>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6" class="mensaje">No hay mascotas registradas</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
