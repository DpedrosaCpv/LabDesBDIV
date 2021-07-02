<%@ page import="br.com.pes.supermercado.dao.UsuarioDao"%>
<jsp:useBean id="u" class="br.com.pes.supermercado.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	int i = UsuarioDao.salvarUsuario(u);
	
	if(i > 0){
		response.sendRedirect("addusuario-sucess.jsp");
	}else{
		response.sendRedirect("addusuario-error.jsp");
	}
%>