<%@ page import="br.com.pes.supermercado.dao.ProdutoDao"%>
<jsp:useBean id="p" class="br.com.pes.supermercado.bean.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
	int i = ProdutoDao.salvarProduto(p);
	
	if(i > 0){
		response.sendRedirect("addproduto-sucess.jsp");
	}else{
		response.sendRedirect("addproduto-error.jsp");
	}
%>