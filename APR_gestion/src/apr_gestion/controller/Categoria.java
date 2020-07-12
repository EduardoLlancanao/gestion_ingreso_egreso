package apr_gestion.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

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

import apr_gestion.implement.CategoriaMgrImpl;
import apr_gestion.objetos.Usuario;

/**
 * Servlet implementation class Categoria
 */
@WebServlet("/Categoria")
public class Categoria extends HttpServlet {
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
		apr_gestion.objetos.Categoria cat = new apr_gestion.objetos.Categoria();
		String[] json_res = new String[2];
		
		try {
			
//			Parsear Json
			base=(JSONObject) parser.parse(json);
			
//			obtener url para switch
			String url = base.get("url").toString();
						
			CategoriaMgrImpl mgr = new CategoriaMgrImpl();
			PrintWriter out = null;
			
			if(url != "") {
				
				switch (url) {
									
					case "create":
						
							data=(JSONObject) parser.parse(base.get("data").toString());
							
							cat.setCategoria_nombre(data.get("categoria_nombre").toString());
							cat.setCategoria_tipo(data.get("categoria_tipo").toString());
							
							json_res = mgr.crear_categoria(cat, user);
							
							response.setContentType("application/json");
				    		response.setHeader("Cache-Control", "nocache");
				    		response.setCharacterEncoding("utf-8");
				            	
				    		res.put("estado", json_res[0]);
				    		res.put("mensaje", json_res[1]);
				            out = response.getWriter();
				    		out.print(res);
					
						
						break;
						
					case "edit":
						
//							data=(JSONObject) parser.parse(base.get("data").toString());
//							
//							c.setId_cuenta(Integer.parseInt(data.get("cuenta_id").toString()));
//							c.setCuenta_nombre(data.get("cuenta_nombre").toString());
//							c.setCuenta_tipo(data.get("cuenta_tipo").toString());
//							c.setCuenta_corresponde(data.get("cuenta_corresponde").toString());
//							c.setCuenta_numero(data.get("cuenta_numero").toString());
//							c.setCuenta_estado(data.get("cuenta_estado").toString());
//							
//							json_res = mgr.editar_cuenta(c, user);
//							
//							response.setContentType("application/json");
//				    		response.setHeader("Cache-Control", "nocache");
//				    		response.setCharacterEncoding("utf-8");
//				            	
//				    		res.put("estado", json_res[0]);
//				    		res.put("mensaje", json_res[1]);
//				            out = response.getWriter();
//				    		out.print(res);
						
						break;
					
					case "get_ingreso":
						
							JSONArray list_ingreso = new JSONArray();
																													
							list_ingreso = mgr.lista_categoria(user, "Ingreso");
													
							response.setContentType("application/json");
				    		response.setHeader("Cache-Control", "nocache");
				    		response.setCharacterEncoding("utf-8");
				    		
				    		long total_ingreso = list_ingreso.stream().count(); 
				            	
				    		res.put("count", total_ingreso);
				    		res.put("data", list_ingreso);
				            out = response.getWriter();
				    		out.print(res);

						break;
						
					case "get_egreso":
						
							list = mgr.lista_categoria(user, "Egreso");
													
							response.setContentType("application/json");
				    		response.setHeader("Cache-Control", "nocache");
				    		response.setCharacterEncoding("utf-8");
				    		
				    		long total_egreso = list.stream().count(); 
				            	
				    		res.put("count", total_egreso);
				    		res.put("data", list);
				            out = response.getWriter();
				    		out.print(res);

					break;
					
					case "delete":
						
//						data=(JSONObject) parser.parse(base.get("data").toString());
//						
//						c.setId_cuenta(Integer.parseInt(data.get("cuenta_id").toString()));
//						
//						json_res = mgr.eliminar_cuenta(c);
//						
//						response.setContentType("application/json");
//			    		response.setHeader("Cache-Control", "nocache");
//			    		response.setCharacterEncoding("utf-8");
//			            	
//			    		res.put("estado", json_res[0]);
//			    		res.put("mensaje", json_res[1]);
//			            out = response.getWriter();
//			    		out.print(res);
						
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
