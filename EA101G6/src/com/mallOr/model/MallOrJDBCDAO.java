package com.mallOr.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MallOrJDBCDAO implements MallOrDAO_interface {

	private static final String URL ="jdbc:oracle:thin:@localhost:1521:xe"; 
	private static final String NAME ="EA101";
	private static final String PSW ="123456";
	private static final String SQLADD ="INSERT INTO MALLOR (MALLORNO,MBRNO,ORDATE,TAKE,ADDRESS,STATUS,PAYSTATUS,BOXSTATUS)"
			+ "VALUES(TO_CHAR(SYSDATE,'YYYYMMDD')||'-'||LPAD(TO_CHAR(MALLORNO_SEQ.NEXTVAL), 7, '0'),?,?,?,?,?,?,?)";
	private static final String SQLUPDATE ="UPDATE MALLOR "
			+ "SET TAKE=?,ADDRESS=?,STATUS=?,PAYSTATUS=?,BOXSTATUS=?"
			+ "WHERE MALLORNO=?";
	private static final String SQLDELETE="DELETE MALLOR WHERE MALLORNO=?";
	private static final String SQLSELALL="SELECT * FROM MALLOR ORDER BY MALLORNO";
	private static final String SQLSELBYMBR="SELECT * FROM MALLOR WHERE MBRNO=?";
	private static final String SQLSELBYSTATUS="SELECT * FROM MALLOR WHERE STATUS=?";
	private static final String SQLSELBYORNO="SELECT * FROM MALLOR WHERE MALLORNO=?";
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public void add(MallOrVO mallor) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement past = null;

		try {
			conn=DriverManager.getConnection(URL,NAME,PSW);
			
			conn.setAutoCommit(false);
			past=conn.prepareStatement(SQLADD);
			past.setString(1,mallor.getMbrNo());
			past.setTimestamp(2,mallor.getOrDate());
			past.setString(3,mallor.getTake());
			past.setString(4,mallor.getAddress());
			past.setInt(5,mallor.getStatus());
			past.setInt(6,mallor.getPayStatus());
			past.setInt(7,mallor.getBoxStatus());
			past.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			
			try {
				conn.setAutoCommit(true);
				if(past!=null)
					past.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		
	}


	@Override
	public void update(MallOrVO mallor) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement past = null;
		
		try {
			conn = DriverManager.getConnection(URL,NAME,PSW);
			
			conn.setAutoCommit(false);
			past = conn.prepareStatement(SQLUPDATE);
			past.setString(1,mallor.getTake());
			past.setString(2,mallor.getAddress());
			past.setInt(3,mallor.getStatus());
			past.setInt(4,mallor.getPayStatus());
			past.setInt(5,mallor.getBoxStatus());
			past.setString(6,mallor.getMallOrNo());
			past.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			
			try {
				conn.setAutoCommit(true);
				if(past!=null)
					past.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
		
		
		
	}
	
	
	@Override
	public void delete(String mallOrNo) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement past = null;
		
		try {
			conn = DriverManager.getConnection(URL,NAME,PSW);
			
			conn.setAutoCommit(false);
			past = conn.prepareStatement(SQLDELETE);
			past.setString(1,mallOrNo);
			past.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			
			try {
				conn.setAutoCommit(true);
				if(past!=null)
					past.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
		
	}

	@Override
	public List<MallOrVO> getAll() {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement past = null;
		ResultSet rs =null;
		List<MallOrVO> list =new ArrayList<MallOrVO>();
		try {
			conn = DriverManager.getConnection(URL,NAME,PSW);
			past = conn.prepareStatement(SQLSELALL);
			rs = past.executeQuery();
			
			while(rs.next()) {
				MallOrVO mallor = new MallOrVO();
				mallor.setMallOrNo(rs.getString("MALLORNO"));
				mallor.setMbrNo(rs.getString("MBRNO"));
				mallor.setOrDate(rs.getTimestamp("ORDATE"));
				mallor.setTake(rs.getString("TAKE"));
				mallor.setAddress(rs.getString("ADDRESS"));
				mallor.setStatus(rs.getInt("STATUS"));
				mallor.setPayStatus(rs.getInt("PAYSTATUS"));
				mallor.setBoxStatus(rs.getInt("BOXSTATUS"));
				list.add(mallor);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			try {
				if(rs!=null)
					rs.close();
				if(past!=null)
					past.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
		
		
		
	}

	@Override
	public List<MallOrVO> findByMbrNo(String mbrNo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement past = null;
		ResultSet rs =null;
		List<MallOrVO> list =new ArrayList<MallOrVO>();
		try {
			conn = DriverManager.getConnection(URL,NAME,PSW);
			past = conn.prepareStatement(SQLSELBYMBR);
			past.setString(1, mbrNo);
			rs = past.executeQuery();
			
			while(rs.next()) {
				MallOrVO mallor = new MallOrVO();
				mallor.setMallOrNo(rs.getString("MALLORNO"));
				mallor.setMbrNo(rs.getString("MBRNO"));
				mallor.setOrDate(rs.getTimestamp("ORDATE"));
				mallor.setTake(rs.getString("TAKE"));
				mallor.setAddress(rs.getString("ADDRESS"));
				mallor.setStatus(rs.getInt("STATUS"));
				mallor.setPayStatus(rs.getInt("PAYSTATUS"));
				mallor.setBoxStatus(rs.getInt("BOXSTATUS"));
				list.add(mallor);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			try {
				if(rs!=null)
					rs.close();
				if(past!=null)
					past.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public List<MallOrVO> findByStatus(Integer status) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement past = null;
		ResultSet rs =null;
		List<MallOrVO> list =new ArrayList<MallOrVO>();
		try {
			conn = DriverManager.getConnection(URL,NAME,PSW);
			past = conn.prepareStatement(SQLSELBYSTATUS);
			past.setInt(1, status);
			rs = past.executeQuery();
			
			while(rs.next()) {
				MallOrVO mallor = new MallOrVO();
				mallor.setMallOrNo(rs.getString("MALLORNO"));
				mallor.setMbrNo(rs.getString("MBRNO"));
				mallor.setOrDate(rs.getTimestamp("ORDATE"));
				mallor.setTake(rs.getString("TAKE"));
				mallor.setAddress(rs.getString("ADDRESS"));
				mallor.setStatus(rs.getInt("STATUS"));
				mallor.setPayStatus(rs.getInt("PAYSTATUS"));
				mallor.setBoxStatus(rs.getInt("BOXSTATUS"));
				list.add(mallor);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			try {
				if(rs!=null)
					rs.close();
				if(past!=null)
					past.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public MallOrVO findOneByOrNo(String mallOrNo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement past = null;
		ResultSet rs =null;
		MallOrVO mallor=null;
		try {
			conn = DriverManager.getConnection(URL,NAME,PSW);
			past = conn.prepareStatement(SQLSELBYORNO);
			past.setString(1, mallOrNo);
			rs = past.executeQuery();
			if(rs.next()) {
				mallor = new MallOrVO();
				mallor.setMallOrNo(rs.getString("MALLORNO"));
				mallor.setMbrNo(rs.getString("MBRNO"));
				mallor.setOrDate(rs.getTimestamp("ORDATE"));
				mallor.setTake(rs.getString("TAKE"));
				mallor.setAddress(rs.getString("ADDRESS"));
				mallor.setStatus(rs.getInt("STATUS"));
				mallor.setPayStatus(rs.getInt("PAYSTATUS"));
				mallor.setBoxStatus(rs.getInt("BOXSTATUS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			try {
				if(rs!=null)
					rs.close();
				if(past!=null)
					past.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return mallor;
	}
	
	

	
}
	
