package com.apr_gestion.model;

import org.json.simple.JSONArray;

import apr_gestion.objetos.Cuenta;
import apr_gestion.objetos.Usuario;

public interface CuentaDAO {
	
	public boolean existe_cuenta(Cuenta cuenta);
	
	public boolean crear_cuenta(Cuenta cuenta);
	
	public boolean editar_cuenta(Cuenta cuenta);
	
	public boolean eliminar_cuenta(Cuenta cuenta);
	
	public Cuenta max_id_cuenta();
	
	public JSONArray lista_cuentas(Usuario user);

}
