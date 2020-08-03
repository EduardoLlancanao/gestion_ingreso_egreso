package apr_gestion.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import apr_gestion.implement.CuentaMgrImpl;
import apr_gestion.implement.UsuarioMgrImpl;


/**
 * Servlet implementation class Usuario
 */
@WebServlet("/Usuario")
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String parametro = request.getParameter("u");
				
//		 Session User
		
		apr_gestion.objetos.Usuario user = new apr_gestion.objetos.Usuario();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("usu_id") != null) {
			
			int usu_id = Integer.parseInt(session.getAttribute("usu_id").toString());
			user.setUsu_id(usu_id);
			
			switch (parametro) {
				case "perfil": {
					
					// Cambio a vista
					RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/Vistas/Usuario/perfil.jsp");
					view.forward(request, response);
					
				}
				case "usuarios": {
									
					// Cambio a vista
					RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/Vistas/Usuario/usuarios.jsp");
					view.forward(request, response);
					
				}
				default:
					RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
					view.forward(request, response);
			}
	
		}else {
			
			RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
			view.forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		
		String json = "";
		if(br != null){
			json = br.readLine();
			System.out.println(json);
		}
//	
//		JSON Declaraciones
		JSONObject data= new JSONObject();
		JSONObject base= new JSONObject();
		JSONParser parser = new JSONParser();
		JSONObject res= new JSONObject();
		
		
//		Session User
		apr_gestion.objetos.Usuario user = new apr_gestion.objetos.Usuario();
		HttpSession session = request.getSession();
		int usu_id = Integer.parseInt(session.getAttribute("usu_id").toString());
		user.setUsu_id(usu_id);

//      Cuenta
		apr_gestion.objetos.Cuenta c = new apr_gestion.objetos.Cuenta();
		Boolean respuesta = false;
		String[] json_res = new String[2];
		
		try {
			
			base=(JSONObject) parser.parse(json);			
			String url = base.get("url").toString();
						
			UsuarioMgrImpl mgr = new UsuarioMgrImpl();
			PrintWriter out = null;
			
			if(url != "") {
				
				switch (url) {
									
					case "create":
												
						break;
						
					case "edit":
												
						break;
					
					case "get_by_id":
							
//							apr_gestion.objetos.Usuario user_res = new apr_gestion.objetos.Usuario();
							
							JSONArray user_res = new JSONArray();
							
							user_res = mgr.get_by_id(user);
													
							response.setContentType("application/json");
				    		response.setHeader("Cache-Control", "nocache");
				    		response.setCharacterEncoding("utf-8");
				    		
				    		res.put("data", user_res);
				            out = response.getWriter();
				    		out.print(res);
																							
						break;
						
					case "get_listado":
						
							JSONArray user_res1 = new JSONArray();
							
							user_res1 = mgr.get_usuarios(user);
							int user_res2 = mgr.get_usuarios_count(user);
													
							response.setContentType("application/json");
				    		response.setHeader("Cache-Control", "nocache");
				    		response.setCharacterEncoding("utf-8");
				    		
				    		res.put("data", user_res1);
				    		res.put("count", user_res2);
				            out = response.getWriter();
				    		out.print(res);
						
						break;
					
					case "delete":
												
						break;
	
					default:
						
						break;
				}
				
				
			}else {
											
				response.setContentType("application/json");
	    		response.setHeader("Cache-Control", "nocache");
	    		response.setCharacterEncoding("utf-8");
	            	
	    		res.put("estado", "error");
	    		res.put("mensaje", "url no esta definida");
	            out = response.getWriter();
	    		out.print(res);
			}         
                 
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
