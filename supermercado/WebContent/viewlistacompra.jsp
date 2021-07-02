<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualização de Lista de Compra</title>
</head>
<body>
	<%@ page
		import="br.com.pes.supermercado.dao.ListaCompraDao, br.com.pes.supermercado.bean.ListaCompra, java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
	<table> 
		<tr>
			<td><a href="index.jsp">Pagina Inicial ></a></td>
			<td> Lista de Compra - Order by nome </td>
		</tr>
	</table>
		
	<h1>Exibe Lista de Compras</h1>

	<%
	List<ListaCompra> list = ListaCompraDao.exibeTodasListas();
	request.setAttribute("list", list);
	%>


	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach items="${list}" var="listacompra">
		<tr>
			<td>${listacompra.getId()}</td>
			<td>${listacompra.getNome()}</td>
			<td><a href="editlstbay.jsp?id=${listacompra.getId()}">Editar</a></td>
			<td><a href="deletelstbay.jsp?id=${listacompra.getId()}">Excluir</a></td>
		</tr>
		</c:forEach>
	</table>
	
	<a href="addlstbayform.jsp">Adicionar Lista Compra</a>
	
</body>
</html>