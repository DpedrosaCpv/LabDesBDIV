<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualização de Produtos</title>
</head>
<body>
	<%@ page
		import="br.com.pes.supermercado.dao.ProdutoDao, br.com.pes.supermercado.bean.Produto, java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<table> 
		<tr>
			<td><a href="index.jsp">Pagina Inicial ></a></td>
			<td> Lista de Produtos - Order by Descrição </td>
		</tr>
	</table>
		
	<h1>Listagem de Produtos</h1>

	<%
	List<Produto> list = ProdutoDao.listaTodosProdutos();
	request.setAttribute("list", list);
	%>
	

	<table border="1">
		<tr>
			<th>ID</th>
			<th>Descrição</th>
			<th>Unidade</th>
			<th>Preço</th>
			<th>Fabricante</th>
			<th>Supermercado</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach items="${list}" var="produto">
		<tr>
			<td>${produto.getId()}</td>
			<td>${produto.getDescricao()}</td>
			<td>${produto.getUnidade()}</td>
			<td>${produto.getPreco()}</td>
			<td>${produto.getFabricante()}</td>
			<td>${produto.getSupermercado()}</td>
			<td><a href="editproduto.jsp?id=${produto.getId()}">Editar</a></td>
			<td><a href="deleteproduto.jsp?id=${produto.getId()}">Excluir</a></td>
		</tr>
		</c:forEach>
	</table>
	
	<a href="addprodutoform.jsp">Adicionar Produto</a>

</body>
</html>