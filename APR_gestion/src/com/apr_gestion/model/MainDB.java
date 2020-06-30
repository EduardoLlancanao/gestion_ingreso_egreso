package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class MainDB {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Conector basedato =new Conector();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet resul = null;
		
		
		try {
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery("SELECT * FROM IE_usuarios");
			
			//crear tablas cursos y alumnos
		
			/* usu_id
			 * usu_correo
			 * usu_nombre
			 * usu_apellido
			 */
			
			System.out.println("*********************");
			while(resul.next()) {
				//recorremos el resul y 
				//accedemos a los registros por posicion
				int usu_id = resul.getInt(1);
				String sNombreCurso = resul.getString(2);
				String sCodigoCurso = resul.getString(3);
				
				//cada vez que encuentre un registro lo imprimirá
				System.out.println("Curso Id : "+ usu_id);
				System.out.println("Nombre Curso : "+ sNombreCurso);
				System.out.println("Codigo Curso : "+ sCodigoCurso);
				System.out.println("*********************");
			}
			
			/*alumnos
			 * id
			 * nombre
			 * apellido
			 * edad
			 */
			
		} catch (SQLException e) {
			System.out.println("Error al realizar la consulta "+ e);
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
	
	public boolean User_Acceso(String correo, String pass) {
		
		String sql = "SELECT * FROM IE_usuarios Where usu_correo = '"+ correo +"' AND usu_pass = '" + pass +"'";
		System.out.println("Sql : "+sql);
		
		
		// TODO Auto-generated method stub
				Conector basedato =new Conector();
				
				Connection con = null;
				Statement stmt = null;
				ResultSet resul = null;
				
				
				try {
					con = basedato.datos("BD_ingreso_egreso");
					stmt= con.createStatement();
					
					resul = stmt.executeQuery(sql);
					
					System.out.println("resul : "+resul);
					
					while(resul.next()) {
						//recorremos el resul y 
						//accedemos a los registros por posicion
						int usu_id = resul.getInt(1);
						String sNombreCurso = resul.getString(2);
						String sCodigoCurso = resul.getString(3);
						
						if(usu_id > 0) {
							
							return true;
							
						}else {
							return false;
						}
					}
									
				} catch (SQLException e) {
					System.out.println("Error al realizar la consulta "+ e);
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
				return false;
	}

}
