package apr_gestion.implement;

import org.json.simple.JSONArray;

import apr_gestion.objetos.Usuario;

public interface UsuarioMgr {
	
    public Usuario user_Acceso(Usuario user);
    
    public String[] registrarUser(Usuario user);
    
    public JSONArray get_by_id(Usuario user);
    
    public JSONArray get_usuarios(Usuario user);
    
    public int get_usuarios_count(Usuario user);

}
