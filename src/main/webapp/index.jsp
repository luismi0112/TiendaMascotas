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
	padding: 10px 15px;
	border-radius: 4px;
	border: none;
	cursor: pointer;
	font-size: 14px;
	display: inline-block;
}

a:hover, button:hover {
	background-color: #0056b3;
}

.container {
	max-width: 600px;
	margin: auto;
	text-align: center;
	background: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="container">
		<h1>Bienvenido a la Gestión de Clientes</h1>
		<p>Para comenzar, puedes:</p>
		<p>
			<a href="ClienteControlador?accion=listar">Ver lista de clientes</a>
		</p>
		<p>O también puedes registrar un nuevo cliente:</p>
		<p>
			<a href="ClienteControlador?accion=nuevo">Registrar cliente</a>
		</p>
		<p>Para verificar si esta pagina esta enlacada a la base de Datos:</p>
		<p>
			<a href="TestConexion?accion=nuevo">Probar Conexion</a>
		</p>
		<p>Para descargar el reporte de los clientes registrados en PDF:</p>
		<p>
			<a href="ReporteClientespdf?accion=nuevo">Descargar Reporte PDF</a>
		</p>
		<p>Para descargar Certificado del cliente en PDF:</p>
		<p>
			<a href="CertificadoClientePDF?accion=nuevo">Descargar
				Certificado PDF</a>
		</p>
		<p>Click enviar un correo:</p>
		<form action="EnviarCorreosSV" method="post">

			<input type="hidden" name="destinatario"
				value="hacehambresiempre@gmail.com"> <input type="hidden"
				name="asunto" value="Correo de prueba"> <input type="hidden"
				name="mensaje"
				value="Este es un correo de prueba enviado desde la app de tienda de mascotas.">
			<button type="submit">Enviar Correo</button>
		</form>
	</div>
</body>
</html>
