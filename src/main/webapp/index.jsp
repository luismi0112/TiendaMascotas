<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Gestión de Clientes - Inicio</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 40px;
	background-color: #f0f2f5;
	color: #333;
}

h1 {
	color: #007BFF;
}

a, button {
	text-decoration: none;
	color: white;
	background-color: #007BFF;
	padding: 14px 25px;
	border-radius: 6px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	display: inline-block;
	margin: 8px 0;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

a:hover, button:hover {
	background-color: #0056b3;
	transform: translateY(-2px);
}

.container {
	max-width: 700px;
	margin: auto;
	text-align: center;
	background: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form {
	background: #f9f9f9;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	text-align: left;
	margin-top: 20px;
	border: 1px solid #ddd;
}

form label {
	font-weight: bold;
	color: #007BFF;
	display: block;
	margin-bottom: 6px;
	font-size: 14px;
}

form input[type="email"], form input[type="text"], form textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	box-sizing: border-box;
	margin-bottom: 15px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

form input:focus, form textarea:focus {
	border-color: #007BFF;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
	outline: none;
}

form textarea {
	resize: vertical;
}

form button {
	width: 100%;
	padding: 12px;
	font-size: 16px;
}
</style>
</head>
<body>

	<div class="container">
		<%
		//recuperar el usuario de la sesion
		String usuario = (String) session.getAttribute("nombre_usuario");
		//si no hay usuario logeado volver al login 
		if (usuario == null) {
			response.sendRedirect("login.jsp");
		}
		%>

		<!--mostrar el nombre del usuario-->
		<h1>
			Bienvenido a la Gestion de Clientes
			<%=usuario%></h1>
		<h2>Para comenzar, puedes:</h2>
		<p>
			<a href="ClienteControlador?accion=listar">Ver lista de clientes</a>
		</p>
		<p>
			<a href="ClienteControlador?accion=nuevo">Registrar cliente</a>
		</p>
		<p>
			<a href="TestConexion?accion=nuevo">Probar Conexion</a>
		</p>
		<p>
			<a href="ReporteClientespdf?accion=nuevo">Descargar Reporte PDF</a>
		</p>
		<p>
			<a href="CertificadoClientePDF?accion=nuevo">Descargar
				Certificado PDF</a>
		</p>

		<!--formulario para enviar correos-->
		<h2>Enviar Correo</h2>
		<form action="EnviarCorreosSV" method="post">
			<label for="destinatario">Destinatario:</label> <input type="email"
				id="destinatario" name="destinatario" required> <label
				for="asunto">Asunto:</label> <input type="text" id="asunto"
				name="asunto" required> <label for="mensaje">Mensaje:</label>
			<textarea id="mensaje" name="mensaje" rows="5" required></textarea>

			<button type="submit">Enviar Correo</button>
		</form>
		<form action="${pageContext.request.contextPath}/cerrarsesionSV"
			method="get">
			<button type="submit" style="background-color: #dc3545;">Cerrar
				sesión</button>
		</form>
	</div>
</body>
</html>
