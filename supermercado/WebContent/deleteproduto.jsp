<%@page import="br.com.pes.supermercado.dao.ProdutoDao"%>
<%@ page import="br.com.pes.supermercado.dao.ProdutoDao"%>
<jsp:useBean id="p" class="br.com.pes.supermercado.bean.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
	ProdutoDao.deletarProduto(p);
	response.sendRedirect("viewprodutos.jsp");
%>