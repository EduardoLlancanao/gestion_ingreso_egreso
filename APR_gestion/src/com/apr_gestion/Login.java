package com.apr_gestion;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.apr_gestion.model.MainDB;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. get received JSON data from request
				BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
				
				String json = "";
				if(br != null){
					json = br.readLine();
					// System.out.println(json);
				}
				
				JSONObject data= new JSONObject();
				JSONParser parser = new JSONParser();
				JSONObject res= new JSONObject();
				Boolean pedido;
				
				try {
					data=(JSONObject) parser.parse(json);
					System.out.println("correo "+data.get("correo"));
                    System.out.println("password "+data.get("pass"));
                    
                    MainDB mb = new MainDB();
                    
                    pedido = true;
                    
                    // pedido = mb.User_Acceso(data.get("correo").toString(), data.get("pass").toString());
                                        
                    response.setContentType("application/json");
            		response.setHeader("Cache-Control", "nocache");
            		response.setCharacterEncoding("utf-8");
                    	
            		res.put("acceso", pedido);
                    PrintWriter out = response.getWriter();
            		out.print(res);
                         
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		// doGet(request, response);
	}

}


