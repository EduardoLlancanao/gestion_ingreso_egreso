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
		                            			 	<th> Cuenta	</th>
		                            			 	<th> Categoria </th>	                            			 	
		                            			 	<th> Monto </th>
		                            			 	<th> Observación </th>
		                            			 	<th> Movimiento </th>
		                            			</tr>
		                            		</thead>
		                            		<tbody>		                            		
		                            			<tr v-for="ingreso of listado_egresos.data">
		                            				<td> <b>{{ingreso.cuenta_nombre}}</b>  </td>
		                            				<td> <span class="label bg-dark">{{ingreso.categoria_nombre}}</span> <br> <span class="label bg-danger">{{ingreso.movi_tipo}}</span>  </td>	                            				
		                            				<td style="color: red;"> - $ {{ingreso.movi_valor}} </td>
		                            				<td> {{ingreso.movi_observacion}} </td>
		                            				<td> <span class="label bg-info">{{ingreso.movi_fecha}}</span> <br> <span class="label bg-primary">{{ingreso.usuario}}</span> </td>
		                            			</tr>		                            					                            			
		                            		</tbody>
		                            		<div class="text-center">
								                    <ul class="pagination pagination">
								                      <li v-if="listado_egresos.count >= filtro.limit"><a @click="pagination('menos',1)"><i class="fa fa-chevron-left"></i></a></li>
								                      
								                      <li v-for="(index, page) of getPaginas" ><a @click="pagination('pagina',index)">{{index}}</a></li>
								                     
								                      <li v-if="listado_egresos.count >= filtro.limit" ><a @click="pagination('mas',1)"><i class="fa fa-chevron-right"></i></a></li>
								                    </ul>
								                 </div>
								                 </div>

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
    	    listado_egresos:[],
    	    egresos:[],
    	    new_egreso:{
    	    	id_cuenta:0,
    	    	id_categoria:0,
    	    	movi_tipo:'Egreso',
    	    	movi_valor:0,
    	    	movi_fecha:new Date(Date.now()).toISOString().split('T')[0],
    	    	movi_observacion:'',
    	    	
    	    },
    	    filtro:{
    	    	limit:5,
    	    	page:1,
    	    	movi_tipo:'Egreso',
    	    },
    	  },
    	  methods: {
    		  
 pagination: function (tipo, pagina){
    			  
    			  switch (tipo) {
    			  
					case "mas":
							if(this.filtro.page == this.getPaginas){
								break;
							}
						
							this.filtro.page = this.filtro.page+1;
							
							app.get_listado_egresos();
							
						break;
					case "menos":
							if(this.filtro.page == 1){
								break;
							}
							this.filtro.page = this.filtro.page-1;
							
							app.get_listado_egresos();
						
						break;
					case "pagina":
						
							this.filtro.page = pagina;
							
							app.get_listado_egresos();
						
						break;
	
					default:
						break;
				}
    			 
    			  
    		  },
    		  
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
    	                    
    	                    app.get_listado_ingresos();
    	                    
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
      		  
	      	get_listado_egresos: function (){
	  			  
	  			  var url = 'Egreso';
		            
		            fetch(url, {
		            	method: 'POST', // or 'PUT'
		                body: JSON.stringify({'url': "get_egreso", 'data' : this.filtro}), // data can be `string` or {object}!
		                headers: {
		                    'Content-Type': 'application/json'
		                }
		            }).then(res => res.json())
		               .catch(error => console.error('Error:', error))
		               .then(function (response) {
		                	
		                    if (response.data.length > 0) {
		                    	 	                    	
		                    	this.listado_egresos = response;
		                    	
		                    } 
	
		                }.bind(this));
	  			  
	  		  },
    		  
    		  
    	  },
    	  
    	  computed: {

  	        getPaginas: function () {
  	        	
  	        	let total = 0;
  	        	
  	        	if(this.listado_egresos.count == 0){
  	        		
  	        		return total;
  	        		
  	        	}else if(this.listado_egresos.count > 0 && this.listado_egresos.count < this.filtro.limit){
  	        		total = 1;
  	        	}else{
  	        		
  	        		total = Math.ceil(this.listado_egresos.count/this.filtro.limit);
  	        		
  	        	}
  	        	
  	            return total;
  	        },

  	    },
    })
    
    app.get_cuentas();
    app.get_listado_egresos();
    app.get_egresos();
    
    </script>

</body>
</html>