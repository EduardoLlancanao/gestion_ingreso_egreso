<!-- Cuentas view -->

<br><br><br>

<section class="Col-md-12">

	<div class="col-sm-1 col-md-1 padder-v" style="border : solid 1px #3e5468;Border-radius : 5px;margin : 5px;cursor:pointer;" @click="cargar_modal_cuenta">
       <div style="margin: 0px;padding: 0px;margin-top: -10px;cursor:pointer;">
	       <span class="fa-stack fa-2x pull-left m-r-sm">
	         <i class="fa fa-circle fa-stack-2x text-info"></i>
	         <i class="fa fa-plus fa-stack-1x text-white"></i>
	       </span>
      </div>
   </div>

  <div v-if="user_cuentas.count > 0" class="row" >
   
		   <div v-for="cuenta of user_cuentas.data">
		   
		   		<div class="col-sm-5 col-md-2 padder-v" style="border : solid 1px #3e5468;Border-radius : 5px;margin : 5px;" @click="cargar_modal_cuenta(cuenta)">
					<div style="margin: 0px;padding: 0px;margin-top: -10px;">
			       
			           <span class="fa-stack fa-2x pull-left m-r-sm">
			             <i class="fa fa-circle fa-stack-2x text-info"></i>
			             <i class="fa fa-money-check fa-stack-1x text-white"></i>
			           </span>
			
			           <span class="h5 block m-t-xs">
			           		<strong>{{cuenta.cuenta_nombre}}</strong>
				            <br>
				            <small v-if="cuenta.cuenta_numero !=''" class="text-muted text-uc" style="font-size: 10px;">N° {{cuenta.cuenta_numero}}</small>
				            <small v-else class="text-muted text-uc" style="font-size: 10px;">S/N</small>
				            <br>
			           		<small class="text-muted text-uc" style="font-size: 8px;">{{cuenta.cuenta_tipo}} - {{cuenta.cuenta_corresponde}}</small>
			           </span>
			             
			       </div>
			       
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
                <!--   <span aria-hidden="true">&times;</span> -->
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
	                            <b v-if="new_cuenta.cuenta_id == 0">Agregar Nueva Cuenta</b>
	                            <b v-if="new_cuenta.cuenta_id > 0">Editar Cuenta</b>
	                          </span>
	                      </h3>
	                  </div>
	                  
	                  <input type="hidden" class="form-group form-control " v-model="new_cuenta.cuenta_id">
	
	                  <div class="col-md-12">
	                       <div class="CRM-inputGroup CRM-m-t-20">
	                          <label>Nombre Cuenta: </label>
	                          <input type="text" class="form-group form-control " v-model="new_cuenta.cuenta_nombre">
	                      </div>
	                  </div>
	                  <div class="col-md-6">
	                        <div class="CRM-inputGroup CRM-m-t-20">
	                          <label>Tipo de Cuenta : </label>
	                          <select class="form-group form-control " v-model="new_cuenta.cuenta_tipo">
	                            <option value="Individual">Individual</option>
	                            <option value="Grupal">Comunitario</option>
	                          </select>
	                        </div>
	                  </div>
	                  
	                  <div class="col-md-6">
	                        <div class="CRM-inputGroup CRM-m-t-20">
	                          <label>Correspondiente a : </label>
	                          <select class="form-group form-control " v-model="new_cuenta.cuenta_corresponde">
	                            <option value="Credito">Tarjeta de Credito</option>
	                            <option value="Debito">Tarjeta de Debito</option>                                              
	                            <option value="ahorro">Cuenta de ahorro</option>
	                            <option value="transaccionales">Cuenta transaccionales</option>
	                            <option value="Otros">Otros</option>                                              
	                          </select>
	                        </div>
	                  </div>
	                  
	                  <div class="col-md-6">
	                       <div class="CRM-inputGroup CRM-m-t-20">
	                          <label>N° Cuenta : </label>
	                          <input type="text" class="form-group form-control " v-model="new_cuenta.cuenta_numero">
	                      </div>
	                  </div>
	                  
	                  <div class="col-md-6">
	                       <div class="CRM-inputGroup CRM-m-t-20">
	                          <label>Estado  : </label>
	                          <select class="form-group form-control " v-model="new_cuenta.cuenta_estado">
	                            <option value="Activo">Activo</option>
	                            <option value="Inactiva">Inactivo</option>
	                          </select>
	                      </div>
	                  </div>       
	          
	              </div>
	          <!--  -->
	            
	        </div>
	            
	        <!--  Fin cuerpo modal -->
                
          </div>
          
          <div class="modal-footer" style="margin : 10px;">

          	<button type="button" class="btn btn-info" data-dismiss="modal"> Cancelar </button>
            <button type="button" v-if="new_cuenta.cuenta_id > 0" class="btn btn-danger" @click="eliminar_cuenta()"> Eliminar Cuenta </button>
            <button type="button" class="btn btn-primary" @click="crear_cuenta()"> Guardar Cuenta </button>
          </div>
        </div>
      </div>
    </div>



</section>
  
<!-- Fin cuentas views -->