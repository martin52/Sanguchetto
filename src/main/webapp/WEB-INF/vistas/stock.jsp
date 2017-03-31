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
		<c:forEach items= "${stockActual}" var="ingrediente">
				Ingrediente: ${ingrediente.key.nombre}  
			     Precio: ${ingrediente.key.precio}  
				Cantidad: ${ingrediente.value}
		</c:forEach>
	</div>
	<div>

<%-- 		<form:form action="agregarStock" modelAttribute="ingrediente">
			<form:select id="nombre" path="nombre">
				<form:option value="-" label="--Seleccione un ingrediente"/>
                <form:options items="${stockActual}"/>
			</form:select>
			<form:input id="cantidad" type="text" path="precio" placeholder="ingresarCantidad"></form:input>	
			<button type="Submit">Agregar Stock</button>	
			
		</form:form>					 --%>			

		<form:form action="agregarIngredienteAStock">
			<button type="Submit">Agregar Ingrediente</button>
		</form:form>
	</div>
</body>
</html>