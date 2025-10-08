<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registrar Mascotas</title>

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
	background: url('vista/mascotas-preferidas-espanoles.png') no-repeat
		center center fixed;
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

input[type="text"], select {
	width: 100%;
	padding: 12px;
	margin-top: 6px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus, select:focus {
	border-color: var(--primary);
	box-shadow: 0 0 6px rgba(0, 123, 255, 0.4);
	outline: none;
}

.radio-group {
	margin-top: 6px;
	display: flex;
	gap: 20px;
}

.radio-group label {
	font-weight: normal;
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
		<h1>Registrar nueva Mascota</h1>

		<form action="registrarmascotasSV" method="post">
			<input type="hidden" name="accion" value="Registrar" /> <label>Cliente
				(ID):</label> <input type="text" name="id_cliente" required
				placeholder="Ingrese el ID del cliente"> <label>Código
				Identificación:</label> <input type="text" name="codigo_identificacion"
				required placeholder="Ej: CHIP-12345"> <label>Nombre:</label>
			<input type="text" name="nombre" required placeholder="Ej: Rocky">

			<label>Tipo de Mascota:</label> <select name="tipo" required>
				<option value="">-- Seleccione --</option>
				<option value="Perro">Perro</option>
				<option value="Gato">Gato</option>
				<option value="Ave">Ave</option>
				<option value="Reptil">Reptil</option>
				<option value="Otro">Otro</option>
			</select> <label>Género:</label>
			<div class="radio-group">
				<label><input type="radio" name="genero" value="Macho"
					required> Macho</label> <label><input type="radio"
					name="genero" value="Hembra"> Hembra</label>
			</div>

			<label>Raza:</label> <input type="text" name="raza" required
				placeholder="Ej: Labrador, Persa, etc.">

			<div class="buttons">
				<input type="submit" value="Registrar"> <a
					href="registrarmascotasSV?accion=listar" class="cancel">Cancelar</a>
			</div>
		</form>
	</div>

</body>
</html>
