package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.apr_gestion.util.Conector;

import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

public class MovimientosDAOImpl implements MovimientosDAO{
	
	Conector basedato = new Conector();
	
	Connection con = null;
	Connection con_c = null;
	Statement stmt = null;
	Statement stmt_c = null;
	ResultSet resul = null;
	ResultSet resul_c = null;

	@Override
	public boolean crear_movimiento(Movimientos mov, Usuario user) {
		
		String sql = "INSERT INTO IE_movimientos ( movi_tipo, usu_id, movi_valor, movi_observacion, movi_fecha, movi_insert ) VALUES ('"+ 
				mov.getMovi_tipo() +"' , "+ 
				user.getUsu_id() +" , '"+ 
				mov.getMovi_valor() +"' , '"+ 
				mov.getMovi_observacion() +"' , '" + 
				mov.getMovi_fecha() +"' , NOW() )";

		System.out.println("Sql INSERT : "+sql);
		
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
	public Movimientos max_id_movimiento() {


		Movimientos mov = null;
		
		String sql = "SELECT max(id_movi) FROM IE_movimientos";
		System.out.println("Sql max : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			while(resul.next()) {
				
				mov = new Movimientos();
				mov.setId_movi(resul.getInt(1));
				
				return mov;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return mov;
			
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
		
		return mov;
	}

	@Override
	public boolean insert_cat_movimiento(Movimientos mov, Usuario user) {
		
		System.out.println("Model Inicio");
		
		
		String sql = "INSERT INTO IE_categoria_movimiento ( id_cuenta, id_categoria, id_movimiento, cat_mov_fecha_insert ) VALUES ('"+ 
				mov.getId_cuenta() +"' , '"+ 
				mov.getId_categoria() +"' , '"+ 
				mov.getId_movi() +"' , NOW() )";

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

	@Override
	public JSONArray listado_movimientos(Usuario user, JSONObject data, String tipo) {
		
		JSONArray listado = null;
		
		int limit = Integer.parseInt(data.get("limit").toString());
		int page = Integer.parseInt(data.get("page").toString());
		
		String limite = "Limit "+ ((limit * page)-limit) + "," + limit;
		
		String filtros = "";
		
		if(tipo.equals("InOut")) {
			filtros = "";
		}else {
			filtros = " AND a.movi_tipo = '"+tipo+"'";
		}
		
		String sql = "SELECT a.id_movi, a.movi_tipo, a.usu_id, a.movi_valor,a.movi_observacion, a.movi_fecha, a.movi_insert,CONCAT(b.usu_nombre,' ',b.usu_apellido) AS usuario,c.categoria_nombre, d.cuenta_nombre,d.cuenta_numero,d.cuenta_corresponde FROM IE_movimientos a INNER JOIN IE_usuarios b ON a.usu_id = b.usu_id INNER JOIN IE_categoria_movimiento cam ON cam.id_movimiento=a.id_movi INNER JOIN IE_categorias c ON c.id_categoria=cam.id_categoria INNER JOIN IE_cuentas d ON cam.id_cuenta=d.id_cuenta WHERE 1=1 "+filtros+" ORDER BY a.movi_fecha DESC "+ limite;
				
//		System.out.println("InOut : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
						
			listado = new JSONArray();
			
				while(resul.next()) {
									
//					System.out.println("Esta es weta : "+resul.getString("cuenta_nombre"));
					JSONObject res= new JSONObject();														
					
					res.put("id_movi" , resul.getInt(1) );
					res.put("movi_tipo" , resul.getString("movi_tipo") );
					res.put("usu_id" , resul.getString("usu_id") );
					res.put("movi_valor" , resul.getString("movi_valor") );
					res.put("movi_observacion" , resul.getString("movi_observacion") );
					res.put("movi_fecha" , resul.getString("movi_fecha") );
					res.put("movi_insert" , resul.getString("movi_insert") );
					res.put("usuario" , resul.getString("usuario") );
					res.put("categoria_nombre" , resul.getString("categoria_nombre") );
					res.put("cuenta_nombre" , resul.getString("cuenta_nombre") );
					res.put("cuenta_numero" , resul.getString("cuenta_numero") );
					res.put("cuenta_corresponde" , resul.getString("cuenta_corresponde") );
					
					listado.add(res);
					
				}
				
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
	public int listado_movimientos_count(Usuario user, JSONObject data, String tipo) {
		
//		JSONArray listado = null;
		int listado = 0;
		
		String filtros = "";
		
		if(tipo.equals("InOut")) {
			filtros = "";
		}else {
			filtros = " AND a.movi_tipo = '"+tipo+"'";
		}
		
		
		String sql = "SELECT COUNT(*) AS total FROM IE_movimientos a INNER JOIN IE_usuarios b ON a.usu_id = b.usu_id INNER JOIN IE_categoria_movimiento cam ON cam.id_movimiento=a.id_movi INNER JOIN IE_categorias c ON c.id_categoria=cam.id_categoria INNER JOIN IE_cuentas d ON cam.id_cuenta=d.id_cuenta WHERE 1=1 "+filtros+" ORDER BY a.movi_fecha DESC ";
				
//		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
						
//			listado = new JSONArray();
			
				while(resul.next()) {
									
//					System.out.println("Esta es weta : "+resul.getString("cuenta_nombre"));
					JSONObject res= new JSONObject();														
					
					listado =  resul.getInt(1);
					
//					listado.add(res);
					
				}
				
				return listado;
			
						
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
			
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
	public JSONArray get_kpi_home(Usuario user, JSONObject data, String tipo) {
		
		JSONArray listado = null;
		
		String sql = "SELECT \r\n" + 
				"	DATE_FORMAT(a.movi_fecha, \"%Y-%m\") AS fecha,\r\n" + 
				"	SUM(a.movi_valor) AS total,\r\n" + 
				"	SUM(CASE WHEN a.movi_tipo = \"Ingreso\" THEN IFNULL(a.movi_valor,0) ELSE 0 END) AS ingreso,\r\n" + 
				"	SUM(CASE WHEN a.movi_tipo = \"Egreso\" THEN IFNULL(a.movi_valor,0) ELSE 0 END) AS Egreso,\r\n" + 
				"	(SUM(CASE WHEN a.movi_tipo = \"Ingreso\" THEN IFNULL(a.movi_valor,0) ELSE 0 END) - SUM(CASE WHEN a.movi_tipo = \"Egreso\" THEN IFNULL(a.movi_valor,0) ELSE 0 END)) AS rentabilidad,\r\n" + 
				"	ROUND(((SUM(CASE WHEN a.movi_tipo = \"Ingreso\" THEN IFNULL(a.movi_valor,0) ELSE 0 END))*100)/(SUM(a.movi_valor))) AS por_ingreso,\r\n" + 
				"	ROUND(((SUM(CASE WHEN a.movi_tipo = \"Egreso\" THEN IFNULL(a.movi_valor,0) ELSE 0 END))*100)/(SUM(a.movi_valor))) AS por_egreso\r\n" + 
				"FROM \r\n" + 
				"	IE_movimientos a \r\n" + 
				"	INNER JOIN IE_usuarios b ON a.usu_id = b.usu_id \r\n" + 
				"	INNER JOIN IE_categoria_movimiento cam ON cam.id_movimiento=a.id_movi \r\n" + 
				"	INNER JOIN IE_categorias c ON c.id_categoria=cam.id_categoria \r\n" + 
				"	INNER JOIN IE_cuentas d ON cam.id_cuenta=d.id_cuenta \r\n" + 
				"WHERE\r\n" + 
				"	DATE_FORMAT(a.movi_fecha, \"%Y-%m\") = DATE_FORMAT(NOW(), \"%Y-%m\")";
				
		System.out.println("InOut : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
						
			listado = new JSONArray();
			
				while(resul.next()) {
									
//					System.out.println("Esta es weta : "+resul.getString("cuenta_nombre"));
					JSONObject res= new JSONObject();														
					
					res.put("fecha" , resul.getString(1) );
					res.put("total" , resul.getString("total") );
					res.put("ingreso" , resul.getString("ingreso") );
					res.put("Egreso" , resul.getString("Egreso") );
					res.put("por_ingreso" , resul.getString("por_ingreso") );
					res.put("por_egreso" , resul.getString("por_egreso") );
					res.put("rentabilidad" , resul.getString("rentabilidad") );
					
					listado.add(res);
					
				}
				
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

}
