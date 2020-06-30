package com.apr_gestion.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conector {
	
	private String sServidor = "127.0.0.1";
	private String sUsuario = "root";
	private String sPassword = "";
	private String iPuerto = "3306";
	private String sServer = "";
	private String sBaseDatos = "BD_ingreso_egreso";
	
	private static Connection conexion = null;
	
	public Conector() {
		super();
	}
	
	public Connection datos(String baseDatos) {
		this.sBaseDatos = baseDatos;
		//recibimos el nombre de la base de datos
		this.sServer = "jdbc:mysql://"+this.sServidor+":"+this.iPuerto+"/"+sBaseDatos;
		//jdbc:mysql://localhost:3306/arquitectura
		
		//registremos el driver mysql
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			//e.printStackTrace();
			System.err.println("Error al registrar el driver Mysql: "+e);
			// Al detectar error termina el flujo
			System.exit(0);
		}
		
		//conexion a mysql establecida
		
		try {
			conexion = DriverManager.getConnection(this.sServer,this.sUsuario,this.sPassword);
		} catch (SQLException e) {
			System.err.println("Error al conectar a Mysql: "+e);
			// Al detectar error termina el flujo
			System.exit(0);
		}
		System.out.println("No hemos conectado a la base de datos: "+ sBaseDatos);
		return conexion;
		
	}

}
