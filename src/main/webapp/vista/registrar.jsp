<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Registrar Cliente</title>
</head>
<body>
	<h1>Registrar Nuevo Cliente</h1>

	<form action="ClienteControlador" method="post">
		<input type="hidden" name="accion" value="Registrar" /> <label>Nombre:</label><br>
		<input type="text" name="nombre" required><br>
		<br> <label>Apellido:</label><br> <input type="text"
			name="apellido" required><br>
		<br> <label>Cédula:</label><br> <input type="text"
			name="cedula" required><br>
		<br> <label>Dirección:</label><br> <input type="text"
			name="direccion" required><br>
		<br> <label>Teléfono:</label><br> <input type="text"
			name="telefono" required><br>
		<br> <input type="submit" value="Registrar"> <a
			href="ClienteControlador?accion=listar">Cancelar</a>
	</form>
</body>
</html>
