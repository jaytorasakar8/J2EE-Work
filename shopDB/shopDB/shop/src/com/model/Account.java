package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Product;

public class Account {

	String user = "root";
	String password="";
	String url="jdbc:mysql://localhost:3306/";
	String dbname="shopdb";
	String driver="com.mysql.jdbc.Driver";
	Connection con;
	ArrayList<Product> list = new ArrayList<Product>();
	public ArrayList<Product> getProduct(int cat_id) throws Exception{
		dbConnect();
		
		String sql="select * from product where cat_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cat_id);
				
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()){
			Product product = new Product();
			product.setName(rst.getString("name"));
			product.setPrice(rst.getString("price"));
			product.setShort_desc(rst.getString("short_desc"));
			product.setDesc(rst.getString("desc"));
			list.add(product);
			product=null;
		}
		rst.close();
		pstmt.close();
		dbClose();
		
		return list;
	}
	
	private void dbConnect() throws ClassNotFoundException, SQLException{
		Class.forName(driver);
	    con = DriverManager.getConnection(url+dbname,user,password);
	}
	
	private void dbClose() throws SQLException{
		con.close();
	}
}
