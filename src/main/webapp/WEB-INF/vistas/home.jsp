<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/vistas/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>Home</title>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header"></div>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" href="http://localhost:8080/Sangucheto/">Armar el Sanguchetto</a></li>
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle"
					href="http://localhost:8080/Sangucheto/stock">Stock</a></li>
			</ul>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar-collapse collapse in"
				id="bs-example-navbar-collapse-1" aria-expanded="true"></div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<br>
	<br>
	<div class="col-md-12" style="background-color: #8C9EFF;">
		<div class="container">
			<h1>Armado de Sanguchetto</h1>
		</div>
		<div class="col-md-12" style="background-color: #E3F2FD;">
			<div class="container">
				<h3>¡Bienvenido! Ingrese aquí los ingredientes y condimientos
					de su Sanguchetto.</h3>

				<table>
					<tr>

						<td class="col-md-5">
							<div class="panel panel-danger">

								<div class="panel-heading">Ingredientes Disponibles</div>
								<table class="table">
									
										<thead>
											<tr>
												<th class="col-md-2">Nombre</th>
												<th class="col-md-4">Precio Unitario</th>
												<th class="col-md-1"></th>

											</tr>
										</thead>
									
									
										<tbody>
											<c:forEach items="${IngredientesEnStock.keySet()}"
												var="ingredientesStock">
												<c:if
													test="${IngredientesEnStock.get(ingredientesStock) gt 0}">
													<c:if test="${ingredientesStock.tipo eq 'INGREDIENTE'}">
														<form:form action="agregar" width="30" height="20"
															modelAttribute="ingrediente" role="form">
															<tr>
																<td class="col-md-3">${ingredientesStock.nombre}</td>
																<td class="col-md-2">${ingredientesStock.precio}</td>
																<td class="col-md-1"></td>
																<td class="col-md-1"><form:input class="button"
																		id="nombre" path="nombre" type="hidden"
																		value="${ingredientesStock.nombre}" /> <form:input
																		id="apellido" path="precio" type="hidden"
																		value="${ingredientesStock.precio}" /> <form:input
																		id="tipo" path="tipo" type="hidden"
																		value="${ingredientesStock.tipo}" />
																	<button type="Submit" class="btn btn-success btn-xs">
																		<span class="glyphicon glyphicon-plus"></span>
																	</button></td>
															</tr>
														</form:form>
													</c:if>
												</c:if>
											</c:forEach>
										</tbody>
									
								</table>

							</div>
						</td>

					
							<td class="col-md-5">
								<div class="panel panel-danger">
									<div class="panel-heading">Condimentos Disponibles</div>
									<table class="table">
										
										<thead>
											<tr>
												<th class="col-md-2">Nombre</th>
												<th class="col-md-4">Precio Unitario</th>
												<th class="col-md-1"></th>

											</tr>
										</thead>
										
										
										<tbody>
											<c:forEach items="${IngredientesEnStock.keySet()}"
												var="ingredientesStock">
												<c:if
													test="${IngredientesEnStock.get(ingredientesStock) gt 0}">
													<c:if test="${ingredientesStock.tipo eq 'CONDIMENTO'}">
														<form:form action="agregar" width="30" height="20"
															modelAttribute="ingrediente" role="form">
															<tr>

																<td class="col-md-3">${ingredientesStock.nombre}</td>

																<td class="col-md-2">${ingredientesStock.precio}</td>
																<td class="col-md-1"></td>
																<td class="col-md-1"><form:input class="button"
																		id="nombre" path="nombre" type="hidden"
																		value="${ingredientesStock.nombre}" /> <form:input
																		id="apellido" path="precio" type="hidden"
																		value="${ingredientesStock.precio}" /> <form:input
																		id="tipo" path="tipo" type="hidden"
																		value="${ingredientesStock.tipo}" />
																	<button type="Submit" class="btn btn-success btn-xs">
																		<span class="glyphicon glyphicon-plus"></span>
																	</button></td>

															</tr>
														</form:form>
													</c:if>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</td>
						
					</tr>
				</table>

				<br>
				<c:if test="${cantidadDeIngredientes ne 0}">
					<table>
						<tr>
							<td class="col-md-5">
								<div class="panel panel-primary">
									<div class="panel-heading">Ingredientes en su Sanguchetto</div>
									<table class="table">
										<thead>
											<tr>
												<th class="col-md-2">Nombre</th>
												<th class="col-md-3">Precio Unitario</th>
												<th class="col-md-1">Cantidad</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${IngredientesSangucheto.keySet()}"
												var="ingrediente">
												<c:if test="${ingrediente.tipo eq 'INGREDIENTE'}">
													<tr>
														<td class="col-md-3">${ingrediente.nombre}</td>
														<td class="col-md-2">${ingrediente.precio}</td>
														<td class="col-md-1">${IngredientesSangucheto.get(ingrediente)}</td>
														<td class="col-md-1"><form:form
																action="sacarDeSanguchetto"
																modelAttribute="ingredienteASacar">
																<form:input id="nombre" path="nombre" type="hidden"
																	value="${ingrediente.nombre}" />
																<form:input id="apellido" path="precio" type="hidden"
																	value="${ingrediente.precio}" />
																<form:input id="tipo" path="tipo" type="hidden"
																	value="${ingrediente.tipo}" />
																<button type="Submit" class="btn btn-danger btn-xs">
																	<span class="glyphicon glyphicon-minus"></span>
																</button>
															</form:form></td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</td>
							</c:if>
							<c:if test="${cantidadDeCondimentos ne 0}">
								<td class="col-md-5">
									<div class="panel panel-primary">
										<div class="panel-heading">Condimentos en su Sanguchetto</div>
										<table class="table">
											<thead>
												<tr>
													<th class="col-md-2">Nombre</th>
													<th class="col-md-3">Precio Unitario</th>
													<th class="col-md-1">Cantidad</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${IngredientesSangucheto.keySet()}"
													var="ingrediente">
													<c:if test="${ingrediente.tipo eq 'CONDIMENTO'}">
														<tr>
															<td class="col-md-3">${ingrediente.nombre}</td>
															<td class="col-md-2">${ingrediente.precio}</td>
															<td class="col-md-1">${IngredientesSangucheto.get(ingrediente)}</td>
															<td class="col-md-1">
																<button type="Submit" class="btn btn-danger btn-xs">
																	<span class="glyphicon glyphicon-minus"></span>
																</button>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</td>
							</c:if>
						</tr>
					</table>

					<c:if test="${descuento eq true}">
						<span class="label label-default"> <label>Precio
								sin descuento:$ ${precioSangucheSinDescuento}</label></span>
						<br>
						<span class="label label-default"> <label>Descuento:
								${porcentajeDeDescuento}%</label></span>
						<br>
					</c:if>
					<span class="label label-default"> <label>Precio
							Final:$ ${precioSangucheFinal}</label></span>
					<br>
					<br>
			</div>


		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-md-2">
					<form:form action="confirmarSanguche">
						<button type="Submit" class="btn btn-primary">Confirmar</button>
					</form:form>
				</div>
				<div>
					<form:form action="cancelarSanguche">
						<button type="Submit" class="btn btn-danger">Cancelar</button>
					</form:form>
				</div>
			</div>
		</div>

	</div>
	
</body>
</html>