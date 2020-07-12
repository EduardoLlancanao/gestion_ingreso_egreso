package apr_gestion.implement;

import com.apr_gestion.model.MovimientosDAOImpl;

import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

public class IngresoMgrImpl implements IngresoMgr {

	@Override
	public String[] crear_movimiento(Movimientos mov, Usuario user) {
		
		System.out.println("Implement Inicio");
		
		// TODO Auto-generated method stub
		String[] mensajes = new String[2];
		
		MovimientosDAOImpl movImpl = new MovimientosDAOImpl();
		
		boolean creado = movImpl.crear_movimiento(mov, user);
		
		
		System.out.println(creado);
		
		if(creado == true) {
			
			Movimientos mov1 = movImpl.max_id_movimiento();
			
						
			if(mov1 != null) {
				
				mov.setId_movi(mov1.getId_movi());
				boolean mov_regitro = movImpl.insert_cat_movimiento(mov, user);
				
				if(mov_regitro == true) {
					mensajes[0] = "success";
					mensajes[1] = "Registro "+ mov.getMovi_tipo() + "  correctamente";
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
			mensajes[1] = "Problemas para realizar la solicitud, intente mas tarde";
		}
		
		return mensajes;
	}

}
