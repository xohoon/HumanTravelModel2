package board_re;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class Board_reDAO {
	
	private Connection getConn() throws Exception{
		Connection conn = null;
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		conn = ds.getConnection();
		
		return conn;
	}
	
	public void insertBoard(Board_reDTO Bdto_re){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 0;

		try{
			conn = getConn();
			
			String sql = "select max(num_re) from binfo_re";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				num = rs.getInt("max(num_re)")+1;
			}
			int ref = Bdto_re.getRe_ref();
			int seq = Bdto_re.getRe_seq();
			pstmt.close();
			sql = "update binfo_re set re_seq=re_seq+1 where re_ref="+ref+" and re_seq>"+seq;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "insert into binfo_re value(?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, Bdto_re.getNum());
			pstmt.setString(3, Bdto_re.getBid());
			pstmt.setString(4, Bdto_re.getContent());
			pstmt.setInt(5, Bdto_re.getLike_re());
			pstmt.setInt(6, Bdto_re.getRe_ref());
			pstmt.setInt(7, Bdto_re.getRe_lev()+1);
			pstmt.setInt(8, Bdto_re.getRe_seq()+1);
			
			
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
					if(rs != null){
						try{
							rs.close();
						}catch(SQLException e3){
							e3.printStackTrace();
						}
					}
				}
			}
		}
		
	}
	
	public ArrayList<Board_reDTO> getBoardList(int startRow, int pageSize, int num01){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Board_reDTO> Blist = new ArrayList<Board_reDTO>();		
		
		try{
			conn = getConn();
			
			 String sql="select * from binfo_re order by re_ref desc, re_seq asc limit ?,? ";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, startRow-1);
			 pstmt.setInt(2, pageSize);
					 
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 Board_reDTO Bdto_re = new Board_reDTO();
				 Bdto_re.setBid(rs.getString("bid"));
				 Bdto_re.setContent(rs.getString("content"));
				 Bdto_re.setNum(rs.getInt("num"));
				 Bdto_re.setRe_ref(rs.getInt("re_ref"));
				 Bdto_re.setRe_lev(rs.getInt("re_lev"));
				 Bdto_re.setRe_seq(rs.getInt("re_seq"));

				 Blist.add(Bdto_re);
				 
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
//	
//	public Board_reDTO getBoardContent(int num){
//		Board_reDTO Bdto = new Board_reDTO();
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try{
//			conn = getConn();
//			String sql = "select * from binfo_re where num=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()){
//				
//				Bdto.setNum(rs.getInt("num"));
//				Bdto.setBid(rs.getString("bid"));
//				Bdto.setContent(rs.getString("content"));
//				Bdto.setRe_lev(rs.getInt("re_lev"));
//				Bdto.setRe_ref(rs.getInt("re_ref"));
//				Bdto.setRe_seq(rs.getInt("re_seq"));
//				
//			}
//		
//		}catch(Exception e1){
//			e1.printStackTrace();
//		}finally{
//			if(conn != null){
//				try{
//					conn.close();
//				}catch(SQLException e2){
//					e2.printStackTrace();
//				}
//				if(pstmt != null){
//					try{
//						pstmt.close();
//					}catch(SQLException e3){
//						e3.printStackTrace();
//					}
//					if(rs != null){
//						try{
//							rs.close();
//						}catch(SQLException e4){
//							e4.printStackTrace();
//						}
//					}
//				}
//			}
//		}
//		return Bdto;
//	}
//	
//	public void updateInfo(String content, int num){
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		
//		try{
//			conn = getConn();
//			String sql = "update binfo_re set content=?  where num=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, content);
//			pstmt.setInt(2, num);
//			
//			pstmt.executeUpdate();
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}finally{
//			if(conn != null){
//				try{
//					conn.close();
//				}catch(SQLException e1){
//					e1.printStackTrace();
//				}
//				if(pstmt != null){
//					try{
//						pstmt.close();
//					}catch(SQLException e2){
//						e2.printStackTrace();
//					}
//				}
//			}
//		}
//		
//	}
	
	public void deleteInfo(int re_seq){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConn();
			String sql = "delete from binfo_re where re_seq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_seq);
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
	

}
