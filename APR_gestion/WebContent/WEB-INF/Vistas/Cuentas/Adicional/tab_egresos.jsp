<!-- Cuentas view -->
<br><br>

<section class="Col-md-12">

  <div class="row m-l-none m-r-none " >

    <div class="col-sm-2 col-md-2 btn btn-sm btn-danger" style="border : solid 1px #3e5468;Border-radius : 5px;margin : 5px;" @click="cargar_modal_egreso()">
       Nueva Categoria
   </div>
   
  </div>
  
  <br>
  <div  class="col-sm-12 col-md-12 ">
                            	<h4 class="m-t-none font-bold"> Listado Egresos
                            	</h4>
	                            	<table class="table table-striped b-t b-light">
	                            		<thead>
	                            			<tr>
	                            			 	<th>
	                            			 	 Nombre
	                            			 	</th>
	                            			 	<th>
	                            			 	Estado                            			 	
	                            			 	</th>
	                            			 	<th>
	                            			 	Fecha Creado                            			 	
	                            			 	</th>
	                            			 	<th>
	                            			 	Acciones	                            			 	
	                            			 	</th>
	                            			 	
	                            			</tr>
	                            		</thead>
	                            		<tbody>
	                            			<tr v-for="item of egresos.data">
	                            				<td>
	                            					{{item.categoria_nombre}}
	                            				</td>
	                            				<td>
	                            					{{item.categoria_estado}}
	                            				</td>
	                            				<td>
	                            					{{item.categoria_fecha}}
	                            				</td>
	                            				<td>
	                            					Editar
	                            				</td>
	                            			</tr>                            			
	                            			
	                            		</tbody>
	                            	</table>
                            	</div>
  
  
  

  <!-- Modal -->
      <div class="modal fade" id="egresoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel"></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="border: 1px solid red;border-radius: 5px;border-color: rgb(203, 214, 226);">
            
            <!-- Cuerpo Modal -->
           
              <!--  -->
              <div class="row">
                  <div class="col-md-12" style="text-align: center;">
                      <h4>
                          <span style="text-align: center;">
                            <b>Nueva Categoria Egreso</b>
                          </span>
                      </h4>
                  </div>

                  <div class="col-md-6">
                       <div class="CRM-inputGroup CRM-m-t-20">
                          <label>Nombre Categoria: </label>
                          <input type="text" class="form-group form-control " v-model="categoria.categoria_nombre">
                      </div>
                  </div>
                                   
                  <div class="col-md-6">
                       <div class="CRM-inputGroup CRM-m-t-20">
                          <label>Estado  : </label>
                          <select class="form-group form-control " v-model="categoria.categoria_estado">
                            <option value="Activo">Activo</option>
                            <option value="Inactivo">Inactivo</option>
                          </select>
                      </div>
                  </div>       
          
              </div>
          <!--  -->

            
        <!--  Fin cuerpo modal -->
                
          </div>
          <div class="modal-footer">          
            <button type="button" class="btn btn-secondary" data-dismiss="modal"> Cancelar </button>
            <button type="button" class="btn btn-primary" @click="crear_categoria('egreso')"> Guardar </button>
          </div>
        </div>
      </div>
    </div>



</section>
  
<!-- Fin cuentas views -->