<%@ page import="br.com.pes.supermercado.dao.ListaCompraDao"%>
<jsp:useBean id="l" class="br.com.pes.supermercado.bean.ListaCompra"></jsp:useBean>
<jsp:setProperty property="*" name="l"/>

<%
	ListaCompraDao.deletarListaCompra(l);
	response.sendRedirect("viewlistacompra.jsp");
%>