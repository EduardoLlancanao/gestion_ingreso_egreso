package com.apr_gestion.model;

import org.json.simple.JSONArray;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Usuario;

public interface CategoriaDAO {
	
	public boolean existe_categoria(Categoria cuenta, Usuario user);
	
	public boolean crear_categoria(Categoria cuenta, Usuario user);
	
	public boolean editar_categoria(Categoria cuenta);
	
	public boolean eliminar_cuenta(Categoria cuenta);
	
	public Categoria max_id_categoria();
	
	public JSONArray lista_categoria(Usuario user, String tipo);

}
