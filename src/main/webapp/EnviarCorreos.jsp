<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enviar Correo</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

form {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
}

input, textarea {
	width: 100%;
	padding: 8px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #007BFF;
	color: white;
	border: none;
	padding: 10px;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<form action="enviarCorreo" method="post">
		<h2>Enviar Correo</h2>
		<label>Destinatario:</label> <input type="email" name="destinatario"
			required> <label>Asunto:</label> <input type="text"
			name="asunto" required> <label>Mensaje:</label>
		<textarea name="mensaje" rows="5" required></textarea>

		<button type="submit">Enviar</button>
	</form>
</body>
</html>
