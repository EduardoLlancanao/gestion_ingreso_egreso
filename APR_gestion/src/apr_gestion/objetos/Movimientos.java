package apr_gestion.objetos;

import java.util.Date;

public class Movimientos {
	
	public int id_movi;
	public int id_cuenta;
	public int id_categoria;
	public String movi_tipo;
	public double movi_valor;
	public String movi_observacion;
	public String movi_fecha;
	public Date movi_insert;
	
	
	
	
	
	public int getId_movi() {
		return id_movi;
	}
	public void setId_movi(int id_movi) {
		this.id_movi = id_movi;
	}
	public int getId_cuenta() {
		return id_cuenta;
	}
	public void setId_cuenta(int id_cuenta) {
		this.id_cuenta = id_cuenta;
	}
	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public String getMovi_tipo() {
		return movi_tipo;
	}
	public void setMovi_tipo(String movi_tipo) {
		this.movi_tipo = movi_tipo;
	}
	public double getMovi_valor() {
		return movi_valor;
	}
	public void setMovi_valor(double movi_valor) {
		this.movi_valor = movi_valor;
	}
	public String getMovi_observacion() {
		return movi_observacion;
	}
	public void setMovi_observacion(String movi_observacion) {
		this.movi_observacion = movi_observacion;
	}
	public String getMovi_fecha() {
		return movi_fecha;
	}
	public void setMovi_fecha(String movi_fecha) {
		this.movi_fecha = movi_fecha;
	}
	public Date getMovi_insert() {
		return movi_insert;
	}
	public void setMovi_insert(Date movi_insert) {
		this.movi_insert = movi_insert;
	}
	
	

}
