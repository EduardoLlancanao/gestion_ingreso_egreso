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
import apr_gestion.implement.IngresoMgrImpl;
import apr_gestion.objetos.Usuario;

/**
 * Servlet implementation class Informes
 */
@WebServlet("/Informes")
public class Informes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		Session User
		Usuario user = new Usuario();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("usu_id") != null) {
			
			int usu_id = Integer.parseInt(session.getAttribute("usu_id").toString());
			user.setUsu_id(usu_id);
				
			// Cambio a vista
			String resultados = "Hola";
			request.setAttribute("resultados", resultados);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/Vistas/Informes/Informes.jsp");
			view.forward(request, response);
			
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
		Usuario user = new Usuario();
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
						
			IngresoMgrImpl mgr = new IngresoMgrImpl();
			PrintWriter out = null;
			
			if(url != "") {
				
				switch (url) {
									
					case "create":
						
						break;
						
					case "edit":
						
						break;
					
					case "get_Indicador":
						
							data=(JSONObject) parser.parse(base.get("data").toString());
							
//							c.setId_cuenta(Integer.parseInt(data.get("cuenta_id").toString()));
						
							JSONArray list = new JSONArray();
							
							list = mgr.get_indicadores(user, data.get("dias").toString() );
									
							response.setContentType("application/json");
				    		response.setHeader("Cache-Control", "nocache");
				    		response.setCharacterEncoding("utf-8");
				    		
				            	
				    		res.put("count", 1);
				    		res.put("data", list);
				            out = response.getWriter();
				    		out.print(res);
						
						break;
					
					case "delete":
												
						break;
	
					default:
						
						response.setContentType("application/json");
			    		response.setHeader("Cache-Control", "nocache");
			    		response.setCharacterEncoding("utf-8");
			            	
			    		res.put("estado", "error");
			    		res.put("mensaje", "url desconocida");
			            out = response.getWriter();
			    		out.print(res);
						
						
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
