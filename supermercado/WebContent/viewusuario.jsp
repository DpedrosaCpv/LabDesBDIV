<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualização de Usuários</title>
</head>
<body>
	<%@ page
		import="br.com.pes.supermercado.dao.UsuarioDao, br.com.pes.supermercado.bean.Usuario, java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
	<table> 
		<tr>
			<td><a href="index.jsp">Pagina Inicial ></a></td>
			<td> Lista de Usuarios - Order by nome</td>
		</tr>
	</table>
		
	<h1>Listagem de Usuários</h1>
	
			
	<%
	List<Usuario> list = UsuarioDao.listaTodosUsuarios();
	request.setAttribute("list", list);
	%>

	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Email</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach items="${list}" var="usuario">
		<tr>
			<td>${usuario.getId()}</td>
			<td>${usuario.getNome()}</td>
			<td>${usuario.getEmail()}</td>
			<td><a href="edituser.jsp?id=${usuario.getId()}">Editar</a></td>
			<td><a href="deleteuser.jsp?id=${usuario.getId()}">Excluir</a></td>
		</tr>
		</c:forEach>
	</table>
	
	<a href="addusuarioform.jsp">Adicionar Usuario</a>

</body>
</html>