<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iniciar sesión</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(135deg, #4facfe, #00f2fe);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-container {
	background: #fff;
	padding: 30px 40px;
	border-radius: 12px;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
	width: 350px;
	text-align: center;
}

h2 {
	margin-bottom: 20px;
	color: #333;
}

p {
	margin-bottom: 20px;
	color: #333;
}

input[type="email"], input[type="password"], select {
	width: 100%;
	padding: 10px;
	margin: 8px 0 15px 0;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

input[type="submit"] {
	width: 100%;
	background: #4facfe;
	border: none;
	padding: 12px;
	border-radius: 6px;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease;
}

input[type="submit"]:hover {
	background: #00c6fb;
}

.msg {
	margin-bottom: 15px;
	font-weight: bold;
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
			¡Bienvenido!
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

		<h2>Iniciar sesión</h2>
		<form action="${pageContext.request.contextPath}/LoginSV"
			method="post">
			<p>seleccione su Rol</p>
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
		%>
		<%
		if ("rol_invalido".equals(request.getParameter("login"))) {
		%>
		<p class="msg error">Rol incorrecto para este usuario</p>
		<%
		}
		%>
	</div>

</body>
</html>
