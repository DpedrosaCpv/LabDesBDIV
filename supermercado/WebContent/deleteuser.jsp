<%@page import="br.com.pes.supermercado.dao.UsuarioDao"%>
<%@ page import="br.com.pes.supermercado.dao.UsuarioDao"%>
<jsp:useBean id="u" class="br.com.pes.supermercado.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	UsuarioDao.deletarUsuario(u);
	response.sendRedirect("viewusuario.jsp");
%>