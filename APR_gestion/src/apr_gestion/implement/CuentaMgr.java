package apr_gestion.implement;

import org.json.simple.JSONArray;

import apr_gestion.objetos.Cuenta;
import apr_gestion.objetos.Usuario;

public interface CuentaMgr {
	
    public String[] crear_cuenta(Cuenta cuenta, Usuario user);
    public String[] editar_cuenta(Cuenta cuenta, Usuario user);
    public String[] eliminar_cuenta(Cuenta cuenta);
    public JSONArray lista_cuentas(Usuario user);

}
