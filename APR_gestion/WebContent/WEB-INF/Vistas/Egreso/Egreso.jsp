<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Egreso</title>
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
                                <li class="active"> Egreso </li>
                            </ul>									
								<section class="col-md-12" >
									<div class="col-md-4">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Seleccione cuenta :
											</label>
											<select class="form-group form-control " v-model="new_egreso.id_cuenta">
											<option v-for="item of user_cuentas.data" v-bind:value="item.cuenta_id">{{item.cuenta_nombre}}</option>
											</select>
										</div>												
									</div>	
									<div class="col-md-4">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Categoria:
											</label>
											<select class="form-group form-control " v-model="new_egreso.id_categoria">
											<option v-for="item of egresos.data" v-bind:value="item.id_categoria">{{item.categoria_nombre}}</option>
											</select>
										</div>												
									</div>								
	                            </section>
	                            	<section class="col-md-12">
									<div class="col-md-4">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Observacion :
											</label>
											<input class="form-group form-control " v-model="new_egreso.movi_observacion">
											</input>
										</div>												
									</div>	
									<div class="col-md-2">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Monto :
											</label>
											<input class="form-group form-control " placeholder="$25.000" v-model="new_egreso.movi_valor">
											</input>
										</div>												
									</div>
									
									<div class="col-md-2">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Fecha :
											</label>
											<input type="date" class="form-group form-control " v-model="new_egreso.movi_fecha">
											</input>
										</div>												
									</div>								
	                            </section>
	                            	<section class="col-md-12" >
									<div class="col-md-12" style="text-align: center;" >
										<div class="CRM-inputGroup CRM-m-t-20">
											<button class="btn btn-s-md btn-danger btn-rounded" @click="crear_movimiento()">Agregar Egreso</button>
										</div>												
									</div>																
	                            </section> 
	                             <section>
	                            	<div  class="col-sm-12 col-md-12 ">
	                            	<h4 class="m-t-none font-bold"> Egresos
	                            	</h4>
		                            	<table class="table table-striped b-t b-light">
		                            		<thead>
		                            			<tr>
		                            			 	<th>
		                            			 	 Cuenta
		                            			 	</th>
		                            			 	<th>
		                            			 	Fecha de Movimiento	                            			 	
		                            			 	</th>	                            			 	
		                            			 	<th>
		                            			 	Monto	                            			 	
		                            			 	</th>
		                            			</tr>
		                            		</thead>
		                            		<tbody>
		                            			<tr>
		                            				<td>
		                            					Banco Santander
		                            				</td>
		                            				<td>
		                            					2 Enero 2020
		                            				</td>	                            				
		                            				<td>
		                            					$ 25.000
		                            				</td>
		                            			</tr>
		                            			<tr>
		                            				<td>
		                            					Banco Estado
		                            				</td>
		                            				<td>
		                            					5 Marzo 2020
		                            				</td>
		                            				
		                            				<td>
		                            					$ 150.000
		                            				</td>
		                            			</tr>
		                            			<tr>
		                            				<td>
		                            					Banco Estado
		                            				</td>
		                            				<td>
		                            					25 Abril 2020
		                            				</td>
		                            				
		                            				<td>
		                            					$ 350.000
		                            				</td>
		                            			</tr>
		                            			<tr>
		                            				<td>
		                            					Banco Santander
		                            				</td>
		                            				<td>
		                            					2 Octubre 2020
		                            				</td>
		                            				
		                            				<td>
		                            					$ 10.000
		                            				</td>
		                            			</tr>
		                            			<tr>
		                            				<td>
		                            					Banco Santander
		                            				</td>
		                            				<td>
		                            					13 Septiembre 2020
		                            				</td>
		                            				
		                            				<td>
		                            					$ 68.000
		                            				</td>
		                            			</tr>
		                            			<tr>
		                            				<td>
		                            					Banco Santander
		                            				</td>
		                            				<td>
		                            					5 Julio 2020
		                            				</td>
		                            				
		                            				<td>
		                            					$ 30.000
		                            				</td>
		                            			</tr>
		                            			<tr>
		                            				<td>
		                            					Banco Estado
		                            				</td>
		                            				<td>
		                            					27 Diciembre 2020
		                            				</td>
		                            				
		                            				<td>
		                            					$ 500.000
		                            				</td>
		                            			</tr>
		                            			
		                            		</tbody>
		                            	</table>
	                            	</div>
                           		 </section>                                
                            
                             
                                
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
    	    user_cuentas:[],
    	    ingresos:[],
    	    egresos:[],
    	    new_egreso:{
    	    	id_cuenta:0,
    	    	id_categoria:0,
    	    	movi_tipo:'Egreso',
    	    	movi_valor:0,
    	    	movi_fecha:new Date(Date.now()).toISOString().split('T')[0],
    	    	movi_observacion:'',
    	    	
    	    },
    	  },
    	  methods: {
    		  
    		  crear_movimiento: function () {
    		    	
    		    	if(this.new_egreso.id_cuenta == 0){
    		    		Swal.fire({
    	                    icon: 'info',
    	                    title: 'Oops...',
    	                    text: 'Debe seleccionar una cuenta',
    	                    footer: ''
    	                });
    	                return;
    		    		
    		    	}
    		    	
    		    	if(this.new_egreso.id_categoria == 0){
    		    		Swal.fire({
    	                    icon: 'info',
    	                    title: 'Oops...',
    	                    text: 'Debe seleccionar una categoria',
    	                    footer: ''
    	                });
    	                return;
    		    		
    		    	}
    		    	
    		    	if(this.new_egreso.movi_valor == 0){
    		    		Swal.fire({
    	                    icon: 'info',
    	                    title: 'Oops...',
    	                    text: 'El monto debe ser mayor que 0',
    	                    footer: ''
    	                });
    	                return;
    		    		
    		    	}
    		    	
    		    	if(this.new_egreso.movi_observacion == ''){
    		    		Swal.fire({
    	                    icon: 'info',
    	                    title: 'Oops...',
    	                    text: 'La Observacion no puede ir vacía',
    	                    footer: ''
    	                });
    	                return;
    		    		
    		    	}
    		    	
   		    	 		    	
    	            
    	            fetch('Egreso', {
    	            	method: 'POST', // or 'PUT'
    	                body: JSON.stringify({'url': 'create', 'data' : this.new_egreso}), // data can be `string` or {object}!
    	                headers: {
    	                    'Content-Type': 'application/json'
    	                }
    	            }).then(res => res.json())
    	               .catch(error => console.error('Error:', error))
    	               .then(function (response) {
    						
    	                	
    	                    if (response.estado == "success") {
    	                    	  	                    	
    	                    	Swal.fire({
    	                            icon: response.estado,
    	                            title: '',
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
    		  
    		  
    	  }
    })
    
    app.get_cuentas();
    app.get_ingresos();
    app.get_egresos();
    
    </script>

</body>
</html>