package apr_gestion.implement;

import org.json.simple.JSONArray;

import com.apr_gestion.model.UsuarioDAOImpl;

import apr_gestion.objetos.Usuario;

public class UsuarioMgrImpl implements UsuarioMgr {
	
	public String[] mensajes;


	public String[] registrarUser(Usuario user) {
		
		mensajes = new String[2];
		UsuarioDAOImpl userDao = new UsuarioDAOImpl();
		
		boolean existe = userDao.user_existe(user);
		boolean creado;
		
		if(existe == true) {
			mensajes[0] = "info";
			mensajes[1] = "El usuario ya existe.";
		}else {
			
			creado = userDao.user_registro(user);
			
			if(creado == true) {

				mensajes[0] = "success";
				mensajes[1] = "Usuario creado correctamente";
			}else {
				mensajes[0] = "error";
				mensajes[1] = "No se pudo crear el usuario, intente mas tarde";
			}
		}
		
			
		return mensajes;
	}
	
	
	public Usuario user_Acceso(Usuario user) {
		
		UsuarioDAOImpl userDao = new UsuarioDAOImpl();
		Usuario usuario = null;
				
		usuario = userDao.user_acceso(user);
			
		return usuario;
		
	}


	@Override
	public JSONArray get_by_id(Usuario user) {
		
		UsuarioDAOImpl userDao = new UsuarioDAOImpl();
//		Usuario usuario = null;
		
		JSONArray usuario = null;
				
		usuario = userDao.user_get_by_id(user);
			
		return usuario;
	}


	@Override
	public JSONArray get_usuarios(Usuario user) {
		
		UsuarioDAOImpl userDao = new UsuarioDAOImpl();
		
		JSONArray usuario = null;
				
		usuario = userDao.user_get_usuarios(user);
			
		return usuario;
	}
	
	public int get_usuarios_count(Usuario user) {
		
		UsuarioDAOImpl userDao = new UsuarioDAOImpl();
		
		int usuario = userDao.user_get_usuarios_count(user);
			
		return usuario;
	}

}
