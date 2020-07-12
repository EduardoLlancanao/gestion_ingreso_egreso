package apr_gestion.implement;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

public interface IngresoMgr {
		
	public String[] crear_movimiento(Movimientos mov, Usuario user);
	
}
