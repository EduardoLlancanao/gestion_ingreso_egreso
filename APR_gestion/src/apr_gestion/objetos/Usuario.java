package apr_gestion.objetos;

import java.sql.Date;

public class Usuario {
	
	int usu_id;
	int id_tipo_acceso;
	String usu_nombre;
	String usu_apellido;
	String usu_run;
	String usu_correo;
	String usu_pass;
	String usu_alias;
	Date usu_fecha;
	
	
	
	// Getters and Setters
	public int getUsu_id() {
		return usu_id;
	}
	public void setUsu_id(int usu_id) {
		this.usu_id = usu_id;
	}
	public int getId_tipo_acceso() {
		return id_tipo_acceso;
	}
	public void setId_tipo_acceso(int id_tipo_acceso) {
		this.id_tipo_acceso = id_tipo_acceso;
	}
	public String getUsu_nombre() {
		return usu_nombre;
	}
	public void setUsu_nombre(String usu_nombre) {
		this.usu_nombre = usu_nombre;
	}
	public String getUsu_apellido() {
		return usu_apellido;
	}
	public void setUsu_apellido(String usu_apellido) {
		this.usu_apellido = usu_apellido;
	}
	public String getUsu_run() {
		return usu_run;
	}
	public void setUsu_run(String usu_run) {
		this.usu_run = usu_run;
	}
	public String getUsu_correo() {
		return usu_correo;
	}
	public void setUsu_correo(String usu_correo) {
		this.usu_correo = usu_correo;
	}
	public String getUsu_pass() {
		return usu_pass;
	}
	public void setUsu_pass(String usu_pass) {
		this.usu_pass = usu_pass;
	}
	public String getUsu_alias() {
		return usu_alias;
	}
	public void setUsu_alias(String usu_alias) {
		this.usu_alias = usu_alias;
	}
	public Date getUsu_fecha() {
		return usu_fecha;
	}
	public void setUsu_fecha(Date usu_fecha) {
		this.usu_fecha = usu_fecha;
	}
	

}
