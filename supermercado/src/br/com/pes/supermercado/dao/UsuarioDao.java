package br.com.pes.supermercado.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import br.com.pes.supermercado.bean.Usuario;

public class UsuarioDao {

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
	
	public static int deletarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM usuario WHERE id=?");
			ps.setInt(1,  u.getId());
			status=ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		
		return status;
	
	}
		
	public static int salvarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO usuario (nome, email, senha) VALUES(?,?,?)");
			ps.setString(1, u.getNome());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getSenha());
			status = ps.executeUpdate();
		}catch (Exception e){
			System.out.println(e);
			
		}
		
		return status;
	}
	
	public static int updateUsuario(Usuario u) {
		int status =0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE USUARIO SET nome=?, "
					+ "email=?, senha=? WHERE id=?");
			ps.setString(1, u.getNome());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getSenha());
			ps.setInt(4, u.getId());
			status = ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return status;
		
	}

	public static Usuario getRegistroById(int id) {
		Usuario usuario =null;

		try {

			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
			}

		}catch(Exception e) {
			System.out.println(e);
		}

		return usuario;
	}



	public static List<Usuario> listaTodosUsuarios(){
		List<Usuario> list = new ArrayList<Usuario>();

		try {

			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario ORDER BY nome");
			ResultSet rs= ps.executeQuery();

			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				list.add(usuario);
			}
		}catch(Exception e) {
			System.out.println("Erro Lista todos usuario " + e);
		}

		return list;

	}

}
