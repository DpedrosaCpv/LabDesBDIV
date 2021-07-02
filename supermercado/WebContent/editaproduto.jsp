<%@ page import="br.com.pes.supermercado.dao.ProdutoDao"%>
<jsp:useBean id="u" class="br.com.pes.supermercado.bean.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i= ProdutoDao.updateProduto(u);
response.sendRedirect("viewprodutos.jsp");

%>
