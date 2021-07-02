<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edição do Lista deCompra</title>
</head>
<body>
	<%@page import="br.com.pes.supermercado.dao.ListaCompraDao, br.com.pes.supermercado.bean.ListaCompra" %>
	
	<%
		String id = request.getParameter("id");
		ListaCompra listacompra = ListaCompraDao.getRegistroById(Integer.parseInt(id));
	%>
	
<table> 
	<tr>
		<td><a href="index.jsp">Pagina Inicial ></a></td>
		<td> Lista de Compra</td>
	</tr>
</table>
	
	<h1> Edição da Lista de Compra</h1>
	
	<form action="editalstbay.jsp" method="post">
	
		<input type="hidden" name="id" value="<%=listacompra.getId()%>"/>
		<table>
			<tr>
				<td> Nome: </td>
				<td><input type="text" name="nome" value="<%=listacompra.getNome()%>"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Editar Lista Compra"></input></td>
			</tr>
		</table>
	</form>
</body>
</html>