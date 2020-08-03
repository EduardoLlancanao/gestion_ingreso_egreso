<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<jsp:include page="../../Vistas/head.jsp" />
</head>

<body>

    <section class="vbox">
    
    	<!-- Header -->
    	
    	<jsp:include page="../../Vistas/header.jsp" />
    	
    	<!-- Fin Header -->

        <section id="app">
                
            <section class="hbox stretch">
            
                <!-- Menu Navegador -->
                
                <jsp:include page="../../Vistas/navBar.jsp" />
                
                <!-- Final Menu Navegador -->
               
                <section id="content">
                    <section class="vbox">
                        <section class="scrollable padder">
                            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                                <li><a href="Home"><i class="fa fa-home"></i> Configuraciones </a></li>
                                <li class="active"> Usuarios </li>
                            </ul>
                            
                            <section class="panel panel-default bg-white m-t-lg">
                            
                            	<div class="col-md-12">
                            	
	                            	<section>
		                            	<div  class="col-sm-12 col-md-12 ">
		                            	<h4 class="m-t-none font-bold"> Usuarios
		                            	</h4>
			                            	<table class="table table-striped b-t b-light">
			                            		<thead>
			                            			<tr>
			                            				<th> RUN </th>
			                            			 	<th> Nombre	</th>
			                            			 	<th> Apellido </th>
			                            			 	<th> Correo </th>
			                            			 	<th> Cargo </th>
			                            			 	<th> Fecha Creado </th>
			                            			</tr>
			                            		</thead>
			                            		<tbody>
			                            			<tr v-for="user of usuarios.data">
			                            				<th> {{user.usu_run}}</th>
			                            				<th> {{user.usu_nombre}}</th>
			                            			 	<th> {{user.usu_apellido}}	</th>
			                            			 	<th> {{user.usu_correo}} </th>
			                            			 	<th> {{user.usu_alias}} </th>
			                            			 	<th> {{user.usu_fecha}} </th>
			                            			</tr>		                            					                            					                            			
			                            		</tbody>
			                            		<tfoot>
			                            		<div class="row">
			                            			<div class="text-left col-md-1">
									                    <select class="form-control form-control-sm">
									                    	<option>5</option>
									                    	<option>10</option>
									                    	<option>25</option>
									                    	<option>50</option>
									                    	<option>100</option>
									                    </select>
									                 </div>
			                            			<div class="text-center">
									                    
									                 </div>
									               </div>
			                            		</tfoot>
			                            	</table>
		                            	</div>
	                           		 </section>
                            	
                            		
                            	
                            	
                            	</div>
        
      						</section>
                            
                		</section>            
        			</section>
				</section>
				
			</section>
		</section>
	</section>
        
    <jsp:include page="../../Vistas/footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    <script type="text/javascript">
    
    var app = new Vue({
	  	  el: '#app',
	  	  data: {
	  		usuarios:{},
	  	    
	  	  },
	  	  methods: {
	  		  
	  		get_usuarios: function (){
	  			  
	  			  var url = 'Usuario';
		            
		            fetch(url, {
		            	method: 'POST', // or 'PUT'
		                body: JSON.stringify({'url': "get_listado"}), // data can be `string` or {object}!
		                headers: {
		                    'Content-Type': 'application/json'
		                }
		            }).then(res => res.json())
		               .catch(error => console.error('Error:', error))
		               .then(function (response) {

		                    if (response.data.length > 0) {
		                    	 	                    	
		                    	this.usuarios = response;
		                
		                    }
		                    
		                }.bind(this));
	  			  
	  		  },
	  
	  	  },
	  	  computed: {
	  		  
	  		
	  		  
	  	  },
    })
    
    app.get_usuarios();
        
    </script>
    
    
</body>
</html>