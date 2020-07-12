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

import apr_gestion.implement.IngresoMgrImpl;
import apr_gestion.objetos.Movimientos;
import apr_gestion.objetos.Usuario;

/**
 * Servlet implementation class Egreso
 */
@WebServlet("/Egreso")
public class Egreso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("Home Do get: ");
		// Cambio a vista
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/Vistas/Egreso/Egreso.jsp");
		view.forward(request, response);
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
		JSONArray list = new JSONArray();
		
		
//		Session User
		Usuario user = new Usuario();
		HttpSession session = request.getSession();
		int usu_id = Integer.parseInt(session.getAttribute("usu_id").toString());
		user.setUsu_id(usu_id);

//      Categoria
		Movimientos mov = new Movimientos();
		Categoria cat = new Categoria();
		String[] json_res = new String[2];
		
		try {
			
//			Parsear Json
			base=(JSONObject) parser.parse(json);
			
//			obtener url para switch
			String url = base.get("url").toString();
						
			IngresoMgrImpl mgr = new IngresoMgrImpl();
			PrintWriter out = null;
			
			if(url != "") {
				
				switch (url) {
									
					case "create":
						
							data=(JSONObject) parser.parse(base.get("data").toString());
							
							mov.setId_cuenta(Integer.parseInt(data.get("id_cuenta").toString()));
							mov.setId_categoria(Integer.parseInt(data.get("id_categoria").toString()));
							mov.setMovi_tipo(data.get("movi_tipo").toString());
							mov.setMovi_valor(Double.parseDouble(data.get("movi_valor").toString()));
							mov.setMovi_observacion(data.get("movi_observacion").toString());
							
							mov.setMovi_fecha(data.get("movi_fecha").toString());
							
							json_res = mgr.crear_movimiento(mov, user);
							
							response.setContentType("application/json");
				    		response.setHeader("Cache-Control", "nocache");
				    		response.setCharacterEncoding("utf-8");
				            	
				    		res.put("estado", json_res[0]);
				    		res.put("mensaje", json_res[1]);
				            out = response.getWriter();
				    		out.print(res);
					
						
						break;
						
					case "edit":
						
						
						break;
						
					case "get_egreso":

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
