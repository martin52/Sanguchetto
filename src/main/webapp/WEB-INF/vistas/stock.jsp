<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/vistas/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		
		<label>Stock Actual</label><br>
		<c:forEach items= "${stockActual.keySet()}" var="ingrediente">
				Ingrediente: ${ingrediente.nombre}  Precio: ${ingrediente.precio}  Cantidad: ${stockActual.get(ingrediente)}<br>
		</c:forEach>
	</div>
	<div>
		<form:form action="agregarStock" modelAttribute="ingredienteVacio">
<%-- 			<form:select path="ingredienteVacio"> --%>
<%-- 				<form:option value="-" label="--Seleccione un ingrediente"/> --%>
<%--                 <form:options items="${stockActual.keySet()}"/> --%>
<%-- 			</form:select> --%>
			<button type="Submit">Agregar Stock</button>
		</form:form>
		<form:form action="agregarIngredienteAStock">
			<button type="Submit">Agregar Ingrediente</button>
		</form:form>
	</div>
</body>
</html>