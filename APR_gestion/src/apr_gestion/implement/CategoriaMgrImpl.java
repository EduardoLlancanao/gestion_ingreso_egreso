package apr_gestion.implement;

import org.json.simple.JSONArray;

import com.apr_gestion.model.CategoriaDAOImpl;
import com.apr_gestion.model.Cuenta_UsuariosDAOImpl;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Usuario;

public class CategoriaMgrImpl implements CategoriaMgr {

	@Override
	public String[] crear_categoria(Categoria cat, Usuario user) {
		
		String[] mensajes = new String[2];
		
		CategoriaDAOImpl catImpl = new CategoriaDAOImpl();
		Cuenta_UsuariosDAOImpl cta_user = new Cuenta_UsuariosDAOImpl();
		
		boolean existe = catImpl.existe_categoria(cat, user);
		boolean creado;
		
		if(existe == true) {
			mensajes[0] = "info";
			mensajes[1] = "La Categoria ya existe.";
		}else {
			
			creado = catImpl.crear_categoria(cat, user);
			
			if(creado == true) {
				
					mensajes[0] = "success";
					mensajes[1] = "La Categoria fue creada correctamente";
												
			}else {
				mensajes[0] = "error";
				mensajes[1] = "No se pudo crear la Categoria, intente mas tarde";
			}
		}
		
		return mensajes;
	}

	@Override
	public String[] editar_categoria(Categoria cat, Usuario user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String[] eliminar_categoria(Categoria cat) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JSONArray lista_categoria(Usuario user, String tipo) {
		
		CategoriaDAOImpl cat = new CategoriaDAOImpl();
		
		JSONArray listado = new JSONArray();
				
		listado = cat.lista_categoria(user, tipo);
		
		return listado;
	}

	

}
