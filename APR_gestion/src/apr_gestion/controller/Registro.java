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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import apr_gestion.implement.UsuarioMgrImpl;
import apr_gestion.objetos.Usuario;

/**
 * Servlet implementation class Registro
 */
@WebServlet("/Registro")
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Home Do get: ");
		//redireccionando
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/Vistas/Login/Registro.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		
		String json = "";
		if(br != null){
			json = br.readLine();
//			System.out.println(json);
		}
		
		JSONObject data= new JSONObject();
		JSONParser parser = new JSONParser();
		JSONObject res= new JSONObject();
		
		Usuario user = new Usuario();
		
		try {
			data=(JSONObject) parser.parse(json);
			
			user.setUsu_nombre(data.get("nombre").toString());
			user.setUsu_apellido(data.get("apellido").toString());
			user.setUsu_correo(data.get("correo").toString());
			user.setUsu_pass(data.get("pwd").toString());
			
			
			// System.out.println("nombre "+data.get("nombre"));
            // System.out.println("apellido "+data.get("apellido"));
            
            UsuarioMgrImpl mgr = new UsuarioMgrImpl();
            
            String[] validarUser = new String[2];
//            validarUser[0] = "estado";
//            validarUser[1] = "Mensaje";
            
            validarUser = mgr.registrarUser(user);
            
            response.setContentType("application/json");
    		response.setHeader("Cache-Control", "nocache");
    		response.setCharacterEncoding("utf-8");
            	
    		res.put("estado", validarUser[0]);
    		res.put("mensaje", validarUser[1]);
            PrintWriter out = response.getWriter();
    		out.print(res);
           
                 
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		// response.getWriter().append("Home Do Post: " + nombre);
		// doGet(request, response);
		
	}

}
