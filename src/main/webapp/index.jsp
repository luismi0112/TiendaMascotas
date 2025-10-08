<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>PetShop Manager</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap"
	rel="stylesheet">
<!-- Iconos Remix -->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css"
	rel="stylesheet">

<style>
:root {
	--primary: #007BFF;
	--secondary: #17a2b8;
	--danger: #dc3545;
	--glass: rgba(255, 255, 255, 0.25);
	--form: rgba(255, 255, 255, 0.85);
	--radius: 16px;
	--text-dark: #333;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Quicksand', sans-serif;
	background:
		url('${pageContext.request.contextPath}/vista/istockphoto-992637094-612x612.png')
		no-repeat center center fixed;
	background-size: cover;
	min-height: 100vh;
	color: var(--text-dark);
}

/* Header */
header {
	background-color: var(--primary);
	color: white;
	padding: 20px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

header h1 {
	font-size: 24px;
	margin: 0;
}

nav a {
	color: white;
	text-decoration: none;
	margin-left: 20px;
	font-weight: bold;
	transition: color 0.3s;
}

nav a:hover {
	color: #d1ecf1;
}

/* Hero */
.hero {
	text-align: center;
	padding: 60px 20px;
	background: var(--glass);
	backdrop-filter: blur(12px);
	-webkit-backdrop-filter: blur(12px);
	margin: 40px auto;
	max-width: 900px;
	border-radius: var(--radius);
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
}

.hero h2 {
	font-size: 32px;
	color: var(--primary);
	margin-bottom: 10px;
}

.hero p {
	font-size: 18px;
	color: #444;
}

/* Services */
.services {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	padding: 40px;
	max-width: 1000px;
	margin: auto;
}

.service-card {
	background: var(--form);
	padding: 20px;
	border-radius: var(--radius);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.3s;
}

.service-card:hover {
	transform: translateY(-5px);
}

.service-card i {
	font-size: 32px;
	color: var(--primary);
	margin-bottom: 10px;
}

.service-card h3 {
	margin-bottom: 10px;
	color: var(--primary);
}

.service-card a {
	display: block;
	text-decoration: none;
	color: inherit;
}

/* Contact Form */
.contact {
	background: var(--form);
	padding: 30px;
	border-radius: var(--radius);
	max-width: 600px;
	margin: 60px auto;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.contact h3 {
	text-align: center;
	color: var(--primary);
	margin-bottom: 20px;
}

.contact label {
	display: block;
	margin-bottom: 6px;
	font-weight: bold;
	color: var(--primary);
}

.contact input, .contact textarea {
	width: 100%;
	padding: 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
}

.contact button {
	width: 100%;
	background-color: var(--secondary);
	color: white;
	border: none;
	padding: 12px;
	border-radius: var(--radius);
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.contact button:hover {
	background-color: #138496;
}

/* Footer */
footer {
	background-color: var(--primary);
	color: white;
	text-align: center;
	padding: 20px;
	margin-top: 40px;
}
</style>
</head>
<body>

	<header>
		<h1>
			<i class="ri-store-line"></i> Tienda de Mascotas Virtual
		</h1>
		<nav>
			<a
				href="${pageContext.request.contextPath}/ClienteControlador?accion=listar">Clientes</a>
			<a
				href="${pageContext.request.contextPath}/registrarmascotasSV?accion=nuevo">Mascotas</a>
			<a
				href="${pageContext.request.contextPath}/ReporteClientespdf?accion=nuevo">Reportes</a>
			<a
				href="${pageContext.request.contextPath}/CertificadoClientePDF?accion=nuevo">Certificados</a>
			<a href="#contacto">Contacto</a>
		</nav>
	</header>

	<section class="hero">
		<h2>Bienvenido a tu tienda de mascotas</h2>
		<p>Gestiona clientes, mascotas, reportes y certificados desde un
			entorno moderno y amigable.</p>
	</section>

	<section class="services">
		<div class="service-card">
			<a
				href="${pageContext.request.contextPath}/ClienteControlador?accion=listar">
				<i class="ri-user-3-line"></i>
				<h3>Ver Clientes</h3>
				<p>Consulta y administra la información de tus clientes
					registrados.</p>
			</a>
		</div>
		<div class="service-card">
			<a
				href="${pageContext.request.contextPath}/ClienteControlador?accion=nuevo">
				<i class="ri-user-add-line"></i>
				<h3>Registrar Cliente</h3>
				<p>Agrega nuevos clientes al sistema con sus datos completos.</p>
			</a>
		</div>
		<div class="service-card">
			<a
				href="${pageContext.request.contextPath}/registrarmascotasSV?accion=nuevo">
				<i class="ri-paw-line"></i>
				<h3>Registrar Mascota</h3>
				<p>Registra mascotas por tipo, raza, género y más.</p>
			</a>
		</div>
		<div class="service-card">
			<a
				href="${pageContext.request.contextPath}/ReporteClientespdf?accion=nuevo">
				<i class="ri-file-pdf-2-line"></i>
				<h3>Reporte PDF</h3>
				<p>Genera reportes detallados de clientes en formato PDF.</p>
			</a>
		</div>
		<div class="service-card">
			<a
				href="${pageContext.request.contextPath}/CertificadoClientePDF?accion=nuevo">
				<i class="ri-award-line"></i>
				<h3>Certificado PDF</h3>
				<p>Descarga certificados personalizados para tus clientes.</p>
			</a>
		</div>
		<div class="service-card">
			<a href="#contacto"> <i class="ri-mail-send-line"></i>
				<h3>Enviar Correo</h3>
				<p>Comunícate directamente con tus clientes desde el sistema.</p>
			</a>
		</div>
	</section>

	<section class="contact" id="contacto">
		<h3>
			<i class="ri-chat-3-line"></i> Contáctanos
		</h3>
		<form action="${pageContext.request.contextPath}/EnviarCorreosSV"
			method="post">
			<label for="destinatario">Correo destinatario:</label> <input
				type="email" id="destinatario" name="destinatario" required>

			<label for="asunto">Asunto:</label> <input type="text" id="asunto"
				name="asunto" required> <label for="mensaje">Mensaje:</label>
			<textarea id="mensaje" name="mensaje" rows="4" required></textarea>

			<button type="submit">
				<i class="ri-send-plane-line"></i> Enviar
			</button>
		</form>
	</section>

	<footer>
		<p>&copy; Tienda de mascotas Virtual 2025.</p>
	</footer>

</body>
</html>
