<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/vistas/include.jsp"%>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Confirmacion</title>

	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="http://localhost:8080/Sangucheto/">Armar el Sanguchetto</a></li>
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
				<h1>Confirmación del Sanguchetto</h1>
			</div>
			<div class="col-md-12" style="background-color: #E3F2FD;">
				<div class="container" align="center">

					<h3>¡Felicidades! Confirme sí los datos ingresados son los
						correctos para realizar la compra.</h3>
					<div>
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
											<th class="col-md-4">Precio Unitario</th>
											<th class="col-md-1">Cantidad</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sanguche.keySet()}"
											var="ingrediente">
											<c:if test="${ingrediente.tipo eq 'INGREDIENTE'}">
												<tr>
													<td class="col-md-3">${ingrediente.nombre}</td>
													<td class="col-md-2">${ingrediente.precio}</td>
													<td class="col-md-1">${sanguche.get(ingrediente)}</td>
													<td class="col-md-1">
														
													</td>
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
											<th class="col-md-4">Precio Unitario</th>
											<th class="col-md-1">Cantidad</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sanguche.keySet()}"
											var="ingrediente">
											<c:if test="${ingrediente.tipo eq 'CONDIMENTO'}">
												<tr>
													<td class="col-md-3">${ingrediente.nombre}</td>
													<td class="col-md-2">${ingrediente.precio}</td>
													<td class="col-md-1">${sanguche.get(ingrediente)}</td>
													<td class="col-md-1">
														
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
						<span class="label label-default"> <label>Precio sin
								descuento:$ ${precioSangucheSinDescuento}</label></span>
						<br>
						<span class="label label-default"> <label>Descuento:
								${porcentajeDeDescuento}%</label></span>
						<br>
					</c:if>
						<span class="label label-default"> <label>Precio Final:
						${precio}</label></span> <br> <br>
					</div>
				</div>
			</div>
			
			<div class="container" align="center">
				
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-3"></div> -->
<!-- 					<div class="col-xs-2 col-md-2"> -->
				<table>
					<tbody>
						<tr>
							<td align="right">
								<form:form action="compra">
									<button type="submit" class="btn btn-primary">Confirmar</button>
								</form:form>
							</td>
							<td class="col-md-4"></td>	
		<!-- 					</div>	 -->
							<td align="left">
								<form:form action="agregarMas">
									<button type="submit" class="btn btn-primary">Modificar</button>
								</form:form>
							</td>	
						</tr>	
					</tbody>
				</table>		
<!-- 				</div> -->	
			</div>
		</div>				
	</body>
</html>