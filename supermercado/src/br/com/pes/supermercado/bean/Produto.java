package br.com.pes.supermercado.bean;

public class Produto {

	private int id;
	private String descricao;
	private String unidade;
	private String preco;
	private String fabricante;
	private String Supermercado;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getUnidade() {
		return unidade;
	}
	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}
	public String getPreco() {
		return preco;
	}
	public void setPreco(String preco) {
		this.preco = preco;
	}
	public String getFabricante() {
		return fabricante;
	}
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}
	public String getSupermercado() {
		return Supermercado;
	}
	public void setSupermercado(String supermercado) {
		Supermercado = supermercado;
	}
	
	
	
}
