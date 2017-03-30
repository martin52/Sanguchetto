<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/vistas/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
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
						 <button type="submit">Agregar</button><br>
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
					<button type="submit" value="submit">Confirmar</button>
				</form:form>
			</div>
			<div>
				<form:form action="cancelarSanguche">	
					<button type="submit">Cancelar</button>
				</form:form>
			</div>
	</body>
</html>