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
                                <li><a href="Home"><i class="fa fa-home"></i> Home</a></li>
                                <li class="active"> Gestion Cuentas </li>
                            </ul>
                            
                            
                            <!-- Body -->
                            
                          
                        	<!-- Body Gestion -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">

                                    <li class="nav-item active" style="width: 20%;">
                                  
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">

                                            <span class="fa-stack fa-1x pull-left m-r-sm">
                                                <i class="fa fa-circle fa-stack-2x text-info"></i>
                                                <i class="fa fa-money-check fa-stack-1x text-white"></i>
                                            </span>

                                            <span class="h4 block m-t-xs">
                                                <strong v-if="user_cuentas.count > 0 ">{{user_cuentas.count}}</strong>
                                                <strong v-else>0</strong>
                                                <small class="text-muted text-uc" style="font-size: 11px;">Gestionar Cuentas</small>
                                            </span>

                                        </a>

                                    </li>

                                    <li class="nav-item" style="width: 20%;">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">

                                            <span class="fa-stack fa-1x pull-left m-r-sm">
                                                <i class="fa fa-circle fa-stack-2x text-success"></i>
                                                <i class="fa fa-hand-holding-usd fa-stack-1x text-white"></i>
                                                <span class="pos-abt" data-percent="0" data-line-width="4" data-track-Color="#fff" data-scale-Color="false" data-size="50" data-line-cap='butt' data-animate="2000" data-target="#bugs" data-update="3000"></span>
                                            </span>

                                            <span class="h4 block m-t-xs">
                                                <strong v-if="ingresos.count > 0 ">{{ingresos.count}}</strong>
                                                <strong v-else>0</strong>
                                                <small class="text-muted text-uc" style="font-size: 11px;">Gestionar Ingreso</small>
                                            </span>


                                        </a>
                                    </li>
                                  
                                  
                                    <li class="nav-item" style="width: 20%;">
                                  
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">

                                            <span class="fa-stack fa-1x pull-left m-r-sm">
                                              <i class="fa fa-circle fa-stack-2x text-danger"></i>
                                              <i class="fa fa-cart-arrow-down fa-stack-1x text-white"></i>
                                              <span class="pos-abt" data-percent="100" data-line-width="4" data-track-Color="#fff" data-scale-Color="false" data-size="50" data-line-cap='butt' data-animate="3000" data-target="#firers" data-update="5000"></span>
                                            </span>

                                            <span class="h4 block m-t-xs">
                                            	<strong v-if="egresos.count > 0 ">{{egresos.count}}</strong>
                                                <strong v-else>0</strong>
                                              <small class="text-muted text-uc" style="font-size: 11px;">Gestionar Egreso</small>
                                            </span>

                                        </a>
                                  </li>

                                </ul>


                                <div class="tab-content" id="myTabContent">

                                  <div class="tab-pane fade active in" id="home" role="tabpanel" aria-labelledby="home-tab">
                                  
										<jsp:include page="../../Vistas/Cuentas/Adicional/tab_cuentas.jsp" />

                                  </div>

                                  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                  
                                  		<jsp:include page="../../Vistas/Cuentas/Adicional/tab_ingresos.jsp" />
                                  
                                  </div>
                                  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                  
                                  		<jsp:include page="../../Vistas/Cuentas/Adicional/tab_egresos.jsp" />
                                  
                                  </div>
                                </div>


                            
                            <!-- FIn Body -->
                            
                        </section>
                        <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen, open" data-target="#nav,html"></a>
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
    	    new_cuenta:{
    	    	cuenta_id:0,
    	    	cuenta_nombre:'',
    	    	cuenta_tipo:'Individual',
    	    	cuenta_corresponde:'Credito',
    	    	cuenta_numero :'',
    	    	cuenta_estado : 'Activo',
    	    },
    	    user_cuentas:[],
    	    categoria:{
    	    	id_categoria:0,
    	    	categoria_nombre:'',
    	    	categoria_tipo:'Ingreso',
    	    	categoria_estado:'Activo'
    	    },
    	    ingresos:[],
    	    egresos:[],
    	  },
    	  methods: {
    		  
    		  // Metodos para Cuentas
    		  
    		  get_cuentas: function (){
    			  
    			  var url = 'Cuenta';
  	            
  	            fetch(url, {
  	            	method: 'POST', // or 'PUT'
  	                body: JSON.stringify({'url': "get"}), // data can be `string` or {object}!
  	                headers: {
  	                    'Content-Type': 'application/json'
  	                }
  	            }).then(res => res.json())
  	               .catch(error => console.error('Error:', error))
  	               .then(function (response) {
  						
  	                	
  	                    if (response.data.length > 0) {
  	                    	 	                    	
  	                    	this.user_cuentas = response;
  	                    	
  	                    } 
  	                    
  	                    
  	                    console.log(this.user_cuentas);
  	                    
  	                }.bind(this));
    			  
    		  },
    		  
    		   cargar_modal_cuenta: function(cuenta = null){
    			       			   
    			   if(cuenta != null){
    				   
    				   this.new_cuenta = cuenta;
    				       				   
    			   }else{
    				   
    				   this.new_cuenta.cuenta_id = 0;
    				   
    			   }
    			   
    			   console.log(cuenta);
    			   
    			   $('#exampleModal').modal('show');
    			   
    		  
    	  		},
    	  		
    		    crear_cuenta: function () {
    		    	
    		    	if(this.new_cuenta.cuenta_nombre == ''){
    		    		Swal.fire({
    	                    icon: 'info',
    	                    title: 'Oops...',
    	                    text: 'Debe ingresar un nombre de cuenta',
    	                    footer: ''
    	                });
    	                return;
    		    		
    		    	}
    		    	
    		    	var url = '';
    		    	
    		    	if(this.new_cuenta.cuenta_id == 0){
    		    		url = 'create';
    		    	}else if(this.new_cuenta.cuenta_id > 0){
    		    		url = 'edit';
    		    	}else{
    		    		
    		    		console.log(this.new_cuenta.cuenta_id);
    		    		return;
    		    	}
    		    	
    	            
    	            fetch('Cuenta', {
    	            	method: 'POST', // or 'PUT'
    	                body: JSON.stringify({'url': url, 'data' : this.new_cuenta}), // data can be `string` or {object}!
    	                headers: {
    	                    'Content-Type': 'application/json'
    	                }
    	            }).then(res => res.json())
    	               .catch(error => console.error('Error:', error))
    	               .then(function (response) {
    						
    	                	
    	                    if (response.estado == "success") {
    	                    	
    	                    	$('#exampleModal').modal('hide');
    	                    	
    	                    	Swal.fire({
    	                            icon: response.estado,
    	                            title: 'Oops...',
    	                            text: response.mensaje,
    	                            footer: ''
    	                        });
    	                        
    	                        
    	                    } else {
    	                    	
    	                        Swal.fire({
    	                            icon: response.estado,
    	                            title: 'Oops...',
    	                            text: response.mensaje,
    	                            footer: ''
    	                        });
    	                        
    	                    }
    	                    
    	                    app.get_cuentas();
    	                    
    	                }.bind(this));
    		      
    		    },
    		    
				eliminar_cuenta: function () {
					
					
					Swal.fire({
						  title: '¿Estas Seguro De Eliminar Esta Cuenta?',
						  text: "",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: 'Si, Eliminarla!',
						  cancelButtonText: 'No, No quiero Eliminarla!'
						}).then((result) => {
						  if (result.value) {
							  
							  var url = 'delete';   		    	
			    	            
			    	            fetch('Cuenta', {
			    	            	method: 'POST', // or 'PUT'
			    	                body: JSON.stringify({'url': url, 'data' : this.new_cuenta}), // data can be `string` or {object}!
			    	                headers: {
			    	                    'Content-Type': 'application/json'
			    	                }
			    	            }).then(res => res.json())
			    	                .catch(error => console.error('Error:', error))
			    	                .then(function (response) {
			    						
			    	                	
			    	                    if (response.estado == "success") {
			    	                    	
			    	                    	$('#exampleModal').modal('hide');
			    	                    	
			    	                    	Swal.fire({
			    	                            icon: response.estado,
			    	                            title: 'Oops...',
			    	                            text: response.mensaje,
			    	                            footer: ''
			    	                        });
			    	                        
			    	                        
			    	                    } else {
			    	                    	
			    	                        Swal.fire({
			    	                            icon: response.estado,
			    	                            title: 'Oops...',
			    	                            text: response.mensaje,
			    	                            footer: ''
			    	                        });
			    	                        
			    	                    }
			    	                    
			    	                    app.get_cuentas();
			    	                    
			    	                }.bind(this));
  
						    
						  }
						})
					
    		    },
    		    
    		 // final Metodos para Cuentas
    		    
    		 
    		 // Inicio metodos para Ingresos
    		 
    		    get_ingresos: function (){
      			  
	      			  var url = 'Categoria';
	    	            
	    	            fetch(url, {
	    	            	method: 'POST', // or 'PUT'
	    	                body: JSON.stringify({'url': "get_ingreso"}), // data can be `string` or {object}!
	    	                headers: {
	    	                    'Content-Type': 'application/json'
	    	                }
	    	            }).then(res => res.json())
	    	               .catch(error => console.error('Error:', error))
	    	               .then(function (response) {
	    	                	
	    	                    if (response.data.length > 0) {
	    	                    	 	                    	
	    	                    	this.ingresos = response;
	    	                    	
	    	                    } 

	    	                }.bind(this));
	      			  
	      		  },
    		 
    		    cargar_modal_ingreso: function(categoria =null){
	       			   
     			   if(categoria != null){
     				   
     				   this.categoria = categoria;
     				       				   
     			   }else{
     				   
     				  this.categoria.id_categoria = 0;
     				   
     			   }
     			   
     			   console.log(this.categoria);
     			   
     			   this.categoria.categoria_tipo='Ingreso';
     			   this.categoria.categoria_nombre = '';
     			   
     			   $('#ingresoModal').modal('show');
     			   
     		  
     	  		},
     	  		
				crear_categoria: function (tipo) {
					
					var url = '';					
					
					if(this.categoria.categoria_nombre == ''){
    		    		Swal.fire({
    	                    icon: 'info',
    	                    title: 'Oops...',
    	                    text: 'Debe ingresar un nombre a la categoria',
    	                    footer: ''
    	                });
    	                return;
    		    	}
					
					
					
					if(tipo == 'ingreso'){
						
						this.categoria.categoria_tipo='Ingreso';
	
					} else if (tipo == 'egreso'){
						
						this.categoria.categoria_tipo='Egreso';
						
					}else{
						

	    		    		Swal.fire({
	    	                    icon: 'info',
	    	                    title: 'Uups...',
	    	                    text: 'Al parecer a ocurrido un error, corre!!',
	    	                    footer: ''
	    	                });
	    	                return;
	    		    	
					}
					
					
					
					if(this.categoria.id_categoria == 0){
						
    		    		url = 'create';
    		    		
    		    	}else if(this.categoria.id_categoria > 0){
    		    		
    		    		url = 'edit';
    		    		
    		    	}else{
    		    		
    		    		console.log(this.categoria.id_categoria);
    		    		return;
    		    	}
					
					fetch('Categoria', {
    	            	method: 'POST', // or 'PUT'
    	                body: JSON.stringify({'url': url, 'data' : this.categoria}), // data can be `string` or {object}!
    	                headers: {
    	                    'Content-Type': 'application/json'
    	                }
    	            }).then(res => res.json())
    	                .catch(error => console.error('Error:', error))
    	                .then(function (response) {
    						
    	                	
    	                    if (response.estado == "success") {
    	                    	
    	                    	$('#ingresoModal').modal('hide');
    	                    	$('#egresoModal').modal('hide');
    	                    	
    	                    	Swal.fire({
    	                            icon: response.estado,
    	                            title: 'Oops...',
    	                            text: response.mensaje,
    	                            footer: ''
    	                        });
    	                        
    	                        
    	                    } else {
    	                    	
    	                        Swal.fire({
    	                            icon: response.estado,
    	                            title: 'Oops...',
    	                            text: response.mensaje,
    	                            footer: ''
    	                        });
    	                        
    	                    }
    	                    
    	                    app.get_ingresos();
    	                    app.get_egresos();
    	                    
    	                }.bind(this));
					

    	            
    		      
    		    },
    		 
    		 // Final metodos para ingresos
    		 
    		 // metodos egresos
    		 
    		    get_egresos: function (){
        			  
	      			  var url = 'Categoria';
	    	            
	    	            fetch(url, {
	    	            	method: 'POST', // or 'PUT'
	    	                body: JSON.stringify({'url': "get_egreso"}), // data can be `string` or {object}!
	    	                headers: {
	    	                    'Content-Type': 'application/json'
	    	                }
	    	            }).then(res => res.json())
	    	               .catch(error => console.error('Error:', error))
	    	               .then(function (response) {
	    	                	
	    	                	console.log(response);
	    						
	    	                    if (response.data.length > 0) {
	    	                    	 	                    	
	    	                    	this.egresos = response;
	    	                    	
	    	                    } 

	    	                }.bind(this));
	      			  
	      		  },
    		 
    		    cargar_modal_egreso: function(categoria= null){
    		    	
    		    	this.categoria.categoria_tipo='Egreso';
    		    	this.categoria.categoria_nombre = '';
	       			   
      			   if(categoria != null){
      				   
      				   this.categoria = categoria;
      				       				   
      			   }else{
      				   
      				  this.categoria.id_categoria = 0;
      				   
      			   }
      			   
      			   console.log(this.categoria);
      			   
      			   $('#egresoModal').modal('show');
      			   
      		  
      	  		},
    		    
      	  	//  final metodos egresos
     	  		
				
    		    
    		    
    		  }
    	})
    
    
    app.get_cuentas();
    app.get_ingresos();
    app.get_egresos();
    
    
    </script>

</body>
</html>

