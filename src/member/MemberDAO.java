package member;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
			
	private Connection getConn() throws Exception{
		Connection conn = null;
		
//			 Class.forName("com.mysql.jdbc.Driver");
//			 String dbUrl = "jdbc:mysql://localhost:3306/db";
//			 String dbUser = "dbid";
//			 String dbPass = "dbpw";
//			 
//			 conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		conn = ds.getConnection();
		
		return conn;
	}

	public void insertMember(MemberDTO mdto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			 conn = getConn();
			 
			 String sql="insert into pmember values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1,mdto.getId());
			 pstmt.setString(2,mdto.getName());
			 pstmt.setString(3,mdto.getPw());
			 pstmt.setString(4,mdto.getRepw());
			 
			 pstmt.setInt(5,mdto.getPhone());
			 pstmt.setInt(6,mdto.getBirth());
			 
			 pstmt.setString(7,mdto.getGender());
			 pstmt.setString(8,mdto.getAddress());
			 pstmt.setString(9,mdto.getMail());
			 pstmt.setString(10,mdto.getLikeM());
			 pstmt.setString(11,mdto.getLikeS());
			 pstmt.setString(12,mdto.getHobby());
			 pstmt.setString(13,mdto.getJob());
			 
			 pstmt.setTimestamp(14, mdto.getDate());

			 pstmt.executeUpdate();
			 
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e1){
					e1.printStackTrace();
				}
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
		}

	}
	

	public MemberDTO getMember(String id){
		MemberDTO mdto = new MemberDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConn();

			 String sql="select * from pmember where id=?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);

			 rs = pstmt.executeQuery();

			 if(rs.next()){

				 mdto.setId(rs.getString("id"));
				 mdto.setName(rs.getString("name"));
				 mdto.setPhone(rs.getInt("phone"));
				 mdto.setBirth(rs.getInt("birth"));
				 mdto.setGender(rs.getString("gender"));
				 mdto.setAddress(rs.getString("address"));
				 mdto.setMail(rs.getString("mail"));
				 mdto.setLikeM(rs.getString("likeM"));
				 mdto.setLikeS(rs.getString("likeS"));
				 mdto.setHobby(rs.getString("hobby"));
				 mdto.setJob(rs.getString("job"));
			 }

		}catch(Exception e1) {
			e1.printStackTrace();
		}finally{
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException e3){
					e3.printStackTrace();
				}
			if(rs != null){
				try{
					rs.close();
				}catch(SQLException e4){
					e4.printStackTrace();
				}
			}
			
		}
		return mdto;
	}
	public int userCheck(String id, String pw){
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConn();

			 String sql="select pw from pmember where id=?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);

			 rs = pstmt.executeQuery();

			 if(rs.next()){
				 if(pw.equals(rs.getString("pw"))){
					 result = 1;
					 					 
				 }else{
					 result = 0;
				 }
			 }else{
				 result = -1;
			 }
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException e3){
					e3.printStackTrace();
				}
			if(rs != null){
				try{
					rs.close();
				}catch(SQLException e4){
					e4.printStackTrace();
				}
			}
		}
		
		return result;
		
	}
	
	public void updateMember(MemberDTO mdto){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConn();

			 String sql="update pmember set phone=?, birth=?, gender=?, address=?, mail=?, likeM=?, likeS=?, hobby=?, job=? where id=?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, mdto.getPhone());
			 pstmt.setInt(2, mdto.getBirth());
			 pstmt.setString(3, mdto.getGender());
			 pstmt.setString(4, mdto.getAddress());
			 pstmt.setString(5, mdto.getMail());
			 pstmt.setString(6, mdto.getLikeM());
			 pstmt.setString(7, mdto.getLikeS());
			 pstmt.setString(8, mdto.getHobby());
			 pstmt.setString(9, mdto.getJob());
			 
			 pstmt.setString(10, mdto.getId());

			 pstmt.executeUpdate();

		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e3){
					e3.printStackTrace();
				}
			}
		}
	
	public void deleteMember(String id){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConn();

			String sql="delete from pmember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
	
			pstmt.executeUpdate();
			

		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e3){
					e3.printStackTrace();
				}
		}
	}
	
	public ArrayList<MemberDTO> getMemberList(){

		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = getConn();

			 String sql="select * from pmember";
			 pstmt = conn.prepareStatement(sql);

			 rs = pstmt.executeQuery();

			 while(rs.next()){
				  MemberDTO mdto = new MemberDTO();
				  mdto.setId(rs.getString("id"));
				  mdto.setName(rs.getString("name"));
				  mdto.setPhone(rs.getInt("phone"));
				  mdto.setBirth(rs.getInt("birth"));
				  mdto.setGender(rs.getString("gender"));
				  mdto.setAddress(rs.getString("address"));
				  mdto.setMail(rs.getString("mail"));
				  mdto.setLikeM(rs.getString("likeM"));
				  mdto.setLikeS(rs.getString("likeS"));
				  mdto.setHobby(rs.getString("hobby"));
				  mdto.setJob(rs.getString("job"));
				  mdto.setDate(rs.getTimestamp("date"));
				  
				  list.add(mdto);
			 }
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e3){
					e3.printStackTrace();
				}
			if(rs != null){
				try{
					rs.close();
				}catch(SQLException e4){
					e4.printStackTrace();
				}
			}
		}
		return list;
	}
	
	public int idCheck(String id){
		int checkid = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = getConn();
			
			String sql = "select id from pmember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				checkid = 1;
			}else{
				checkid = 0;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e1){
					e1.printStackTrace();
				}
				if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
				if(rs != null){
					try{
						rs.close();
					}catch(SQLException e3){
						e3.printStackTrace();
					}
				}
			}
		}
		
		return checkid;
	}
	
	
}//클래스
	


