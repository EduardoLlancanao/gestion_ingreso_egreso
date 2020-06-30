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

        <section>
                
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
								<div class="col-sm-6 col-md-6 padder-v b-r b-light">
									<span class="fa-stack fa-2x pull-left m-r-sm">
										<i class="fa fa-circle fa-stack-2x text-info">
										</i>
										<i class="fa fa-check fa-stack-1x text-white">
										</i>
									</span>
									<a class="clear" href="#">
										<span class="h3 block m-t-xs">
											<strong>
												<font style="vertical-align: inherit;">
													<font style="vertical-align: inherit;">
													$10.000 CLP
													</font>
												</font>
											</strong>
										</span>
										<small class="text-muted text-uc">
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												Ganancia
												</font>
											</font>
										</small>										
									</a>
								
								</div>
								<div class="col-sm-6 col-md-6 padder-v b-r b-light">
									<span class="fa-stack fa-2x pull-left m-r-sm">
										<i class="fa fa-circle fa-stack-2x text-danger">
										</i>
										<i class="fa fa-times fa-stack-1x text-white">
										</i>
									</span>															
									<a href="#">
									<span class="h3 block m-t-xs">
											<strong>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												$15.000 CLP
												</font>
											</font>
											</strong>
										</span>
										<small class="text-muted text-uc">
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">
												Perdida
												</font>
											</font>
										</small>
									</a>
								
								</div>
							</section>
                            
                            
                            <section>
                            	<div class="col-sm-6 col-md-6 ">
                            	<h4 class="m-t-none font-bold"> Porcentaje
                            	</h4>
                            		<div class="inline m">
                            		 <div class="easypiechart text-success easyPieChart" data-percent="25" data-line-width="5" data-track-color="#f0f0f0" data-bar-color="#8ec165" data-rotate="270" data-scale-color="false" data-size="120" data-animate="2000" style="width: 120px; height: 120px; line-height: 120px;">
                            		 	<span class="h2 step font-bold">
                            		 	25
                            		 	</span>
                            		 	%
                            		 	<div class="easypie-text text-muted">
                            		 	Ganancia esperada
                            		 	</div>
                            		 </div>                      		
                            		</div>    
                            		<div class="inline m">
                            		 <div class="easypiechart text-danger easyPieChart" data-percent="30" data-line-width="5" data-track-color="#f0f0f0" data-bar-color="#fb6b5b" data-rotate="270" data-scale-color="false" data-size="120" data-animate="2000" style="width: 120px; height: 120px; line-height: 120px;">
                            		 	<span class="h2 step font-bold">
                            		 	30
                            		 	</span>
                            		 	%
                            		 	<div class="easypie-text text-muted">
                            		 	Perdida estimada
                            		 	</div>
                            		 </div>                      		
                            		</div>                            	
                            	</div>
                            </section>
                            <section>
                            	<div  class="col-sm-12 col-md-12 ">
                            	<h4 class="m-t-none font-bold"> Movimientos
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
	                            			 	Tipo de Movimiento	                            			 	
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
	                            					Egreso
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
	                            					Egreso
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
	                            					Ingreso
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
	                            					Ingreso
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
	                            					Ingreso
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
	                            					Ingreso
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
	                            					Egreso
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

</body>
</html>