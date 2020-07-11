package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.apr_gestion.util.Conector;

import apr_gestion.objetos.Cuenta;
import apr_gestion.objetos.Usuario;

public class CuentaDAOImpl implements CuentaDAO {
	
	Conector basedato = new Conector();
	
	Connection con = null;
	Statement stmt = null;
	ResultSet resul = null;
	
	Cuenta cta = new Cuenta();

	@Override
	public boolean existe_cuenta(Cuenta cuenta) {
		
		String sql = "SELECT id_cuenta, cuenta_nombre, cuenta_numero, cuenta_tipo, cuenta_corresponde, cuenta_fecha, cuenta_estado  FROM IE_cuentas\r\n" + 
				" Where usu_correo = '"+ cuenta.getCuenta_nombre() +"' OR usu_pass = '" + cuenta.getCuenta_numero() +"'";
		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			while(resul.next()) {
				
				int cta_id = resul.getInt(1);
				
				if(cta_id > 0) {
					
					return true;
					
				}else {
					return false;
				}
			
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
			
		} finally {
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
		
		return false;

	}

	@Override
	public boolean crear_cuenta(Cuenta cuenta) {
		
		String sql = "INSERT INTO IE_cuentas ( cuenta_nombre, cuenta_numero, cuenta_tipo, cuenta_corresponde, cuenta_estado, cuenta_fecha ) VALUES ('"+ 
				cuenta.getCuenta_nombre() +"' , '"+ 
				cuenta.getCuenta_numero() +"' , '"+ 
				cuenta.getCuenta_tipo() +"' , '"+ 
				cuenta.getCuenta_corresponde() +"' , '" + 
				cuenta.getCuenta_estado() +"' , NOW() )";

//		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			int resul = stmt.executeUpdate(sql);
			
//			System.out.println("resul : "+resul);
			
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

	public JSONArray lista_cuentas(Usuario user) {
		
		JSONArray listado = null;
		
		String sql = "SELECT \r\n" + 
				"	c.id_cuenta, \r\n" + 
				"	c.cuenta_nombre, \r\n" + 
				"	c.cuenta_numero, \r\n" + 
				"	c.cuenta_tipo, \r\n" + 
				"	c.cuenta_corresponde, \r\n" + 
				"	c.cuenta_fecha, \r\n" + 
				"	c.cuenta_estado,\r\n" + 
				"	cu.usu_id \r\n" + 
				"FROM \r\n" + 
				"	IE_cuentas c\r\n" + 
				"	INNER JOIN IE_cuentas_usuarios cu ON cu.id_cuenta=c.id_cuenta\r\n" + 
				"WHERE \r\n" + 
				"	cu.usu_id = '"+ user.getUsu_id()+"'";
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			listado = new JSONArray();
			
			JSONArray list = new JSONArray();
			
			int value = 0;
				
				while(resul.next()) {
									
//					System.out.println("Esta es weta : "+resul.getString("cuenta_nombre"));
					JSONObject res= new JSONObject();														
					
					res.put("cuenta_id" , resul.getInt(1) );
					res.put("cuenta_nombre" , resul.getString("cuenta_nombre") );
					res.put("cuenta_numero" , resul.getString("cuenta_numero") );
					res.put("cuenta_tipo" , resul.getString("cuenta_tipo") );
					res.put("cuenta_corresponde" , resul.getString("cuenta_corresponde") );
					res.put("cuenta_estado" , resul.getString("cuenta_estado") );
					
					listado.add(res);
										
					value++;
														
				}
				
				
//				list.add(0, listado);
				
				
				
				return listado;
			
						
		} catch (Exception e) {
			// TODO: handle exception
			return null;
			
		} finally {
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

	@Override
	public Cuenta max_id_cuenta() {
		
		Cuenta cta = null;
		
		String sql = "SELECT max(id_cuenta) FROM IE_cuentas";
//		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			while(resul.next()) {
				
				cta = new Cuenta();
				cta.setId_cuenta(resul.getInt(1));
				
				return cta;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return cta;
			
		} finally {
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
		
		return cta;
	}

	@Override
	public boolean editar_cuenta(Cuenta cuenta) {
		
		String sql = "UPDATE IE_cuentas SET cuenta_nombre = '" + cuenta.getCuenta_nombre() +
				"', cuenta_numero = '"+ 	cuenta.getCuenta_numero() +
				"', cuenta_tipo = '"+ cuenta.getCuenta_tipo() +
				"', cuenta_corresponde = '"+ cuenta.getCuenta_corresponde() +
				"', cuenta_estado = '" + cuenta.getCuenta_estado() +
				"' WHERE id_cuenta = '"+cuenta.getId_cuenta() +"'";

//		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			int resul = stmt.executeUpdate(sql);
			
//			System.out.println("resul : "+resul);
			
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

	@Override
	public boolean eliminar_cuenta(Cuenta cuenta) {
		
		String sql = "DELETE FROM IE_cuentas WHERE id_cuenta = '"+cuenta.getId_cuenta() +"'";

		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			int resul = stmt.executeUpdate(sql);
			
//			System.out.println("resul : "+resul);
			
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
