package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Product;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class Account 
{

	String user = "root";
	String password="";
	String url="jdbc:mysql://localhost:3306/";
	String dbname="hoteltest";
	String driver="com.mysql.jdbc.Driver";
	Connection con;
	
	public void insert(String name,String address,String phone,String email,String password) throws ClassNotFoundException, SQLException{
		dbConnect();
		
		String sql = "insert into user(name, address, phone, email, password) values (?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, address);
		pstmt.setString(3, phone);
		pstmt.setString(4, email);
		pstmt.setString(5, password);
		
		pstmt.executeUpdate();
		dbClose();
	}
	

	//We are making a Array list whose type cast is Product class. 
	//ArrayList<Product> list = new ArrayList<Product>();
	
	public boolean validateuser(String email, String password) throws ClassNotFoundException, SQLException
	{
		dbConnect();
		int count = 0;
		String sql="select count(*) as count from user where email = ? AND password =?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next())
		{
			count = rst.getInt("count"); //1
		}
		dbClose();
		if(count == 0)
			return false;
		else
			return true;
	}
	
	public int getuserid(String email, String password) throws ClassNotFoundException, SQLException
	{
		dbConnect();
		int count = 0;
		int userid = 0;
		
		String sql="select userid,count(*) as count from user where email = ? AND password =?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		
	
		
		ResultSet rst = pstmt.executeQuery();
	
		
		while(rst.next())
		{
			count = rst.getInt("count"); //1
			userid = rst.getInt("userid"); 
		}
	
		
		dbClose();
		
		return userid;
	}
	
	
	public void makereservation(Integer userid,String date, String people, String time) throws ClassNotFoundException, SQLException
	{
		dbConnect();
		
		String sql = "insert into reservation(userid,date,people,time) values (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, userid); /////////////// we need to make a change here definitely
		pstmt.setString(2, date);
		pstmt.setString(3, people);
		pstmt.setString(4, time);
		
		
		pstmt.executeUpdate();
		dbClose();
	}
	
	public void addreview(Integer userid,String pid, String review, String rating) throws ClassNotFoundException, SQLException
	{
		dbConnect();
		
		String sql = "insert into review(userid,pid,review,rating) values (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, userid); 
		pstmt.setString(2, pid);
		pstmt.setString(3, review);
		pstmt.setString(4, rating);
		
		pstmt.executeUpdate();
		dbClose();
	}
	
	
	public void checkout(Long orderid, Integer userid, Integer[] a)throws ClassNotFoundException, SQLException
	{
		dbConnect();
		Integer[] b=a;
		int i;
		for(i=0;i<b.length;i++)
		{
		String sql = "insert into orders(orderid,userid,pid) values (?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, orderid); 
		pstmt.setInt(2, userid);
		pstmt.setInt(3, b[i]);
		
		pstmt.executeUpdate();
		}
		dbClose();
	}
	

	private void dbConnect() throws ClassNotFoundException, SQLException{
		Class.forName(driver);
	    con = DriverManager.getConnection(url+dbname,user,password);
	}
	
	private void dbClose() throws SQLException{
		con.close();
	}

}
