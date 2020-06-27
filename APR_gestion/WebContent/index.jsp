<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="Vistas/header.jsp" />
</head>
<body>

	<section id="content" class="m-t-lg wrapper-md animated fadeInUp col-md-12">    
    <div class="container aside-xxl">
      <a class="navbar-brand block" href="index.jsp">APR Gestion [Ingreso - Egreso]</a>
      <section class="panel panel-default bg-white m-t-lg">
        <header class="panel-heading text-center">
          <strong>Ingreso a la plataforma</strong>
        </header>
        <form action="Vistas/Home/home.jsp" class="panel-body wrapper-lg col-md-12">
          <div class="form-group">
              <label class="control-label">Correo</label>
              <input type="email" id="email" placeholder="test@example.com" class="form-control input-lg">
          </div>
          <div class="form-group">
              <label class="control-label">Password</label>
              <input type="password" id="inputPassword" placeholder="Password" class="form-control input-lg">
          </div>
          <div class="checkbox">
              <label>
                  <input type="checkbox"> Recuerdame
              </label>
          </div>
          <br>
          <a href="#" class="pull-right m-t-xs"><small>¿Olvidaste tu contraseña?</small></a>
          <button type="button" class="btn btn-success btn-block" onclick="login()">Ingresar</button>
			<br><br><br>
          <p class="text-muted text-center"><small>¿No sabes como gestionar tu APR?</small></p>
          <a href="signup.html" class="btn btn-default btn-block">Crea una cuenta</a>
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

        function login() {

            var correo = document.getElementById('email').value;
            var inputPassword = document.getElementById('inputPassword').value;

            if (correo == "" || inputPassword == "") {

                Swal.fire({
                    icon: 'info',
                    title: 'Oops...',
                    text: 'Debes ingresar todos los datos',
                    footer: ''
                });
                return;
            }

            var url = 'Login';
            var data = { 'correo': correo, 'pass': inputPassword };

            fetch(url, {
                method: 'POST', // or 'PUT'
                body: JSON.stringify(data), // data can be `string` or {object}!
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(res => res.json())
                .catch(error => console.error('Error:', error))
                .then(function (response) {

                    if (response.acceso == true) {
                        window.location.href = "../Home";
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Datos incorrectos',
                            footer: '<a href>Registrarse</a> <p></p> <a href>Olvide mi contraseña</a>'
                        });
                    }
                }.bind(this));
        }




    </script>
  
 
</body>
</html>