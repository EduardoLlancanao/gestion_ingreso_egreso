package com.apr_gestion.model;

import org.json.simple.JSONArray;

import apr_gestion.objetos.Usuario;

public interface UsuarioDAO {
	
	public Usuario user_acceso(Usuario user);
	
	public boolean user_registro(Usuario user);
	
	public boolean user_existe(Usuario user);
	
	public JSONArray user_get_by_id(Usuario user);
	
	public JSONArray user_get_usuarios(Usuario user);
	
	public int user_get_usuarios_count(Usuario user);
	
}
