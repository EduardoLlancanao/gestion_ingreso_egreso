package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.apr_gestion.util.Conector;

import apr_gestion.objetos.Usuario;

public class UsuarioDAOImpl implements UsuarioDAO {
	
	Conector basedato = new Conector();
	
	Connection con = null;
	Statement stmt = null;
	ResultSet resul = null;
	
	Usuario usuario = null;
	
	public UsuarioDAOImpl() {
		
	}

	@Override
	public Usuario user_acceso(Usuario user) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT usu_id, usu_nombre, usu_apellido, usu_run, usu_correo, usu_alias FROM IE_usuarios Where usu_correo = '"+ user.getUsu_correo() +"' AND usu_pass = '" + user.getUsu_pass() +"'";
		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			System.out.println("resul : "+resul);
			
			 while(resul.next()){
				 
				 usuario = new Usuario();

	            	usuario.setUsu_id(resul.getInt("usu_id"));
	            	usuario.setUsu_nombre(resul.getString("usu_nombre"));
	            	usuario.setUsu_apellido(resul.getString("usu_apellido"));
	            	usuario.setUsu_run(resul.getString("usu_run"));
	            	usuario.setUsu_correo(resul.getString("usu_correo"));
	            	usuario.setUsu_alias(resul.getString("usu_alias"));
	     
	            }
			
		} catch (Exception e) {
			// TODO: handle exception
			return usuario;
		}
		
		return usuario;
		
	}

	@Override
	public boolean user_registro(Usuario user) {


		String sql = "INSERT INTO IE_usuarios ( id_tipo_acceso,usu_nombre, usu_apellido, usu_run, usu_correo, usu_pass, usu_alias, usu_fecha ) VALUES ( 2, '"+ 
						user.getUsu_nombre() +"' , '"+ 
						user.getUsu_apellido() +"' , '"+ 
						user.getUsu_run() +"' , '"+ 
						user.getUsu_correo() +"' , '" + 
						user.getUsu_pass() +"' , '"+ 
						user.getUsu_alias() +"' , NOW() )";
		
		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			int resul = stmt.executeUpdate(sql);
			
			System.out.println("resul : "+resul);
			
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean user_existe(Usuario user) {
		
		String sql = "SELECT usu_id FROM IE_usuarios Where usu_correo = '"+ user.getUsu_correo() +"'";
		System.out.println("Sql : "+sql);
		
		try {
			
			con = basedato.datos("BD_ingreso_egreso");
			stmt= con.createStatement();
			resul = stmt.executeQuery(sql);
			
			System.out.println("resul : "+resul);
			
			while(resul.next()) {
				//recorremos el resul y 
				//accedemos a los registros por posicion
				int usu_id = resul.getInt(1);
				
				if(usu_id > 0) {
					
					return true;
					
				}else {
					return false;
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return false;
	}
	
}
