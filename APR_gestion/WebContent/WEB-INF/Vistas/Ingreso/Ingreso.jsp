<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ingreso</title>
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
                                <li class="active"> Ingreso </li>
                            </ul>									
								<section class="col-md-12" >
									<div class="col-md-4">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Seleccione cuenta :
											</label>
											<select class="form-group form-control ">
											<option value="A">Individual</option>
											<option value="I">Comunitario</option>
											</select>
										</div>												
									</div>	
									<div class="col-md-4">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Correspondiente a :
											</label>
											<select class="form-group form-control ">
											<option value="transaccionales">Tarjeta de Credito</option>
											<option value="transaccionales">Tarjeta de Debito</option>
											<option value="Ahorro">Cuenta de ahorro</option>
											<option value="transaccionales">Cuenta transaccionales</option>
											<option value="Otros">Otros</option>
											</select>
										</div>												
									</div>								
	                            </section>
	                            <section class="col-md-12">
									<div class="col-md-4">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Numero de cuenta :
											</label>
											<input class="form-group form-control ">
											</input>
										</div>												
									</div>	
									<div class="col-md-4">
										<div class="CRM-inputGroup CRM-m-t-20">
											<label>
												Monto :
											</label>
											<input class="form-group form-control " placeholder="$25.000">
											</input>
										</div>												
									</div>								
	                            </section>
	                            <section class="col-md-12" >
									<div class="col-md-12" style="text-align: center;" >
										<div class="CRM-inputGroup CRM-m-t-20">
											<button class="btn btn-s-md btn-primary btn-rounded">Agregar Ingreso</button>
										</div>												
									</div>																
	                            </section>   
	                            <section>
	                            	<div  class="col-sm-12 col-md-12 ">
	                            	<h4 class="m-t-none font-bold"> Ingresos
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

</body>
</html>