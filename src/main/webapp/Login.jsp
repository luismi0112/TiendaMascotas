<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>PetShop - Iniciar sesión</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap"
	rel="stylesheet">
<!-- Iconos Remix -->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css"
	rel="stylesheet">

<style>
:root {
	--primary: #007BFF;
	--accent: #17a2b8;
	--radius: 16px;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Nunito', sans-serif;
	background: url('vista/pet-shop-indoor-cartoon-illustration-vector.png')
		no-repeat center center fixed;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
}

.login-container {
	width: 100%;
	max-width: 380px;
	background: rgba(255, 255, 255, 0.25);
	backdrop-filter: blur(12px);
	-webkit-backdrop-filter: blur(12px);
	padding: 30px 25px;
	border-radius: var(--radius);
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
	text-align: center;
}

h2 {
	color: var(--primary);
	margin-bottom: 20px;
	font-size: 22px;
}

p {
	margin-bottom: 15px;
	color: #333;
	font-size: 14px;
}

.select-role {
	margin-bottom: 15px;
	text-align: left;
	font-weight: bold;
	color: var(--primary);
}

select, input[type="email"], input[type="password"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

select:focus, input:focus {
	border-color: var(--primary);
	box-shadow: 0 0 6px rgba(0, 123, 255, 0.4);
	outline: none;
}

input[type="submit"] {
	width: 100%;
	background-color: var(--accent);
	color: white;
	border: none;
	padding: 12px;
	border-radius: var(--radius);
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #138496;
}

.msg {
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 14px;
}

.msg.success {
	color: green;
}

.msg.error {
	color: red;
}
</style>
</head>
<body>

	<div class="login-container">
		<%
		String login = request.getParameter("login");
		if ("ok".equals(login)) {
		%>
		<p class="msg success">
			¡Bienvenido,
			<%=session.getAttribute("nombre_usuario")%>!
		</p>
		<%
		} else if ("fail".equals(login)) {
		%>
		<p class="msg error">Usuario o clave incorrectos</p>
		<%
		} else if ("error".equals(login)) {
		%>
		<p class="msg error">Error en el servidor</p>
		<%
		}
		%>

		<h2>
			<i class="ri-shield-user-line"></i> Iniciar sesión
		</h2>
		<form action="${pageContext.request.contextPath}/LoginSV"
			method="post">
			<div class="select-role">Seleccione su Rol</div>
			<select name="rol" required>
				<option value="Administrador">Administrador</option>
				<option value="Empleado">Empleado</option>
			</select> <input type="email" name="correo" placeholder="Correo electrónico"
				required> <input type="password" name="clave"
				placeholder="Contraseña" required> <input type="submit"
				value="Ingresar">
		</form>

		<%
		String logout = request.getParameter("logout");
		if ("ok".equals(logout)) {
		%>
		<p class="msg success">Sesión cerrada correctamente</p>
		<%
		}
		if ("rol_invalido".equals(request.getParameter("login"))) {
		%>
		<p class="msg error">Rol incorrecto para este usuario</p>
		<%
		}
		%>
	</div>

</body>
</html>
