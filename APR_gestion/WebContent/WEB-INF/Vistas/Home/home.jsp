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
                                <li class="active"> Dashboard </li>
                            </ul>
                            
                                                      
                            
                            
                            									
							<section class="panel panel-default">							
								<div class="col-sm-3 col-md-3 padder-v  b-light">
									<span class="fa-stack fa-2x pull-left m-r-sm">
										<i class="fa fa-circle fa-stack-2x text-success">
										</i>
										<i class="fa fa-check fa-stack-1x text-white">
										</i>
									</span>
									<a class="clear" href="Ingreso">
										<span class="h3 block m-t-xs">
											<strong>
												<font style="vertical-align: inherit;">
													<font style="vertical-align: inherit;">
													$ {{kpi.ingreso}} CLP
													</font>
												</font>
											</strong>
										</span>
										<small class="text-muted text-uc">
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												Ingresos Mes Actual
												</font>
											</font>
										</small>										
									</a>
								
								</div>
								<div class="col-sm-3 col-md-3 padder-v b-r b-light">
									<span class="fa-stack fa-2x pull-left m-r-sm">
										<i class="fa fa-circle fa-stack-2x text-danger">
										</i>
										<i class="fa fa-times fa-stack-1x text-white">
										</i>
									</span>															
									<a href="Egreso">
									<span class="h3 block m-t-xs">
											<strong>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												$ {{kpi.Egreso}} CLP
												</font>
											</font>
											</strong>
										</span>
										<small class="text-muted text-uc">
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												Egresos Mes Actual
												</font>
											</font>
										</small>
									</a>
								
								</div>
								
								<div class="col-sm-3 col-md-3 padder-v b-r b-light">
									<span class="fa-stack fa-2x pull-left m-r-sm">
										<i class="fa fa-circle fa-stack-2x text-info">
										</i>
										<i class="fas fa-coins fa-stack-1x text-white">
										
										</i>
									</span>															
									<a href="#">
									<span class="h3 block m-t-xs">
											<strong>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												$ {{kpi.rentabilidad}} CLP
												</font>
											</font>
											</strong>
										</span>
										<small class="text-muted text-uc">
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												Rentabilidad Mes Actual
												</font>
											</font>
										</small>
									</a>
								
								</div>
							</section>
                            
                            
                            
                            <section >
                            	<div  class="col-sm-12 col-md-12 ">
                            		<h4 class="m-t-none font-bold"> Ultimos Movimientos </h4>
                            		
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
		                            			<tr v-for="ingreso of listado.data">
		                            				<td> <b>{{ingreso.cuenta_nombre}}</b>  </td>
		                            				<td> <span class="label bg-dark">{{ingreso.categoria_nombre}}</span> <br> <span v-if="ingreso.movi_tipo == 'Ingreso'" class="label bg-primary">{{ingreso.movi_tipo}}</span> <span v-if="ingreso.movi_tipo == 'Egreso'" class="label bg-danger">{{ingreso.movi_tipo}}</span>  </td>	                            				
		                            				<td v-if="ingreso.movi_tipo == 'Ingreso'" style="color: blue;"> $ {{ingreso.movi_valor}} </td>
		                            				<td v-if="ingreso.movi_tipo == 'Egreso'" style="color: red;"> - $ {{ingreso.movi_valor}} </td>
		                            				<td> {{ingreso.movi_observacion}} </td>
		                            				<td> <span class="label bg-info">{{ingreso.movi_fecha}}</span> <br> <span class="label bg-primary">{{ingreso.usuario}}</span> </td>
		                            			</tr>		                            					                            			
		                            		</tbody>
		                            		<tfoot>
		                            		<div class="row">
		                            			<div class="text-left col-md-1">
								                    <select class="form-control form-control-sm" v-model="filtro.limit" v-on:change="get_listado_movimiento()">
								                    	<option>5</option>
								                    	<option>10</option>
								                    	<option>25</option>
								                    	<option>50</option>
								                    	<option>100</option>
								                    </select>
								                 </div>
								                 <div class="text-left col-md-2">
								                    <select class="form-control form-control-sm" v-model="filtro.movi_tipo" v-on:change="get_listado_movimiento()">
								                    	<option value="Ingreso">Ingreso</option>
								                    	<option value="Egreso">Egreso</option>
								                    	<option value="InOut">Todos</option>
								                    </select>
								                 </div>
		                            			<div class="text-center">
								                    <ul class="pagination pagination">
								                      <li v-if="listado.count >= filtro.limit"><a @click="pagination('menos',1)"><i class="fa fa-chevron-left"></i></a></li>
								                      
								                      <li v-for="(index, page) of getPaginas" ><a @click="pagination('pagina',index)">{{index}}</a></li>
								                     
								                      <li v-if="listado.count >= filtro.limit" ><a @click="pagination('mas',1)"><i class="fa fa-chevron-right"></i></a></li>
								                    </ul>
								                 </div>
								                 </div>
		                            		</tfoot>
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
	  	data:{
	  		kpi:[],
	  		listado:[],	  		
	  		filtro:{
    	    	limit:5,
    	    	page:1,
    	    	movi_tipo:'InOut',
    	    },
	  		
	  	},
	  	
	  	methods:{
	  		pagination: function (tipo, pagina){
  			  
  			  switch (tipo) {
					case "mas":
							if(this.filtro.page == this.getPaginas){
								break;
							}
						
							this.filtro.page = this.filtro.page+1;
							
							app.get_listado_movimiento();
							
						break;
					case "menos":
							if(this.filtro.page == 1){
								break;
							}
							this.filtro.page = this.filtro.page-1;
							
							app.get_listado_movimiento();
						
						break;
					case "pagina":
						
							this.filtro.page = pagina;
							
							app.get_listado_movimiento();
						
						break;
	
					default:
						break;
				}
	  
  		  },
	  		get_listado_movimiento: function (){
  			  
  			  var url = 'Home';
	            
	            fetch(url, {
	            	method: 'POST', // or 'PUT'
	                body: JSON.stringify({'url': "get_listado", 'data' : this.filtro}), // data can be `string` or {object}!
	                headers: {
	                    'Content-Type': 'application/json'
	                }
	            }).then(res => res.json())
	               .catch(error => console.error('Error:', error))
	               .then(function (response) {
	                	
	                    if (response.data.length > 0) {
	                    	 	                    	
	                    	this.listado = response;
	                    	
	                    }else{
	                    	this.listado.data = [];
	                    	this.listado.count = 0;
	                    }

	                }.bind(this));
  			  
  		  },
  		get_kpi: function (){
			  
			  var url = 'Home';
	            
	            fetch(url, {
	            	method: 'POST', // or 'PUT'
	                body: JSON.stringify({'url': "get_kpi", 'data' : this.filtro}), // data can be `string` or {object}!
	                headers: {
	                    'Content-Type': 'application/json'
	                }
	            }).then(res => res.json())
	               .catch(error => console.error('Error:', error))
	               .then(function (response) {
	                	
	                    if (response.data.length > 0) {
	                    	 	                    	
	                    	this.kpi = response.data[0];
	                    	
	                    }else{
	                    	this.kpi = [];
	                    }

	                }.bind(this));
			  
		  },
	  	},
	  	
	  	computed: {

	        getPaginas: function () {
	        	
	        	let total = 0;
	        	
	        	if(this.listado.count == 0){
	        		
	        		return total;
	        		
	        	}else if(this.listado.count > 0 && this.listado.count < this.filtro.limit){
	        		total = 1;
	        	}else{
	        		
	        		total = Math.ceil(this.listado.count/this.filtro.limit);
	        		
	        	}
	        	
	            return total;
	        },

	    },
    })
    
    
    app.get_listado_movimiento();
    app.get_kpi();
    
    </script>

</body>
</html>