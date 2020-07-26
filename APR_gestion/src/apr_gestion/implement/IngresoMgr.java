package apr_gestion.implement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

public interface IngresoMgr {
		
	public String[] crear_movimiento(Movimientos mov, Usuario user);
	
	public JSONArray[] lista_ingresos(Usuario user, JSONObject data, String tipo );
	
	public JSONArray get_indicadores(Usuario user, String dias );
	
	public JSONArray[] get_kpi_home(Usuario user, JSONObject data, String tipo );
	
	public int lista_ingresos_count(Usuario user, JSONObject data, String tipo );
	
}
