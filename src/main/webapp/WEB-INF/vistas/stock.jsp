<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/vistas/include.jsp"%>

<html lang="en">
<head style=background-color:#E3F2FD;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Stock</title>
<script type="text/javascript">
function validar(e) { // 1
tecla = (document.all) ? e.keyCode : e.which; // 2
if (tecla==8) return true; // 3
patron =/[A-Za-z\s]/; // 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
</script>
<script type="text/javascript">
function numeros(nu) { // 1
tecla = (document.all) ? e.keyCode : e.which; // 2
if (tecla==8) return true; // 3
ppatron = /\d/; // Solo acepta n�meros// 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
</script>
<!-- /.container -->
<body>
	<div style="background-color: #E3F2FD;">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
			<ul class="nav navbar-nav">
			    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="http://localhost:8080/Sangucheto/">Armar el Sanguchetto</a></li>
                <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="http://localhost:8080/Sangucheto/stock">Stock</a></li>
            </ul>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="navbar-collapse collapse in"
					id="bs-example-navbar-collapse-1" aria-expanded="true"></div>
				<!-- /.navbar-collapse -->
			</div>
		</nav>
		<br> <br>
		<div class="col-md-12" style="background-color: #8C9EFF;">
			<div class="container">
				<h1>Sanguchetto - Stock disponible</h1>
			</div>
			<div class="col-md-12" style="background-color: #E3F2FD;">
				<div class="container">
					<br>
					<div class="row">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>
									<label>Stock Actual</label><br>
								</h4>
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
											<td class="col-md-4">$ ${ingrediente.key.precio}</td>
											<td class="col-md-2">${ingrediente.value}</td>
											<td class="col-md-2">
												<form:form action="borrarIngredienteDeStock" modelAttribute="ingredienteABorrar">
													<form:input id="nombre" path="nombre"
														type="hidden" value="${ingrediente.key.nombre}" />
													<form:input id="apellido" path="precio" type="hidden"
														value="${ingrediente.key.precio}" />
													<form:input id="tipo" path="tipo" type="hidden"
														value="${ingrediente.key.tipo}" />
													<button type="Submit" class="btn btn-danger btn-xs">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</form:form>	
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		<div>
				<label>Agregar Ingrediente</label>
				<form:form action="agregarIngredienteAStock"
					modelAttribute="ingredienteAgregado">

					<form:input path="nombre" id="nombre" type="text"
						placeholder="Nombre del ingrediente" onkeypress="return validar(event)"/>
					<form:input path="precio" id="precio" type="number" min="0.01" step="0.01"
						placeholder="Precio" />
<%-- 					<form:errors path="precio" cssClass="rojo"/> --%>
					<form:select path="tipo">
						<form:option value="INGREDIENTE" label="Ingrediente" />
						<form:option value="CONDIMENTO" label="Condimento" />
					</form:select>
					<button type="Submit" class="btn btn-primary">Agregar Ingrediente</button>
				</form:form>
				<label>Agregar Stock a ingrediente</label>
				<form:form action="agregarStock"
					modelAttribute="ingredienteYCantidad">
					<form:select path="ingrediente">
						<form:option value="NONE" label="--seleccione un ingrediente" />
						<form:options items="${stockActual.keySet()}" itemLabel="nombre"
							itemValue="nombre" />
					</form:select>
					<form:input id="cantidad" type="number" path="cantidad"
						placeholder="ingresar cantidad"></form:input>
					<button type="submit" class="btn btn-primary">agregar stock</button>
				</form:form>
			</div>
		</div>
	</div>
				
</body>
</html>