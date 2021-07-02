<%@ page import="br.com.pes.supermercado.dao.ListaCompraDao"%>
<jsp:useBean id="l" class="br.com.pes.supermercado.bean.ListaCompra"></jsp:useBean>
<jsp:setProperty property="*" name="l"/>

<%
	int i = ListaCompraDao.salvarListaCompra(l);
	
	if(i > 0){
		response.sendRedirect("addlstbay-sucess.jsp");
	}else{
		response.sendRedirect("addlstbay-error.jsp");
	}
%>