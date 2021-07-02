package br.com.pes.supermercado.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import br.com.pes.supermercado.bean.Produto;

public class ProdutoDao {
	
	
		public static Connection getConnection() {
			Connection con=null;

			try {

				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/supermercado","root","");
				System.out.println("*****  CONEXÃO COM BANCO OK  *****");
			} catch (Exception e) {
				System.out.println(e);
			}
			return con;
		}
		
		public static int deletarProduto(Produto p) {
			int status = 0;
			
			try {
				Connection con = getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM produto WHERE id=?");
				ps.setInt(1,  p.getId());
				status=ps.executeUpdate();
			}catch(Exception e){
				System.out.println(e);
			}
			
			return status;
		
		}
			
		public static int salvarProduto(Produto p) {
			int status = 0;
			
			try {
				Connection con = getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO produto (descricao, unidade, preco, fabricante, supermercado) VALUES(?,?,?,?,?)");
				ps.setString(1, p.getDescricao());
				ps.setString(2, p.getUnidade());
				ps.setString(3, p.getPreco());
				ps.setString(4, p.getFabricante());
				ps.setString(5, p.getSupermercado());
				status = ps.executeUpdate();
			}catch (Exception e){
				System.out.println(e);
				
			}
			
			return status;
		}
		
		public static int updateProduto(Produto p) {
			int status = 0;
			
			try {
				Connection con = getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE produto SET descricao=?, "
						+ "unidade=?, preco=?, fabricante=?, supermercado=? WHERE id=?");
				ps.setString(1, p.getDescricao());
				ps.setString(2, p.getUnidade());
				ps.setString(3, p.getPreco());
				ps.setString(4, p.getFabricante());
				ps.setString(5, p.getSupermercado());
				ps.setInt(6, p.getId());
				status = ps.executeUpdate();
				
			}catch (Exception e) {
				System.out.println(e);
			}
			return status;
			
		}

		public static Produto getRegistroById(int id) {
			Produto produto =null;

			try {

				Connection con = getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM produto WHERE id=?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();

				while(rs.next()) {
					produto = new Produto();
					produto.setId(rs.getInt("id"));
					produto.setDescricao(rs.getString("descricao"));
					produto.setUnidade(rs.getString("unidade"));
					produto.setPreco(rs.getString("preco"));
					produto.setFabricante(rs.getString("fabricante"));
					produto.setSupermercado(rs.getString("supermercado"));
				}

			}catch(Exception e) {
				System.out.println(e);
			}

			return produto;
		}



		public static List<Produto> listaTodosProdutos(){
			List<Produto> list = new ArrayList<Produto>();

			try {

				Connection con = getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM produto ORDER BY descricao");
				ResultSet rs= ps.executeQuery();

				while(rs.next()) {
					Produto produto = new Produto();
					
					produto.setId(rs.getInt("id"));
					produto.setDescricao(rs.getString("descricao"));
					produto.setUnidade(rs.getString("unidade"));
					produto.setPreco(rs.getString("preco"));
					produto.setFabricante(rs.getString("fabricante"));
					produto.setSupermercado(rs.getString("supermercado"));
					
					list.add(produto);
				}
			}catch(Exception e) {
				System.out.println("Erro Lista todos produtos " + e);
			}

			return list;

		}




}
