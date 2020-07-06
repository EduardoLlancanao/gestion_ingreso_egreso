<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro APR</title>
<jsp:include page="/WEB-INF/Vistas/head.jsp" />
</head>
<body>

	<section id="content" class="m-t-lg wrapper-md animated fadeInUp col-md-12">    
    <div class="container aside-xxl">
      <a class="navbar-brand block" href="index.jsp">APR Gestion [Ingreso - Egreso]</a>
      <section class="panel panel-default bg-white m-t-lg">
        <header class="panel-heading text-center">
          <strong>Regitro Nuevo Usuario</strong>
        </header>
        <form id="myForm" name="myForm" class="col-md-12">
        
        <div class="row">
        <br>
        <br>
			<div class="form-group mb-3 col-md-6">
				<label>Nombre</label>
				<div class="input-group">
					<input id="nombre" name="nombre" type="text" class="form-control form-control-lg" required/>
					
				</div>
			</div>
			
			<div class="form-group mb-3 col-md-6">
				<label>Apellido</label>
				<div class="input-group">
					<input id="apellido" name="apellido" type="text" class="form-control form-control-lg" required/>
					
				</div>
			</div>
			
			<div class="form-group mb-3 col-lg-12">
				<label>Correo</label> <span id="emailok"></span>
				<div class="input-group col-lg-12">
					<input id="correo" name="correo" type="email" class="form-control form-control-lg" required/>
					
				</div>
			</div>

			<div class="form-group mb-3 col-lg-6">
				<div class="clearfix">
					<label class="float-left">Password</label> <span id="pwdok"></span>
				</div>
				<div class="input-group">
					<input name="pwd" id="pwd" type="password" class="form-control form-control-lg" required/>
					
				</div>
			</div>
			
			<div class="form-group mb-3 col-lg-6">
				<div class="clearfix">
					<label class="float-left">Confirmar Password</label> <span id="pwdok2"></span>
				</div>
				<div class="input-group">
					<input name="pwd2" id="pwd2" type="password" class="form-control form-control-lg" required/>
					
				</div>
			</div>
			
			</div>

			<div class="row text-right">
			<br>
			<br>
				<div class="col-md-6">
						<a href="./" class="col-md-6 btn btn-default btn-block">Volver al Login</a>
				</div>
				
				<div class="col-md-6">
						<button type="button" onClick="registrar()" class="col-md-12 btn btn-md btn-primary ">Registarme</button>
				</div>
				
			</div>

		</form>
        
      </section>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
    <div class="text-center padder">
      <p>
        <small>Sistema web - Arquitectura del Software <br>&copy; 2020</small>
      </p>
    </div>
  </footer>
  
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript">
    
    document.getElementById('correo').addEventListener('input', function() {
        campo = event.target;
        valido = document.getElementById('emailok');
            
        emailRegex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        //Se muestra un texto a modo de ejemplo, luego va a ser un icono
        if (emailRegex.test(campo.value)) {
          valido.innerHTML = '<i class="fas fa-check-circle" style="color: #66bd78;"></i>';
        }else{
        	valido.innerHTML = '';
        }
    });
    
    document.getElementById('pwd').addEventListener('input', function() {
        campo = event.target;
        valido = document.getElementById('pwdok');
        valido2 = document.getElementById('pwdok2');
        
        var pwd = document.getElementById('pwd').value;
        var pwd2 = document.getElementById('pwd2').value;
            
        if (pwd.length > 0) {
          valido.innerHTML = '<i class="fas fa-check-circle" style="color: #66bd78;"></i>';
          
          if(pwd == pwd2){
        	  valido2.innerHTML = '<i class="fas fa-check-circle" style="color: #66bd78;"></i>';
          }else{
        	  valido2.innerHTML = '<i class="fas fa-check-circle" style="color: red;"></i>';
          }
          
        }else{
        	valido.innerHTML = '<i class="fas fa-check-circle" style="color: red;"></i>';
        }
    });
    
    document.getElementById('pwd2').addEventListener('input', function() {
        campo = event.target;
        valido = document.getElementById('pwdok');
        valido2 = document.getElementById('pwdok2');
        
        var pwd = document.getElementById('pwd').value;
        var pwd2 = document.getElementById('pwd2').value;
            
        if (pwd.length > 0) {
          valido.innerHTML = '<i class="fas fa-check-circle" style="color: #66bd78;"></i>';
          
          if(pwd == pwd2){
        	  valido2.innerHTML = '<i class="fas fa-check-circle" style="color: #66bd78;"></i>';
          }else{
        	  valido2.innerHTML = '<i class="fas fa-check-circle" style="color: red;"></i>';
          }
          
        }else{
        	valido.innerHTML = '<i class="fas fa-check-circle" style="color: red;"></i>';
        }
    });

        function registrar() {
        	
        	<!-- Validacion Nombre -->
        	var nombre = document.getElementById('nombre').value;
        	
        	if (nombre == '') {

                Swal.fire({
                    icon: 'info',
                    title: 'Oops...',
                    text: 'Debe ingresar su Nombre',
                    footer: ''
                });
                return;
            }
        	
        	<!-- Validacion apellido -->      	
            var apellido = document.getElementById('apellido').value;
            
            if (apellido == '') {

                Swal.fire({
                    icon: 'info',
                    title: 'Oops...',
                    text: 'Debe ingresar su Apellido',
                    footer: ''
                });
                return;
            }
            
            <!-- Validacion email -->      	
            var correo = document.getElementById('correo').value;
            
            if (correo == '') {

                Swal.fire({
                    icon: 'info',
                    title: 'Oops...',
                    text: 'Debe ingresar su Correo',
                    footer: ''
                });
                return;
            }
                    	
        	<!-- Validacion Pass 1 -->      	
        	var pwd = document.getElementById('pwd').value;
            
            if (pwd == '') {

                Swal.fire({
                    icon: 'info',
                    title: 'Oops...',
                    text: 'Debe ingresar una clave valida',
                    footer: ''
                });
                return;
            }
            
            <!-- Validacion Pass 2 -->      	
            var pwd2 = document.getElementById('pwd2').value;
            
            if (pwd2 == '') {

                Swal.fire({
                    icon: 'info',
                    title: 'Oops...',
                    text: 'Debe ingresar una clave valida',
                    footer: ''
                });
                return;
            }
        	
            <!-- Validacion Pass 1 y 2 -->   
            if (pwd != pwd2) {

                Swal.fire({
                    icon: 'info',
                    title: 'Oops...',
                    text: 'Las claves ingresadas no coínciden, ingreselas nuevamente',
                    footer: ''
                });
                return;
            }
            

            var url = 'Registro';
            var data = {
            		'nombre' : nombre,
            		'apellido' : apellido,
            		'correo': correo, 
            		'pwd': pwd };


            fetch(url, {
            	method: 'POST', // or 'PUT'
                body: JSON.stringify(data), // data can be `string` or {object}!
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(res => res.json())
                .catch(error => console.error('Error:', error))
                .then(function (response) {
					
                	
                    if (response.estado == "success") {
                        window.location.href = "Home";
                    } else {
                        Swal.fire({
                            icon: response.estado,
                            title: 'Oops...',
                            text: response.mensaje,
                            footer: ''
                        });
                    }
                    
                }.bind(this));
            
        }




    </script>
  
 
</body>
</html>