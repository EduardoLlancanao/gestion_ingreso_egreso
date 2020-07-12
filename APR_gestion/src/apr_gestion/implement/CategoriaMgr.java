package apr_gestion.implement;

import org.json.simple.JSONArray;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Usuario;

public interface CategoriaMgr {
	
	public String[] crear_categoria(Categoria cat, Usuario user);
    public String[] editar_categoria(Categoria cat, Usuario user);
    public String[] eliminar_categoria(Categoria cat);
    public JSONArray lista_categoria(Usuario user, String tipo);

}
