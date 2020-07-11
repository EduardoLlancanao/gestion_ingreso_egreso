package apr_gestion.objetos;

import java.sql.Date;

public class Cuenta {
	
	int id_cuenta;
	String cuenta_nombre;
	String cuenta_numero;
	String cuenta_tipo;
	String cuenta_corresponde;
	Date cuenta_fecha;
	String cuenta_estado;
	
	
//	getter and setter
	public int getId_cuenta() {
		return id_cuenta;
	}
	public void setId_cuenta(int id_cuenta) {
		this.id_cuenta = id_cuenta;
	}
	public String getCuenta_nombre() {
		return cuenta_nombre;
	}
	public void setCuenta_nombre(String cuenta_nombre) {
		this.cuenta_nombre = cuenta_nombre;
	}
	public String getCuenta_numero() {
		return cuenta_numero;
	}
	public void setCuenta_numero(String cuenta_numero) {
		this.cuenta_numero = cuenta_numero;
	}
	public String getCuenta_tipo() {
		return cuenta_tipo;
	}
	public void setCuenta_tipo(String cuenta_tipo) {
		this.cuenta_tipo = cuenta_tipo;
	}
	public String getCuenta_corresponde() {
		return cuenta_corresponde;
	}
	public void setCuenta_corresponde(String cuenta_corresponde) {
		this.cuenta_corresponde = cuenta_corresponde;
	}
	public Date getCuenta_fecha() {
		return cuenta_fecha;
	}
	public void setCuenta_fecha(Date cuenta_fecha) {
		this.cuenta_fecha = cuenta_fecha;
	}
	public String getCuenta_estado() {
		return cuenta_estado;
	}
	public void setCuenta_estado(String cuenta_estado) {
		this.cuenta_estado = cuenta_estado;
	}
	
	
}
