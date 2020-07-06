package com.apr_gestion.model;

import apr_gestion.objetos.Usuario;

public interface UsuarioDAO {
	
	public boolean user_acceso(Usuario user);
	public boolean user_registro(Usuario user);
	public boolean user_existe(Usuario user);

}
