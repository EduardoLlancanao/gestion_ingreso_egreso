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

           <span class="h5 block m-t-xs">
           		<strong>Nombre Cuenta</strong>
	            <br>
	            <small class="text-muted text-uc" style="font-size: 10px;">N° Cuenta</small>
	            <br>
           		<small class="text-muted text-uc" style="font-size: 8px;">Tipo Cuenta</small>
           </span>
             
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
                          <label>N° Cuenta : </label>
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
  
<!-- Fin cuentas views -->