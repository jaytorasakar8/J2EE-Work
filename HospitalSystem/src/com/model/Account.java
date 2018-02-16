package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Patient;

public class Account {
	String user = "root";
	String password="";
	String url="jdbc:mysql://localhost:3306/";
	String dbname="hospital";
	String driver="com.mysql.jdbc.Driver";
	Connection con;
	ArrayList<Patient> list = new ArrayList<Patient>();
	private void dbConnect() throws ClassNotFoundException, SQLException{
		Class.forName(driver);
	    con = DriverManager.getConnection(url+dbname,user,password);
	}
	
	private void dbClose() throws SQLException{
		con.close();
	}
	
	public ArrayList<Patient> searchPatient(String search_query) throws Exception{
		dbConnect();
		String sql = "select * from patient where name LIKE ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" +search_query+ "%"); //%john%
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()){
			Patient p = new Patient();
			int id = rst.getInt("id");
			String name=rst.getString("name");
			String email=rst.getString("email");
			String contact=rst.getString("contact");
			String age=rst.getString("age");
			String address=rst.getString("address"); 
			p.setId(id);
			p.setName(name);
			p.setAddress(address);
			p.setAge(age);
			p.setEmail(email);
			p.setContact(contact);
			list.add(p);
			p=null;
		}
		dbClose();
		
		return list;
	}
	
	public Patient fetchPatient(String id) throws Exception{
		dbConnect();
		String sql = "select * from patient where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id)); //%john%
		ResultSet rst = pstmt.executeQuery();
		Patient p = new Patient();
		while(rst.next()){
			String name=rst.getString("name");
			String email=rst.getString("email");
			String contact=rst.getString("contact");
			String age=rst.getString("age");
			String address=rst.getString("address"); 
			p.setName(name);
			p.setAddress(address);
			p.setAge(age);
			p.setEmail(email);
			p.setContact(contact);
		}
		return p ;
		
	}
}













