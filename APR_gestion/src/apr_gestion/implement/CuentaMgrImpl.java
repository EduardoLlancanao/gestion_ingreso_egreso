package apr_gestion.implement;

import org.json.simple.JSONArray;

import com.apr_gestion.model.CuentaDAOImpl;
import com.apr_gestion.model.Cuenta_UsuariosDAOImpl;

import apr_gestion.objetos.Cuenta;
import apr_gestion.objetos.Usuario;

public class CuentaMgrImpl implements CuentaMgr  {
	
	@Override
	public String[] crear_cuenta(Cuenta cuenta, Usuario user) {
		
		String[] mensajes = new String[2];
		
		CuentaDAOImpl cta = new CuentaDAOImpl();
		Cuenta_UsuariosDAOImpl cta_user = new Cuenta_UsuariosDAOImpl();
		
		boolean existe = cta.existe_cuenta(cuenta);
		boolean creado;
		
		if(existe == true) {
			mensajes[0] = "info";
			mensajes[1] = "La Cuenta ya existe.";
		}else {
			
			creado = cta.crear_cuenta(cuenta);
			
			if(creado == true) {
				
				cuenta = cta.max_id_cuenta();
				
				if(cuenta != null) {
					
					boolean cta_regitro = cta_user.crear_cuenta(cuenta.getId_cuenta(), user.getUsu_id());
					
					if(cta_regitro == true) {
						mensajes[0] = "success";
						mensajes[1] = "Su cuenta fue creada correctamente";
					}else {
						mensajes[0] = "error";
						mensajes[1] = "Problemas para realizar la solicitud, intente mas tarde";
					}
					
					
				}else {
					
					mensajes[0] = "error";
					mensajes[1] = "Problemas para realizar la solicitud";
					
				}
				
							
			}else {
				mensajes[0] = "error";
				mensajes[1] = "No se pudo crear la cuenta, intente mas tarde";
			}
		}
		
		return mensajes;
	}

	@Override
	public JSONArray lista_cuentas(Usuario user) {
		
		CuentaDAOImpl cta = new CuentaDAOImpl();
		
		JSONArray listado = new JSONArray();
				
		listado = cta.lista_cuentas(user);
		
		return listado;
	}

	@Override
	public String[] editar_cuenta(Cuenta cuenta, Usuario user) {
		
		String[] mensajes = new String[2];
		
		CuentaDAOImpl cta = new CuentaDAOImpl();
								
		boolean cta_regitro = cta.editar_cuenta(cuenta);
		
		if(cta_regitro == true) {
			mensajes[0] = "success";
			mensajes[1] = "Su cuenta fue editada correctamente";
		}else {
			mensajes[0] = "error";
			mensajes[1] = "Problemas para realizar la solicitud, intente mas tarde";
		}
					
		return mensajes;
	}

	@Override
	public String[] eliminar_cuenta(Cuenta cuenta) {
		
		String[] mensajes = new String[2];
		
		CuentaDAOImpl cta = new CuentaDAOImpl();
								
		boolean cta_regitro = cta.eliminar_cuenta(cuenta);
		
		if(cta_regitro == true) {
			mensajes[0] = "success";
			mensajes[1] = "Su cuenta fue eliminada correctamente";
		}else {
			mensajes[0] = "error";
			mensajes[1] = "Problemas para realizar la solicitud, intente mas tarde";
		}
					
		return mensajes;
	}


}
