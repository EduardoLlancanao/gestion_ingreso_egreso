package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.apr_gestion.util.Conector;

import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

public class MovimientosDAOImpl implements MovimientosDAO{
	
	Conector basedato = new Conector();
	
	Connection con = null;
	Statement stmt = null;
	ResultSet resul = null;

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

}
