package modelo;

public class Mascota {

	private int id_mascota;
	private int id_cliente;
	private String nombre;
	private String tipo;
	private String genero;
	private String raza;
	private String codigo_identificacion;

	public Mascota() {
	}

	public Mascota(int id_mascota, int id_cliente, String nombre, String tipo, String genero, String raza,
			String codigo_identificacion) {
		this.id_mascota = id_mascota;
		this.id_cliente = id_cliente;
		this.nombre = nombre;
		this.tipo = tipo;
		this.genero = genero;
		this.raza = raza;
		this.codigo_identificacion = codigo_identificacion;
	}

	public int getId_mascota() {
		return id_mascota;
	}

	public void setId_mascota(int id_mascota) {
		this.id_mascota = id_mascota;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getRaza() {
		return raza;
	}

	public void setRaza(String raza) {
		this.raza = raza;
	}

	public String getCodigo_identificacion() {
		return codigo_identificacion;
	}

	public void setCodigo_identificacion(String codigo_identificacion) {
		this.codigo_identificacion = codigo_identificacion;
	}
}
