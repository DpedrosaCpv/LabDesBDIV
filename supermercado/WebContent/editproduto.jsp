<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edição do Produto</title>
</head>
<body>
	<%@page import="br.com.pes.supermercado.dao.ProdutoDao, br.com.pes.supermercado.bean.Produto" %>
	
	<%
		String id = request.getParameter("id");
		Produto produto = ProdutoDao.getRegistroById(Integer.parseInt(id));
	%>
<table> 
	<tr>
		<td><a href="index.jsp">Pagina Inicial ></a></td>
		<td> Edição de Produto</td>
	</tr>
</table>
	
	<h1> Edição do Produto</h1>
	
	<form action="editaproduto.jsp" method="post">
	
		<input type="hidden" name="id" value="<%=produto.getId()%>"/>
		<table>
			<tr>
				<td> Descrição: </td>
				<td><input type="text" name="descricao" value="<%=produto.getDescricao()%>"/></td>
			</tr>
			<tr>
				<td> Unidade: </td>
				<td><input type="text" name="unidade" value="<%=produto.getUnidade()%>"/></td>
			</tr>
			<tr>
				<td> Preço: </td>
				<td><input type="text" name="preco" value="<%=produto.getPreco()%>"/></td>
			</tr>
			<tr>
				<td> Fabricante: </td>
				<td><input type="text" name="fabricante" value="<%=produto.getFabricante()%>"/></td>
			</tr>
			<tr>
				<td> Supermercado: </td>
				<td><input type="text" name="supermercado" value="<%=produto.getSupermercado()%>"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Editar Produto"></input></td>
			</tr>
		</table>
	</form>
</body>
</html>