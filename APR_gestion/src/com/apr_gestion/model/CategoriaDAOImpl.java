package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.apr_gestion.util.Conector;

import apr_gestion.objetos.Categoria;
import apr_gestion.objetos.Cuenta;
import apr_gestion.objetos.Usuario;

public class CategoriaDAOImpl implements CategoriaDAO {
	
	Conector basedato = new Conector();
	
	Connection con = null;
	Statement stmt = null;
	ResultSet resul = null;
	
	Categoria cat = new Categoria();

	@Override
	public boolean existe_categoria(Categoria cat, Usuario user) {
		
		String sql = "SELECT id_categoria, usu_id, categoria_nombre, categoria_tipo, categoria_fecha  FROM IE_categorias WHERE categoria_nombre = '"+ cat.getCategoria_nombre() +"' AND usu_id = "+ user.getUsu_id() +"  ";
		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			while(resul.next()) {
				
				int cat_id = resul.getInt(1);
				
				if(cat_id > 0) {
					
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
	public boolean crear_categoria(Categoria cat, Usuario user) {
		
		String sql = "INSERT INTO IE_categorias ( usu_id, categoria_nombre, categoria_tipo, categoria_fecha ) VALUES ('"+ 
				user.getUsu_id()+"' , '"+ 
				cat.getCategoria_nombre() +"' , '"+ 
				cat.getCategoria_tipo() +"' , NOW() )";

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
	public boolean editar_categoria(Categoria cuenta) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean eliminar_cuenta(Categoria cuenta) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Categoria max_id_categoria() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JSONArray lista_categoria(Usuario user, String tipo) {
		
		JSONArray listado = null;
			
		String sql = "SELECT id_categoria, usu_id, categoria_nombre, categoria_tipo, categoria_fecha, categoria_estado FROM IE_categorias WHERE categoria_tipo = '"+tipo+"' AND usu_id = "+user.getUsu_id();
//		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			listado = new JSONArray();
									
			while(resul.next()) {
								
				JSONObject res= new JSONObject();														
				
				res.put("id_categoria" , resul.getInt(1) );
				res.put("categoria_nombre" , resul.getString("categoria_nombre") );
				res.put("categoria_tipo" , resul.getString("categoria_tipo") );
				res.put("categoria_fecha" , resul.getString("categoria_fecha") );
				res.put("categoria_estado" , resul.getString("categoria_estado") );
				
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
