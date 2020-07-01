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

                                    <li class="nav-item active" style="width: 20%;">
                                  
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">

                                            <span class="fa-stack fa-1x pull-left m-r-sm">
                                                <i class="fa fa-circle fa-stack-2x text-info"></i>
                                                <i class="fa fa-money-check fa-stack-1x text-white"></i>
                                            </span>

                                            <span class="h4 block m-t-xs">
                                                <strong>1</strong>
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
                                                <strong id="bugs">2</strong>
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

                                            <span class="h4 block m-t-xs"><strong id="firers">5</strong>
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

</body>
</html>