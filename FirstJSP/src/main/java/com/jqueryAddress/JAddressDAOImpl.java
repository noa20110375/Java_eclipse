package com.jqueryAddress;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.address.Address;
import com.address.AddressDAO;
import com.address.ZipCode;

public class JAddressDAOImpl implements JAddressDAO {

	private static JAddressDAO instance = new JAddressDAOImpl();
	public static JAddressDAO getInstance() {
		return instance;
	}
	
	
	//DB���� Connection  ��ü�� �ݵ�� �ʿ�!.
	//PreparedState	``````````````ment //�̸� ���ڿ� �ν��ϰ� ���߿� ����. ���ڿ� ó���� �̰Ÿ� ��
	// Statement //�ƴ� ��� �⺻������ ��
	//ResultSet /// ���� �����ؾ� SQL ������� ������ �� ����.
	//DBCP// �̸� ������ Ǯ���� ã�ƿ�.
	private Connection getConnection() throws Exception {
		Context  initCtx = new InitialContext();
		//enp���� �ؿ� ���̸��� ã�ƿ�.
		Context  envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds =(DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	
	
	
}


	@Override
	//�߰�
	public void insert(AddressVO avo) {
		// TODO Auto-generated method stub
		Connection con = null ;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql =  "insert into address(num,name, zipcode, addr, tel) "
					+ " values(address_seq.nextval,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, avo.getName());
			ps.setString(2, avo.getZipcode());
			ps.setString(3, avo.getAddr());
			ps.setString(4, avo.getTel());
			ps.executeUpdate();
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
				closeConnection(con,ps,null,null);
		}
		
		
		
		
	}


	@Override
	//��ü����
	public ArrayList<AddressVO> list() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddressVO> arrvo = new ArrayList<AddressVO>();
		
		try {
			con = getConnection();
			String sql = "select * from address order by num desc";
			st = con.createStatement();
		  rs= st.executeQuery(sql);
		  while(rs.next()) {
			  AddressVO ad = new AddressVO();
			  ad.setNum(rs.getInt("num"));
			  ad.setAddr(rs.getString("addr"));
			  ad.setName(rs.getString("name"));
			  ad.setTel(rs.getString("tel") );
			  ad.setZipcode(rs.getString("zipcode"));
			  arrvo.add(ad);
			  
		  }
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeConnection(con, null, st, rs);
			
			
		}
		return arrvo;
	}


	@Override
	//�󼼺���
	public AddressVO findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		//���� �ܺο� ���� 
		AddressVO ad = null;
		try {
			con =getConnection();
			String  sql = "select * from address where num = " +  num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
		if(rs.next()) {
			//���� �ȿ��� �����ϸ� if �ȿ����� ��� ������
			//�׷��� �ܺο� ������ �������
			  ad = new AddressVO();
			  //sql developer�� ��� �ִ� �÷����� ��  �׷��� ��ġ �ؾ���.
			  ad.setNum(rs.getInt("num"));
			  ad.setAddr(rs.getString("addr"));
			  ad.setName(rs.getString("name"));
			  ad.setTel(rs.getString("tel") );
			  ad.setZipcode(rs.getString("zipcode"));
			  
		}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con,null,st,rs);
		}
		return ad;
	}


	@Override
	//ī��Ʈ
	public int getCount() {
		//��ü ���� 
		Connection  con= null;
		Statement st = null;
		ResultSet rs = null;
		
		int count = 0;
		

	//return �� �������� ���� ��������ϴ�...������....
	try {
		con = getConnection();
		String sql = "select count(*) from address order by num desc";
		st= con.createStatement();
		rs= st.executeQuery(sql);
		if(rs.next()) {
			//�ȿ��� �����ϸ� �ܺο����� �� �� ���⿡ �ܺο� �����ؼ� ������ ��.
			count = rs.getInt(1);
		}
	
	}catch(Exception e){
		e.printStackTrace();
		
	}finally {
		closeConnection(con,null,st,rs);
	}
	return count;
	}


	@Override
	//����
	public void update(AddressVO avo) {
		Connection con = null;
		PreparedStatement  ps = null;
	
		
		try {
			con = getConnection();
			String sql="update   address set name=?,  tel=?,"
					+ " zipcode=?, addr=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, avo.getName());
			ps.setString(2, avo.getTel());
			ps.setString(3, avo.getZipcode());
			ps.setString(4, avo.getAddr());
			ps.setInt(5, avo.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, ps, null, null);
		}
		
	}


	@Override
	public void delete(int num) {
		Connection con = null;
		 Statement st = null;
			try {
				con = getConnection();
				String sql = "delete from address where num="+num;
				st = con .createStatement();
				st.execute(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConnection(con,null,st,null);
			}
		
	}
	private void closeConnection (Connection con, PreparedStatement ps, Statement st, ResultSet rs ) {
		try {
		if (con != null)  con.close();
		if (ps != null)    ps.close();
		if (st != null)     st.close();
		if (rs != null)    rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public ArrayList<ZipCodeVO> getZipcode(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCodeVO> zarr = new ArrayList<ZipCodeVO>();
		
		try {
		con = getConnection();
		//dong�� �����̱⿡ ����ǥ�� ���� x
		String sql = "select * from zipcode where dong like '%"+dong+"%'";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()) {
			ZipCodeVO zip = new ZipCodeVO();
		zip.setBunji(rs.getString("bunji"));
		zip.setDong(rs.getString("dong"));
		zip.setGugun(rs.getString("gugun"));
		zip.setSeq(rs.getInt("seq"));
		zip.setSido(rs.getString("sido"));
		zip.setZipcode(rs.getString("zipcode"));
		zarr.add(zip);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		closeConnection(con,null,st,null);
	}
		return zarr;
	}


	@Override
	//��ü���� (�˻�)
	
	public ArrayList<AddressVO> searchList(String field, String word) {
		Connection  con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddressVO> arr = new ArrayList<AddressVO>();
		
		
		try {
			con = getConnection();
			String sql = "select * from address where "+ field+" like '%"+word+"%'" ;
			st =con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				AddressVO avo = new AddressVO();
				avo.setAddr(rs.getString("addr"));
				avo.setName(rs.getString("name"));
				avo.setNum(rs.getInt("num"));
				avo.setTel(rs.getString("tel"));

				avo.setZipcode(rs.getString("zipcode"));
				arr.add(avo);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con,null,st,null);
		}
		return  arr;
	}


	@Override
	//����(�˻�)
	public int getCount(String field, String word) {
		Connection  con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
	try {
		con = getConnection();
		String sql = "select count (*) from address where "+ field+" like '%"+word+"%'";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		if(rs.next()) {
			count = rs.getInt(1);
		}
			
	
	
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		closeConnection(con,null,st,null);
	}
		return count;
	}
	
	
}