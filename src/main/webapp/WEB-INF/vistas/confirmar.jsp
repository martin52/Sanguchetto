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
		<button type = "submit"> Agregar M�s</button>
	</form:form>
</body>
</html>