<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/vistas/include.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta charset="utf-8">
	    <link rel="stylesheet" href="css/bootstrap.min.css">
	    
		<title>Home</title>
	</head>
	
	<body>
    			<div class="col-md-12" style="background-color:#8C9EFF;">
    			<div class="container">
					<h1>Sanguchetto</h1>
				</div>
				</div>
			<div class="col-md-12" style="background-color:#E3F2FD;">
				<div class="container"> 
				<div>
				<br>




<span style="display:inline-block">


					<c:forEach items="${IngredientesEnStock.keySet()}" var="ingredientesStock">
					<c:if test="${IngredientesEnStock.get(ingredientesStock) gt 0}">
					<form:form action="agregar"  width="30" height="20" modelAttribute="ingrediente" role="form">
						<label>
							${ingredientesStock.nombre} 
				     		${ingredientesStock.precio}
				    	</label>
						<form:input class="button" id ="nombre" path="nombre" type="hidden" value="${ingredientesStock.nombre}" />
						<form:input id="apellido" path="precio" type="hidden" value="${ingredientesStock.precio}" />
						<form:input id="tipo" path="tipo" type="hidden" value="${ingredientesStock.tipo}" /> 
						<button type="Submit" class="btn btn-success btn-xs">
							<span class="glyphicon glyphicon-plus"></span>
						</button>	
</span>						
					</form:form>
					</c:if> 
					</c:forEach>
				</div>


			<br>


			<div>
				<c:forEach items="${IngredientesSangucheto.keySet()}" var="ingrediente">
					<label>${ingrediente.nombre}</label> ${ingrediente.precio} Cantidad: ${IngredientesSangucheto.get(ingrediente)}<br>

				</c:forEach>
			</div>
			<span class="label label-default">
			<label>Precio: ${precioSanguche}</label></span>
			<br>
			<br>
			<div>
			<div class="row">
  					<div class="col-xs-2 col-md-2">
				<form:form action="confirmarSanguche">	
						 <button type="Submit" class="btn btn-primary">Agregar</button>
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
			
</div>
</div>

	</div>
	</body>
</html>