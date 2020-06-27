package com.apr_gestion;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;



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
					System.out.println(json);
				}
				
				
				JSONParser parser = new JSONParser();
                Object resultObject;
				try {
					resultObject = parser.parse(json);
					
					if (resultObject instanceof JSONArray) {
	                    JSONArray array=(JSONArray)resultObject;
	                    for (Object object : array) {
	                        JSONObject obj =(JSONObject)object;
	                        System.out.println(obj.get("correo"));
	                        System.out.println(obj.get("pass"));
	                    }

	                }else if (resultObject instanceof JSONObject) {
	                    JSONObject obj =(JSONObject)resultObject;
	                    System.out.println(obj.get("correo"));
	                    System.out.println(obj.get("pass"));
	                }
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

                
				
		// doGet(request, response);
	}

}
