package br.com.pes.supermercado.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import br.com.pes.supermercado.bean.ListaCompra;

public class ListaCompraDao {
	
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
	
	public static int deletarListaCompra(ListaCompra l) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM listacompra WHERE id=?");
			ps.setInt(1,  l.getId());
			status=ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		
		return status;
	
	}
		
	public static int salvarListaCompra(ListaCompra l) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO listacompra (nome) VALUES(?)");
			ps.setString(1, l.getNome());
			status = ps.executeUpdate();
		}catch (Exception e){
			System.out.println("salvarListaCompra");
			System.out.println(e);
			
		}
		
		return status;
	}
	
	public static int updateListaCompra(ListaCompra l) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE listacompra SET nome=? WHERE id=?");
			ps.setString(1, l.getNome());
			ps.setInt(2, l.getId());
			status = ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("updateListaCompra");
			System.out.println(e);
		}
		return status;
		
	}

	public static ListaCompra getRegistroById(int id) {
		ListaCompra listacompra =null;

		try {

			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM listacompra WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				listacompra = new ListaCompra();
				listacompra.setId(rs.getInt("id"));
				listacompra.setNome(rs.getString("nome"));
			}

		}catch(Exception e) {
			System.out.println("ListaCompra");
			System.out.println(e);
		}

		return listacompra;
	}



	public static List<ListaCompra> exibeTodasListas(){
		List<ListaCompra> list = new ArrayList<ListaCompra>();

		try {

			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM listacompra ORDER BY nome");
			ResultSet rs= ps.executeQuery();

			while(rs.next()) {
				ListaCompra listacompra = new ListaCompra();
				
				listacompra.setId(rs.getInt("id"));
				listacompra.setNome(rs.getString("nome"));
				
				list.add(listacompra);
			}
		}catch(Exception e) {
			System.out.println("Erro Exibe todas as Listas de Compra " + e);
		}

		return list;

	}


}
