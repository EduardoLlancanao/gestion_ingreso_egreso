package com.apr_gestion.model;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Cuenta;
import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

public interface MovimientosDAO {
	
	public boolean crear_movimiento(Movimientos mov, Usuario user);
	public boolean insert_cat_movimiento(Movimientos mov, Usuario user);
	
	public Movimientos max_id_movimiento();

}
