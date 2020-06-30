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
                                <li class="active"> Gestion Cuentas </li>
                            </ul>
                            
                            
                            <!-- Body -->
                            
                          
                        	<!-- Body Gestion -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">

                                    <li class="nav-item active" style="width: 12%;">
                                  
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">

                                            <span class="fa-stack fa-1x pull-left m-r-sm">
                                                <i class="fa fa-circle fa-stack-2x text-info"></i>
                                                <i class="fa fa-money-check fa-stack-1x text-white"></i>
                                            </span>

                                            <span class="h4 block m-t-xs">
                                                <strong>0</strong>
                                                <small class="text-muted text-uc" style="font-size: 11px;">Cuentas</small>
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
                                                <strong id="bugs">0</strong>
                                                <small class="text-muted text-uc" style="font-size: 11px;">Categorias Ingreso</small>
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

                                            <span class="h4 block m-t-xs"><strong id="firers">0</strong>
                                              <small class="text-muted text-uc" style="font-size: 11px;">Categorias Egreso</small>
                                            </span>

                                        </a>
                                  </li>

                                </ul>


                                <div class="tab-content" id="myTabContent">

                                  <div class="tab-pane fade active in" id="home" role="tabpanel" aria-labelledby="home-tab">
                                  
                                  <!-- Cuentas view -->
                                  
                                  <br><br><br>
                                  
                                  <section class="Col-md-12">
                                  
                                        
                                    <div class="row m-l-none m-r-none bg-light lter" >

                                      <div class="col-sm-1 col-md-1 padder-v" style="border : solid 1px #3e5468;Border-radius : 5px;margin : 5px;" data-toggle="modal" data-target="#exampleModal">
                                         <div style="margin: 0px;padding: 0px;margin-top: -10px;cursor:pointer;">
                                         <span class="fa-stack fa-2x pull-left m-r-sm">
                                           <i class="fa fa-circle fa-stack-2x text-info"></i>
                                           <i class="fa fa-plus fa-stack-1x text-white"></i>
                                         </span>

                                           <span class="h4 block m-t-xs"><strong></strong>
                                           <small class="text-muted text-uc" style="font-size: 11px;"></small></span>
                                        </div>
                                     </div>
                                     
                                     <div class="col-sm-5 col-md-2 padder-v" style="border : solid 1px #3e5468;Border-radius : 5px;margin : 5px;">
                                         <div style="margin: 0px;padding: 0px;margin-top: -10px;">
                                         
                                             <span class="fa-stack fa-2x pull-left m-r-sm">
                                               <i class="fa fa-circle fa-stack-2x text-info"></i>
                                               <i class="fa fa-money-check fa-stack-1x text-white"></i>
                                             </span>

                                               <span class="h5 block m-t-xs"><strong>Nombre Cuenta</strong>
                                               <br>
                                               <small class="text-muted text-uc" style="font-size: 10px;">N° Cuenta</small>
                                               <br>
                                               <small class="text-muted text-uc" style="font-size: 8px;">Tipo Cuenta</small></span>
                                               
                                         </div>
                                         

                                     </div>

                                    </div>

                                    <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                                </button>
                                              </div>
                                              <div class="modal-body">
                                              
                                              <!-- Cuerpo Modal -->
                                              
                                               <div class="col-md-12" style="border: 1px solid red;border-radius: 5px;border-color: rgb(203, 214, 226);">
                                    
                                                <!--  -->
                                                <div class="row">
                                                    <div class="col-md-12" style="text-align: center;">
                                                        <h3>
                                                            <span style="text-align: center;">
                                                              <b>Agregar Nueva Cuenta</b>
                                                            </span>
                                                        </h3>
                                                    </div>

                                                    <div class="col-md-12">
                                                         <div class="CRM-inputGroup CRM-m-t-20">
                                                            <label>Nombre Cuenta: </label>
                                                            <input type="text" v-model="lista_correos.DescListaC" class="form-group form-control ">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                          <div class="CRM-inputGroup CRM-m-t-20">
                                                            <label>Tipo de Cuenta : </label>
                                                            <select class="form-group form-control " v-model="lista_correos.EstadoListaC">
                                                              <option value="A">Individual</option>
                                                              <option value="I">Comunitario</option>
                                                            </select>
                                                          </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                          <div class="CRM-inputGroup CRM-m-t-20">
                                                            <label>Correspondiente a : </label>
                                                            <select class="form-group form-control " v-model="lista_correos.EstadoListaC">
                                                              <option value="transaccionales">Tarjeta de Credito</option>
                                                              <option value="transaccionales">Tarjeta de Debito</option>                                              
                                                              <option value="ahorro">Cuenta de ahorro</option>
                                                              <option value="transaccionales">Cuenta transaccionales</option>
                                                              <option value="Otros">Otros</option>                                              
                                                            </select>
                                                          </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                         <div class="CRM-inputGroup CRM-m-t-20">
                                                            <label>NÂ° Cuenta : </label>
                                                            <input type="text" v-model="lista_correos.correo_asunto" class="form-group form-control ">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                         <div class="CRM-inputGroup CRM-m-t-20">
                                                            <label>Estado  : </label>
                                                            <select class="form-group form-control " v-model="lista_correos.EstadoListaC">
                                                              <option value="A">Activo</option>
                                                              <option value="I">Inactivo</option>
                                                            </select>
                                                        </div>
                                                    </div>       
                                            
                                                </div>
                                            <!--  -->
                                              
                                          </div>
                                              
                                          <!--  Fin cuerpo modal -->
                                                
                                          </div>
                                          
                                          <br><br>
                                          
                                          <div class="modal-footer">
                                          
                                          <br><br><br><br>
                                          
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal"> Cancelar </button>
                                            <button type="button" class="btn btn-primary"> Guardar </button>
                                          </div>
                                        </div>
                                      </div>
                                    </div>



                                </section>
                                  
                                  
                                  
                                  <!-- Fin cunetas views -->

                                </div>

                                  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
                                  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
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

</body>
</html>