package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Location;
import com.beans.Property;

public class Account {

	
	String user = "root";
	String password="";
	String url="jdbc:mysql://localhost:3306/";
	String dbname="propertywala";
	String driver="com.mysql.jdbc.Driver";
	Connection con;
	private void dbConnect() throws ClassNotFoundException, SQLException{
		Class.forName(driver);
	    con = DriverManager.getConnection(url+dbname,user,password);
	}
	
	private void dbClose() throws SQLException{
		con.close();
	}
	
	public ArrayList<Property> searchProperty(String loc) throws Exception{
		dbConnect();
		ArrayList<Property> list = new ArrayList<Property>();
		
		String sql = "select * from property where location=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, loc); 
		ResultSet rst = pstmt.executeQuery();
		 
		while(rst.next()){
			Property p = new Property();
			int id = rst.getInt("id");
			String location=rst.getString("location");
			String area=rst.getString("area");
			String price=rst.getString("price");
			String seller_name=rst.getString("seller_name");
			String contact=rst.getString("contact");
			String image=rst.getString("image");
			String user_id=rst.getString("user_id");
			String description=rst.getString("description"); 
			p.setId(id);
			p.setLocation(location);
			p.setArea(area);
			p.setPrice(price);
			p.setSeller_name(seller_name);
			p.setContact(contact);
			p.setImage(image);
			p.setUser_id(user_id);
			p.setDescription(description);
			list.add(p);
			p=null;
		}
		dbClose();
		return list;
	}

	public ArrayList<Location> searchLocation(String search_query) throws Exception {
		dbConnect();
		ArrayList<Location> list = new ArrayList<Location>();
		String sql = "select DISTINCT location from property where location LIKE ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" +search_query+ "%"); 
		ResultSet rst = pstmt.executeQuery();
		while(rst.next()){
			Location l = new Location();
			String location=rst.getString("location");
			l.setLocation(location);
			list.add(l);
		}
		dbClose();
		return list;
	}

	public String sellProperty(String location, String area, String price, String seller_name, String contact,
			String desc, String user_id) throws Exception{
		dbConnect();
		String sql = "Insert into property(location,area,price,seller_name,contact,image,description,user_id)"
				+ "values(?,?,?,?,?,?,?,?) ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, location);
		pstmt.setString(2, area);
		pstmt.setString(3, price);
		pstmt.setString(4, seller_name);
		pstmt.setString(5, contact);
		pstmt.setString(6, "no-file.jpg");
		pstmt.setString(7, desc);
		pstmt.setString(8, user_id);
		pstmt.executeUpdate();
		
		String sql1 = "select id from property where location = ? AND area = ? AND price = ? AND seller_name = ? AND contact = ? AND image = ? AND description = ? AND user_id = ?";
		PreparedStatement pstmt1 = con.prepareStatement(sql1);
		pstmt1.setString(1, location);
		pstmt1.setString(2, area);
		pstmt1.setString(3, price);
		pstmt1.setString(4, seller_name);
		pstmt1.setString(5, contact);
		pstmt1.setString(6, "no-file.jpg");
		pstmt1.setString(7, desc);
		pstmt1.setString(8, user_id);
		ResultSet rst=pstmt1.executeQuery();
		String id=null;
		while(rst.next()){
			id=rst.getString("id");
		}
		
		String sql2="UPDATE property set image = ? where id=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, id+".jpg");
		pstmt2.setString(2, id);
		pstmt2.executeUpdate();
		
		return id+".jpg";
	}

	public String login(String email, String password) throws Exception{
		dbConnect();
		String id=null;
		String sql1 = "select * from user where email = ? AND password = ?";
		PreparedStatement pstmt1 = con.prepareStatement(sql1);
		pstmt1.setString(1, email);
		pstmt1.setString(2, password);
		ResultSet rst=pstmt1.executeQuery();
		while(rst.next()){
			id=rst.getString("id");
		}
		dbClose();
		return id;
	}

	public String register(String email, String name, String password) throws Exception{
		dbConnect();
		int count=0;
		String sql1 = "select count(*) as count  from user where email = ?";
		PreparedStatement pstmt1 = con.prepareStatement(sql1);
		pstmt1.setString(1, email);
		ResultSet rst=pstmt1.executeQuery();
		while(rst.next()){
			count=rst.getInt("count");
		}
		if(count>0){
			dbClose();
		 return null;
		}
		else{
			
			String sql = "Insert into user(email,name,password) values(?,?,?) ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,email);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			pstmt.executeUpdate();
			String user_id=null;
			
			String sql0 = "select id  from user where email = ?";
			PreparedStatement pstmt0 = con.prepareStatement(sql0);
			pstmt0.setString(1, email);
			ResultSet rst0=pstmt0.executeQuery();
			while(rst0.next()){
				user_id=rst0.getString("id");
			}
			dbClose();
			return user_id;
			
		}
		}

}
