<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/vistas/include.jsp" %>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta charset="utf-8">
	    <link rel="stylesheet" href="css/bootstrap.min.css">
	    <title>Confirmacion</title>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
 	<div class="container">
    	<!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
        	<a class="navbar-brand" href="/Sangucheto/"><kbd>Sanguchetto</kbd></a>
        </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="navbar-collapse collapse in" id="bs-example-navbar-collapse-1" aria-expanded="true">
	</div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
	<body>
	<div class="col-md-12" style="background-color:#8C9EFF;">
	   	<div class="container"> 
			<h1>Confirmación del Sanguchetto</h1>
		</div>
		<div class="col-md-12" style="background-color:#8C9EFF;">
			<div class="container"> 
				<h3>¡Felicidades! Confirme sí los datos ingresados son los correctos para realizar la compra.</h3>
				<div>
				<br>
				
	<form:form>
		<c:forEach items="${sanguche.keySet()}" var="ingredientes">
			<label>${ingredientes.nombre}</label>       <label>${ingredientes.precio}</label>       <label>${sanguche.get(ingredientes)}</label><br>
		</c:forEach>
	</form:form>
	<label>Total: </label><label>${precio}</label>
	<form:form action="compra">
		<button type = "submit"> Confirmar</button>
	</form:form>
	<form:form action="agregarMas">
		<button type = "submit"> Agregar Más</button>
	</form:form>
	</div>
</div>
</div>
</body>
</html>