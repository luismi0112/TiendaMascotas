<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Registrar Cliente</title>
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

input[type="text"] {
	width: 100%;
	padding: 12px;
	margin-top: 6px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 14px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus {
	border-color: #007BFF;
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
		<h1>Registrar Nuevo Cliente</h1>

		<form action="ClienteControlador" method="post">
			<input type="hidden" name="accion" value="Registrar" /> <label>Nombre:</label>
			<input type="text" name="nombre" required> <label>Apellido:</label>
			<input type="text" name="apellido" required> <label>Cédula:</label>
			<input type="text" name="cedula" required> <label>Dirección:</label>
			<input type="text" name="direccion" required> <label>Teléfono:</label>
			<input type="text" name="telefono" required>

			<div class="buttons">
				<input type="submit" value="Registrar"> <a
					href="ClienteControlador?accion=listar" class="cancel">Cancelar</a>
			</div>
		</form>
	</div>
</body>
</html>
