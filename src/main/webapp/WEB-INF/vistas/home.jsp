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
	
			<h1>Sanguchetto</h1>
			
			<div>
			
				<c:forEach items="${IngredientesEnStock}" var="ingredientesStock">
					 ${ingredientesStock} 
					 <form:form action="agregar" modelAttribute="ingrediente" role="form">
						 <form:input id ="nombre" path="nombre" type="hidden" value="${ingredientesStock.nombre}" />
						 <form:input id="apellido" path="precio" type="hidden" value="${ingredientesStock.precio}" />
						 <form:input id="tipo" path="tipo" type="hidden" value="${ingredientesStock.tipo}" />
						 <button type="Submit" class="btn btn-default">Agregar</button>
					</form:form>
				</c:forEach>	
			</div>
			<br>
			<div>
				<c:forEach items="${IngredientesSangucheto.keySet()}" var="ingrediente">
					<label>${ingrediente}</label> Cantidad: ${IngredientesSangucheto.get(ingrediente)}<br>
				</c:forEach>
			</div>
			<label>Precio: ${precioSanguche}</label>
			<br>
			<br>
			<div>
				<form:form action="confirmarSanguche">	
						 <button type="Submit" class="btn btn-primary">Agregar</button>
				</form:form>
			</div>
			<div>
				<form:form action="cancelarSanguche">	
						 <button type="Submit" class="btn btn-danger">Cancelar</button>
				</form:form>
			</div>
	</body>
</html>