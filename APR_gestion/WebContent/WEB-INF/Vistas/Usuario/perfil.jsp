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
                                <li class="active"> Mi Perfil </li>
                            </ul>
                            
                            <section class="panel panel-default bg-white m-t-lg">
                            
                            	<div class="col-md-12">
                            	
                            		<div class="row">
                            		
                            			<div class="col-md-3">
                            				<div class="col-md-10" style="border: 1px solid black;">
                            				<br>
												<label>Foto de Perfil </label>
												<img src="http://icons.iconarchive.com/icons/papirus-team/papirus-status/512/avatar-default-icon.png" width="100%">
											</div>
											
											<div class="form-group mb-3 col-md-12">
											<br>
												<label>Cargo : {{usuario.usu_alias}}</label>
												<br>
												<label>RUT : {{usuario.usu_run}}</label>
												<div class="input-group">
																										
												</div>
											</div>    	                   			
                            			</div>
                            			
                            			<form id="myForm" name="myForm" class="col-md-6">
						        
									        <div class="row">
									        <br>
									        <br>
												<div class="form-group mb-3 col-md-6">
												
													<label>Nombre</label>
													<div class="input-group">
														<input id="nombre" name="nombre" type="text" class="form-control form-control-lg" v-model="usuario.usu_nombre" required/>
														
													</div>
												</div>
												
												<div class="form-group mb-3 col-md-6">
													<label>Apellido</label>
													<div class="input-group">
														<input id="apellido" name="apellido" type="text" class="form-control form-control-lg" v-model="usuario.usu_apellido" required/>
														
													</div>
												</div>
																					
												<div class="form-group mb-3 col-lg-6">
													<div class="clearfix">
														<label class="float-left">RUT</label> <span id="pwdok"></span>
													</div>
													<div class="input-group">
														<input name="run" id="run" type="text" v-model="usuario.usu_run" class="form-control form-control-lg" required/>
														
													</div>
												</div>
												
												<div class="form-group mb-3 col-lg-6">
													<label>Correo</label> <span id="emailok"></span>
													<div class="input-group col-lg-10">
														<input id="correo" name="correo" type="email" v-model="usuario.usu_correo" class="form-control form-control-lg" required/>
														
													</div>
												</div>
									
												<div class="row text-right">
												<br>
												<br>
													<div class="col-md-6">
															<!--  <a href="./" class="col-md-6 btn btn-default btn-block">Volver al Login</a> -->
													</div>
													
													<div class="col-md-6">
															<!-- <button type="button" onClick="registrar()" class="col-md-8 btn btn-md btn-primary ">Actualizar Datos</button> -->
													</div>
													
													
												</div>
									
											</form>
                            		
                            		
                            		</div>
                            	
                            	
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
	  	data:{
	  		usuario : [],
	  		
	  	},
	  	
	  	methods:{
	  		
	  		get_listado_movimiento: function (){
  			  
  			  var url = 'Usuario';
	            
	            fetch(url, {
	            	method: 'POST', // or 'PUT'
	                body: JSON.stringify({'url': "get_by_id"}), // data can be `string` or {object}!
	                headers: {
	                    'Content-Type': 'application/json'
	                }
	            }).then(res => res.json())
	               .catch(error => console.error('Error:', error))
	               .then(function (response) {
	                	
	                    if (response.data.length > 0) {
	                    	 	                    	
	                    	this.usuario = response.data[0];
	                    	
	                    }else{
	                    	this.usuario.data = [];
	                    }

	                }.bind(this));
  			  
  		  },
	  	},
	  	
	  	computed: {

	    },
    })
    
    app.get_listado_movimiento();

    </script>
    
    
</body>
</html>