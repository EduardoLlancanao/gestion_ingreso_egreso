package apr_gestion.implement;

import java.sql.Array;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

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

	@Override
	public JSONArray[] lista_ingresos(Usuario user, JSONObject data, String tipo) {
						
		MovimientosDAOImpl movImpl = new MovimientosDAOImpl();
		
		JSONArray[] listado = new JSONArray[2];
		
		listado[0] = movImpl.listado_movimientos(user, data, tipo);
				
		return listado;
		
		
	}

	@Override
	public int lista_ingresos_count(Usuario user, JSONObject data, String tipo) {
		
		MovimientosDAOImpl movImpl = new MovimientosDAOImpl();
		
		int x = movImpl.listado_movimientos_count(user, data, tipo);
		
		return x;
	}

	@Override
	public JSONArray[] get_kpi_home(Usuario user, JSONObject data, String tipo) {
		
		MovimientosDAOImpl movImpl = new MovimientosDAOImpl();
		
		JSONArray[] listado = new JSONArray[2];
		
		listado[0] = movImpl.get_kpi_home(user, data, tipo);
				
		return listado;
	}

	@Override
	public JSONArray get_indicadores(Usuario user, String dias) {
		
		MovimientosDAOImpl movImpl = new MovimientosDAOImpl();
		
		JSONArray listado = new JSONArray();
		
		listado = movImpl.get_indicadores(user, dias);
		
		return listado;
	}

}
