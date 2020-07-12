package apr_gestion.objetos;

import java.sql.Date;

public class Categoria {
	
 public int id_categoria;
 public int usu_id;
 public String categoria_nombre;
 public String categoria_tipo;
 public Date categoria_fecha;
 public String categoria_estado;
 
	
	// getter and setter
 
	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public int getUsu_id() {
		return usu_id;
	}
	public void setUsu_id(int usu_id) {
		this.usu_id = usu_id;
	}
	public String getCategoria_nombre() {
		return categoria_nombre;
	}
	public void setCategoria_nombre(String categoria_nombre) {
		this.categoria_nombre = categoria_nombre;
	}
	public String getCategoria_tipo() {
		return categoria_tipo;
	}
	public void setCategoria_tipo(String categoria_tipo) {
		this.categoria_tipo = categoria_tipo;
	}
	public Date getCategoria_fecha() {
		return categoria_fecha;
	}
	public void setCategoria_fecha(Date categoria_fecha) {
		this.categoria_fecha = categoria_fecha;
	}
	
	public String getCategoria_estado() {
		return categoria_estado;
	}
	public void setCategoria_estado(String categoria_estado) {
		this.categoria_estado = categoria_estado;
	}

}
