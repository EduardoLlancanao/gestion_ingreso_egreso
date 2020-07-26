<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Informes</title>
	<jsp:include page="../../Vistas/head.jsp" />
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/cylinder.js"></script>
    <script src="https://code.highcharts.com/modules/funnel3d.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>  
	<!-- optional -->  
	<script src="https://code.highcharts.com/modules/offline-exporting.js"></script>  
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
    
    
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
                
                <section id="content">
                	
                	<br>
                	<br>
                	<br>
                
                	<div class="col-md-6 offset-md-10">
				            <div class="row">
				                
				                <div class="col-md-4">
				                
				                    <select name="" class="form-control CRM-inputGroup" id="" v-model="filtro_dias" @change="reload_indicadores()">
				                        <option value="7">Últimos 7 días</option>
				                        <option value="15">Últimos 15 días</option>
				                        <option value="30">Últimos 30 días</option>
				                        <option value="90">Últimos 90 días</option>
				                        <option value="0">Año Actual</option>
				                    </select>
				                </div>
				                
				                
				                <div class="col-md-4">
					                
		                    		<select name="" class="form-control CRM-inputGroup" id="" v-model="cambio_valor" @change="cambiar_valor()">
		                 				<optgroup label="Mostrar Valores">
					                        <option value="SI">SI</option>
					                        <option value="NO">NO</option>
					                    </optgroup>
				                    </select> 
		                    	
		                    	</div>
		                    	
		                    	<div class="col-md-2" v-if="cargando_indicadores" title="Estamos Trabajaddo para usted">
				
				                    <svg version="1.1" id="L2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				                      viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve" style="width: 25px;">
				                        <circle fill="none" stroke="#489ea8" stroke-width="4" stroke-miterlimit="10" cx="50" cy="50" r="48"/>
				                        <line fill="none" stroke-linecap="round" stroke="#489ea8" stroke-width="4" stroke-miterlimit="10" x1="50" y1="50" x2="85" y2="50.5">
				                          <animateTransform 
				                               attributeName="transform" 
				                               dur="2s"
				                               type="rotate"
				                               from="0 50 50"
				                               to="360 50 50"
				                               repeatCount="indefinite" />
				                        </line>
				                        <line fill="none" stroke-linecap="round" stroke="#489ea8" stroke-width="4" stroke-miterlimit="10" x1="50" y1="50" x2="49.5" y2="74">
				                          <animateTransform 
				                               attributeName="transform" 
				                               dur="15s"
				                               type="rotate"
				                               from="0 50 50"
				                               to="360 50 50"
				                               repeatCount="indefinite" />
				                        </line>
				                    </svg>
				            
				                </div>
				              
				            </div>
				           
				        </div>
				        
				       <div class="row">
				        
				        <div class="col-md-12">
				        	
				        	
		                    
		                    <div class="row">
		                    	
		                        <div class="col-md-6">
		                           <div id="container_line" style="width:100%; height:400px;"></div>
		                        </div>
		                        
		                        <div class="col-md-6">
		                           <div id="container_line2" style="width:100%; height:400px;"></div>
		                        </div>
		                        <br>
		                    </div>
		                </div>
		              
		               </div>
				        
				        
                
                </section>
                
            </section>
        
        </section>
        
    </section>
    
    <jsp:include page="../../Vistas/footer.jsp" />
        
    <script type="text/javascript">
    
    
    function crearDataTotal(dias,total,totalEgresos,totalIngresos, totalAcumulativo)
    {


    // Grafico 1

    Highcharts.chart('container_line', {
        chart: {
            type: 'line'
        },
        title: {
            text: 'Movimientos'
        },
        exporting: {
            enabled: false,
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories:dias
        },
        yAxis: {
            title: {
                text: 'Cantidad'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: app.valores
                },
                enableMouseTracking: true
            }
        },
        series: [
            {
                name: 'Total Acumulativos',
                data: totalAcumulativo
            },
            {
                name: 'Total dia',
                data: total
            },
            {
                name: 'Egresos',
                data: totalEgresos
            },
            {
                name: 'Ingresos',
                data: totalIngresos
            },
            
    
        ]
    });


    }
    
    function crearDataValor(dias,totalValor,valorEgresos,valorIngresos, valorAcumulativo)
    {


    // Grafico 1

    Highcharts.chart('container_line2', {
        chart: {
            type: 'line'
        },
        title: {
            text: 'Valores'
        },
        exporting: {
            enabled: true,
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories:dias,
            name:'dias'
            
        },
        yAxis: {
            title: {
                text: 'Montos (CLP)'
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: app.valores
                },
                enableMouseTracking: true
            }
        },
        series: [
            {
                name: 'Restante',
                data: valorAcumulativo
            },
            {
                name: 'Total Valor dia',
                data: totalValor
            },
            {
                name: 'Valor Egresos',
                data: valorEgresos
            },
            {
                name: 'Valor Ingresos',
                data: valorIngresos
            },
            
    
        ],
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }
    });


    }
    
    
    
    
    var app = new Vue({
    	  el: '#app',
    	  data: {
    	    filtro_dias:15,
    	    distribucion:[],
    	    cargando_indicadores:false,
    	    valores:false,
    	    cambio_valor:"NO",
    	  },
    	  methods:{

    	    fechaMoment:function(fecha){
    	      return moment(fecha).fromNow();
    	    },

    	    reload_indicadores: function(){

    	      this.cargando_indicadores = true;

    	      this.get_Marketing_Indicador();

    	    },
    	    
    	    cambiar_valor: function(){

      	      if(this.cambio_valor == "SI"){this.valores=true;}
      	     if(this.cambio_valor == "NO"){this.valores=false;}

      	      this.create_Marketing_Indicador();

      	    },

    	    calcular_dia_agno:function(){

    	      var ahora = new Date();
    	      var comienzo = new Date(ahora.getFullYear(), 0, 2);
    	      var dif = ahora - comienzo;
    	      var unDia = 1000 * 60 * 60 * 24;
    	      var dia = Math.ceil(dif / unDia);

    	      return dia;

    	    },

    	    get_Marketing_Indicador:function(){

    	      var data = {};


    	      if (this.filtro_dias ==0) {

    	        data = {'dias' : this.calcular_dia_agno(),}

    	      } else {

    	        data = {'dias' : this.filtro_dias,}

    	      }

    	      

    	      fetch('Informes', {
    	          credentials: "same-origin",
    	          method: "POST",
    	          headers: {
    	              'Accept': 'application/json'
    	          },
    	          body: JSON.stringify({'url' : "get_Indicador",'data' :data})
    	      }).then(function (res) {
    	          return res.text();
    	      }).then(function (data) {
    	          let response = {};
    	          ////$('#infotic_cobralo_cargando').hide();
    	          try {
    	              response = JSON.parse(data);
    	          } catch (e) {
    	              alertFail('Error', 'Problemas al procesar la solicitud');
    	              return;
    	          }

    	          if (response.data.length > 0) {

    	            console.log('Datoso entregados');

    	            app.distribucion = response.data;
    	          }else {

    	            console.log('buuuuuuuuuuuuu entregados');


    	            app.distribucion = [];
    	          }

    	          this.create_Marketing_Indicador();

    	      }.bind(this));

    	    },

    	    create_Marketing_Indicador:function(){

    	      var dias = [];
    	      var total = [];
    	      var totalEgresos = [];
    	      var totalIngresos = [];
    	      var totalAcumulativo = [];
    	      
    	      var TotalValor = [];
    	      var valorEgresos = [];
    	      var valorIngresos = [];
    	      var TotalValorAcumulativo = [];

    	      for (var i = 0; i < app.distribucion.length; i++) {
    	           dias.push(app.distribucion[i].fecha);
    	           totalEgresos.push(parseInt(app.distribucion[i].totalEgresos));
    	           totalIngresos.push(parseInt(app.distribucion[i].totalIngresos));
    	           total.push(parseInt(app.distribucion[i].Total));
    	           totalAcumulativo.push(parseInt(app.distribucion[i].Totalacumulativo));
    	           
    	           valorEgresos.push(parseInt(app.distribucion[i].valorEgresos));
    	           valorIngresos.push(parseInt(app.distribucion[i].valorIngresos));
    	           TotalValor.push(parseInt(app.distribucion[i].TotalValor));
    	           TotalValorAcumulativo.push(parseInt(app.distribucion[i].TotalValorAcumulativo));
    	      }

    	   // crearDataMarketing(dias,total,totalEgresos,totalIngresos, totalAcumulativo)
			this.cargando_indicadores=false;
			crearDataTotal(dias,total,totalEgresos,totalIngresos,totalAcumulativo);
			crearDataValor(dias,TotalValor,valorEgresos,valorIngresos,TotalValorAcumulativo);
    	   
    	      

    	    },
    	 

    	  }
    	  
    	})
    
    app.get_Marketing_Indicador();
    
    	
    
    </script>
    
</body>
</html>