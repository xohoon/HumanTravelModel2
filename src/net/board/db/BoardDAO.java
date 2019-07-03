package net.board.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection getConn() throws Exception{
		Connection conn = null;
		
//			 Class.forName("com.mysql.jdbc.Driver")
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
	
	public void insertBoard(BoardDTO Bdto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try{
			conn = getConn();
			
			String sql = "select max(num) from binfo";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt("max(num)")+1;
			}
			sql = "insert into binfo value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, Bdto.getBid());
			pstmt.setString(3, Bdto.getPw());
			pstmt.setString(4, Bdto.getSubject());
			pstmt.setString(5, Bdto.getContent());
			pstmt.setString(6, Bdto.getFile());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
						
			pstmt.executeUpdate();
			
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
			if(pstmt != null){
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
							
		}

	}
	
	public int maxNum(){
		int maxnum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			conn = getConn();
			
			String sql = "select max(num) as maxnum from binfo";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				maxnum = rs.getInt("maxnum");
				
			}
			
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null)
				try{
					conn.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e3){
					e3.printStackTrace();
				}
				if(rs != null){
					try{
						rs.close();
					}catch(Exception e4){
						e4.printStackTrace();
					}
				}
			}
		}
	
		return maxnum;
	}

	public int getBoardCount(){
		int count = 0;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
				
		try{
			conn = getConn();
			String sql = "select count(*) as count from binfo";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				count = rs.getInt("count");
			}
					
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null){
				try{
							conn.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
				if(rs != null)
					try{
					rs.close();
				}catch(Exception e3){
					e3.printStackTrace();
				}
				if(pstmt != null){
					try{
							pstmt.close();	
					}catch(Exception e4){
						e4.printStackTrace();
					}
				}
			}
		}

		return count;
	}

	public ArrayList<BoardDTO> getBoardList(int startRow, int pageSize){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardDTO> Blist = new ArrayList<BoardDTO>();

			
		try{
			conn = getConn();

			 String sql="select * from binfo order by re_ref desc, re_seq asc limit ?,? ";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, startRow-1);
			 pstmt.setInt(2, pageSize);
					 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()){
				 BoardDTO Bdto = new BoardDTO();
				 Bdto.setPw(rs.getString("pw"));
				 Bdto.setBid(rs.getString("bid"));
				 Bdto.setSubject(rs.getString("subject"));
				 Bdto.setContent(rs.getString("content"));
				 Bdto.setFile(rs.getString("file"));
				 Bdto.setNum(rs.getInt("num"));
				 Bdto.setRe_ref(rs.getInt("re_ref"));
				 Bdto.setRe_lev(rs.getInt("re_lev"));
				 Bdto.setRe_seq(rs.getInt("re_seq"));
				 Bdto.setReadcount(rs.getInt("readcount"));
				 Bdto.setDate(rs.getDate("date"));

				 Blist.add(Bdto);
				}
					 
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			if(conn != null)
				try{
					conn.close();
				}catch(Exception e3){
					e3.printStackTrace();
				}
			if(rs != null){
				try{
					rs.close();
				}catch(Exception e4){
					e4.printStackTrace();
				}
			}
		}
		return Blist;
	}
	
	public BoardDTO getBoardContent(int num){
		BoardDTO Bdto = new BoardDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = getConn();
			String sql = "select * from binfo where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				Bdto.setNum(rs.getInt("num"));
				Bdto.setBid(rs.getString("bid"));
				Bdto.setReadcount(rs.getInt("readcount"));
				Bdto.setDate(rs.getDate("date"));
				Bdto.setSubject(rs.getString("subject"));
				Bdto.setContent(rs.getString("content"));
				Bdto.setRe_lev(rs.getInt("re_lev"));
				Bdto.setRe_ref(rs.getInt("re_ref"));
				Bdto.setRe_seq(rs.getInt("re_seq"));
				Bdto.setFile(rs.getString("file"));
				
			}
		
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
				if(pstmt != null){
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
			}
		}
		return Bdto;
	}
	
	public void updateReadCount(int num){
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try{
			conn = getConn();
			String sql = "update binfo set readcount=readcount+1 where num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
				if(pstmt != null){
					try{
						pstmt.close();
					}catch(SQLException e3){
						e3.printStackTrace();
					}
				
					}
				}
			}
		}
	
	public void updateInfo(String content, String subject, int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConn();
			String sql = "update binfo set subject=?, content=?  where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e1){
					e1.printStackTrace();
				}
				if(pstmt != null){
					try{
						pstmt.close();
					}catch(SQLException e2){
						e2.printStackTrace();
					}
				}
			}
		}
		
	}
	

	public int userCheck(String pw, int num){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		System.out.println(pw);

		try {
			 conn = getConn();
			 String sql="select pw from binfo where num=?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, num);
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
		}
		return result;
	}
	
	public void deleteInfo(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConn();
			String sql = "delete from binfo where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e1){
					e1.printStackTrace();
				}
				if(pstmt != null){
					try{
						pstmt.close();
					}catch(SQLException e2){
						e2.printStackTrace();
					}
				}
			}
		}
		
		
	}
	
	public void ReinsertBoard(BoardDTO Bdto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try{
			conn = getConn();
			
			String sql = "select max(num) from binfo";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt("max(num)")+1;
			}
			int ref = Bdto.getRe_ref();
			int seq = Bdto.getRe_seq();
			
			sql = "update binfo set re_seq=re_seq+1 where re_ref="+ref+" and re_seq>"+seq;
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "insert into binfo value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, Bdto.getBid());
			pstmt.setString(3, Bdto.getPw());
			pstmt.setString(4, Bdto.getSubject());
			pstmt.setString(5, Bdto.getContent());
			pstmt.setString(6, Bdto.getFile());
			pstmt.setInt(7, Bdto.getRe_ref());
			pstmt.setInt(8, Bdto.getRe_lev()+1);
			pstmt.setInt(9, Bdto.getRe_seq()+1);
			pstmt.setInt(10, 0);
						
			pstmt.executeUpdate();
			
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e2){
					e2.printStackTrace();
				}
			if(pstmt != null){
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
							
		}

	}
	
	
	public int getBoardCount(String search){
		int count = 0;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
				
		try{
			conn = getConn();
			String sql = "select count(*) as count from binfo where subject like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				count = rs.getInt("count");
			}
					
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(conn != null){
				try{
							conn.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
				if(rs != null)
					try{
					rs.close();
				}catch(Exception e3){
					e3.printStackTrace();
				}
				if(pstmt != null){
					try{
							pstmt.close();	
					}catch(Exception e4){
						e4.printStackTrace();
					}
				}
			}
		}

		return count;
	}

	public ArrayList<BoardDTO> getBoardList(int startRow, int pageSize, String search){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardDTO> Blist = new ArrayList<BoardDTO>();

			
		try{
			conn = getConn();

			 String sql="select * from binfo where subject like ? order by re_ref desc, re_seq asc limit ?,?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, "%"+search+"%");
			 pstmt.setInt(2, startRow-1);
			 pstmt.setInt(3, pageSize);
					 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()){
				 BoardDTO Bdto = new BoardDTO();
				 Bdto.setPw(rs.getString("pw"));
				 Bdto.setBid(rs.getString("bid"));
				 Bdto.setSubject(rs.getString("subject"));
				 Bdto.setContent(rs.getString("content"));
				 Bdto.setFile(rs.getString("file"));
				 Bdto.setNum(rs.getInt("num"));
				 Bdto.setRe_ref(rs.getInt("re_ref"));
				 Bdto.setRe_lev(rs.getInt("re_lev"));
				 Bdto.setRe_seq(rs.getInt("re_seq"));
				 Bdto.setReadcount(rs.getInt("readcount"));
				 Bdto.setDate(rs.getDate("date"));

				 Blist.add(Bdto);
				}
					 
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			if(conn != null)
				try{
					conn.close();
				}catch(Exception e3){
					e3.printStackTrace();
				}
			if(rs != null){
				try{
					rs.close();
				}catch(Exception e4){
					e4.printStackTrace();
				}
			}
		}
		return Blist;
	}
	
	
}



