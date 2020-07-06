package apr_gestion.implement;

import apr_gestion.objetos.Usuario;

public interface UsuarioMgr {
	
    public boolean user_Acceso(Usuario user);
    public String[] registrarUser(Usuario user);

}
