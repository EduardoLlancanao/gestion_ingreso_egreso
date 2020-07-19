package com.apr_gestion.model;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Cuenta;
import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

public interface MovimientosDAO {
	
	public boolean crear_movimiento(Movimientos mov, Usuario user);
	
	public boolean insert_cat_movimiento(Movimientos mov, Usuario user);
	
	public JSONArray listado_movimientos(Usuario user, JSONObject data, String tipo);
	
	public JSONArray get_kpi_home(Usuario user, JSONObject data, String tipo);
	
	public int listado_movimientos_count(Usuario user, JSONObject data, String tipo);
	
	public Movimientos max_id_movimiento();

}
