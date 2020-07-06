package apr_gestion.implement;


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
	
	
	public boolean user_Acceso(Usuario user) {
		
		UsuarioDAOImpl userDao = new UsuarioDAOImpl();
		
		boolean acceso = userDao.user_acceso(user);
			
		return acceso;
		
	}

}
