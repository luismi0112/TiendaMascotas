<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="modelo.Mascota"%>
<%
Mascota mascota = (Mascota) request.getAttribute("mascota");
if (mascota == null) {
	response.sendRedirect("registrarmascotasSV?accion=listar");
	return;
}
%>
<html>
<head>
<title>Editar Mascota</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f2f5;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

h1 {
	text-align: center;
	color: #007BFF;
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	display: block;
	margin-top: 15px;
	color: #333;
}

input[type="text"], select {
	width: 100%;
	padding: 12px;
	margin-top: 6px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 14px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus, select:focus {
	border-color: #007BFF;
	box-shadow: 0 0 6px rgba(0, 123, 255, 0.4);
	outline: none;
}

.radio-group {
	margin-top: 6px;
}

.radio-group label {
	font-weight: normal;
	margin-right: 15px;
}

.buttons {
	margin-top: 25px;
	display: flex;
	justify-content: space-between;
}

input[type="submit"], a {
	text-decoration: none;
	text-align: center;
	background-color: #007BFF;
	color: white;
	padding: 12px 20px;
	border-radius: 6px;
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
	background-color: #dc3545;
}

.cancel:hover {
	background-color: #a71d2a;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Editar Mascota</h1>

		<form action="registrarmascotasSV" method="post">
			<input type="hidden" name="accion" value="Actualizar" /> <input
				type="hidden" name="id_mascota" value="<%=mascota.getId_mascota()%>" />

			<label>Nombre:</label> <input type="text" name="nombre"
				value="<%=mascota.getNombre()%>" required> <label>Tipo:</label>
			<select name="tipo" required>
				<option value="Perro"
					<%=mascota.getTipo().equals("Perro") ? "selected" : ""%>>Perro</option>
				<option value="Gato"
					<%=mascota.getTipo().equals("Gato") ? "selected" : ""%>>Gato</option>
				<option value="Ave"
					<%=mascota.getTipo().equals("Ave") ? "selected" : ""%>>Ave</option>
				<option value="Otro"
					<%=mascota.getTipo().equals("Otro") ? "selected" : ""%>>Otro</option>
			</select> <label>Género:</label>
			<div class="radio-group">
				<label><input type="radio" name="genero" value="Macho"
					<%=mascota.getGenero().equals("Macho") ? "checked" : ""%>>
					Macho</label> <label><input type="radio" name="genero"
					value="Hembra"
					<%=mascota.getGenero().equals("Hembra") ? "checked" : ""%>>
					Hembra</label>
			</div>

			<label>Raza:</label> <input type="text" name="raza"
				value="<%=mascota.getRaza()%>" required>

			<div class="buttons">
				<input type="submit" value="Actualizar"> <a
					href="registrarmascotasSV?accion=listar" class="cancel">Cancelar</a>
			</div>
		</form>
	</div>
</body>
</html>
