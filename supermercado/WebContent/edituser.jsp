<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edi��o do Usu�rio</title>
</head>
<body>
	<%@page import="br.com.pes.supermercado.dao.UsuarioDao, br.com.pes.supermercado.bean.Usuario" %>
	
	<%
		String id = request.getParameter("id");
		Usuario usuario = UsuarioDao.getRegistroById(Integer.parseInt(id));
	%>

<table> 
	<tr>
		<td><a href="index.jsp">Pagina Inicial ></a></td>
		<td> Edi��o de Usu�rio</td>
	</tr>
</table>
	
	<h1> Edi��o do Usu�rio</h1>
	
	<form action="editausuario.jsp" method="post">
	
		<input type="hidden" name="id" value="<%=usuario.getId()%>"/>
		<table>
			<tr>
				<td> Nome: </td>
				<td><input type="text" name="nome" value="<%=usuario.getNome()%>"/></td>
			</tr>
			<tr>
				<td> Email: </td>
				<td><input type="email" name="email" value="<%=usuario.getEmail()%>"/></td>
			</tr>
			<tr>
				<td> Senha: </td>
				<td><input type="password" name="senha" value="<%=usuario.getSenha()%>"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Editar Usu�rio"></input></td>
			</tr>
		</table>
	</form>
</body>
</html>