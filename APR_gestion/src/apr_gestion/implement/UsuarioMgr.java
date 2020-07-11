package apr_gestion.implement;

import apr_gestion.objetos.Usuario;

public interface UsuarioMgr {
	
    public Usuario user_Acceso(Usuario user);
    public String[] registrarUser(Usuario user);

}
