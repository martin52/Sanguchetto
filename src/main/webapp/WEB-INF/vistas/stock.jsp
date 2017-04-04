<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/vistas/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head style=background-color:#E3F2FD;">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta charset="utf-8">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<title>Stock</title>
	
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="/Sangucheto/"><kbd>Sanguchetto</kbd></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="navbar-collapse collapse in"
			id="bs-example-navbar-collapse-1" aria-expanded="true"></div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
	<body>
		<div style="background-color: #E3F2FD;"">
			<div class="col-md-12" style="background-color: #8C9EFF;">
				<div class="container">
					<h1>Sanguchetto - Stock disponible</h1>
				</div>
				<div></div>
				<div class="col-md-12" style="background-color: #8C9EFF;">
					<div class="container">
						<div>
							<br>
							<div>
								<label>Stock Actual</label><br>
								<c:forEach items="${stockActual}" var="ingrediente">
									Ingrediente: ${ingrediente.key.nombre}  
						     		Precio: ${ingrediente.key.precio}  
									Cantidad: ${ingrediente.value}
									<br>
								</c:forEach>
							</div>
							<div>

			<form:form action="agregarIngredienteAStock" modelAttribute="ingredienteAgregado">
						<form:input path="nombre" id="nombre" type="text" placeholder="Ingrese nombre del ingrediente"/>
						<form:input path="precio" id="precio" type="text" placeholder="Precio"/>
						<select class="selectpicker" path="tipo">
						<label>
							<option value="INGREDIENTE">INGREDIENTE</option>
							<option value="INGREDIENTE">CONDIMENTO</option>
						</label>
						</select>
						<button type="Submit" class="btn btn-success">Agregar Ingrediente</button>
								
			</form:form>

			<form:form action="agregarStock" modelAttribute="ingredienteYCantidad">
					<form:select path="ingrediente"> 
 							<form:option value="NONE" label="--seleccione un ingrediente" /> 
                  			<form:options items="${stockActual.keySet()}" itemLabel="nombre" itemValue="nombre" />
 					</form:select>
 					 
 					<label for="usr">
 						<form:input id="cantidad" type="number" path="cantidad" placeholder="Ingresar cantidad"></form:input>
 					</label>
					<button type="Submit" class="btn btn-success">Agregar Stock</button>

 			</form:form>
							</div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="col-md-4">Nombre</th>
										<th class="col-md-4">Precio</th>
										<th class="col-md-4">Cantidad</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${stockActual}" var="ingrediente">
										<tr>
											<td class="col-md-4">${ingrediente.key.nombre}</td>
											<td class="col-md-4">${ingrediente.key.precio}</td>
											<td class="col-md-4">${ingrediente.value}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
<br>
<br>
					</div>
				</div>
			</div>
		<div>

			</div>
		</div>
	</div>
</body>
</html>