package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.apr_gestion.util.Conector;


public class Cuenta_UsuariosDAOImpl implements Cuenta_UsuariosDAO {
	
	Conector basedato = new Conector();
	
	Connection con = null;
	Statement stmt = null;
	ResultSet resul = null;
	
	
	public boolean crear_cuenta(int cuenta_id, int usu_id) {
		
		String sql = "INSERT INTO IE_cuentas_usuarios ( usu_id, id_cuenta, cuenta_usu_fecha_insert ) VALUES ('"+ 
				usu_id +"' , '"+ 
				cuenta_id +"' , NOW() )";

//			System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			int resul = stmt.executeUpdate(sql);
			
//				System.out.println("resul : "+resul);
			
			if(resul == 1) {
				return true;
			}else {
				return false;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}finally {
			//cerramos las conexiones 
			try {
				if(resul != null ) {
					resul.close();
				}
				if(stmt != null ) {
					stmt.close();
				}
				if(con != null ) {
					con.close();
				}
			} catch (Exception e2) {
				System.out.println("Error al cerrar la conexiones ");
			}
		}
		
	}
	

}
