package modelo;

import modelo.Conexion;
import java.sql.Connection;

public class Test {
	public static void main(String[] args) {
		Connection conn = Conexion.conectarBD();
		if (conn != null) {
			System.out.println(" Conectado a la base de datos");
		} else {
			System.out.println(" Fallo al conectar a la base datos ");
		}
	}
}
