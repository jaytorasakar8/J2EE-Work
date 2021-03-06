package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

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
		dbClose();
		return p ;
		
	}
	public boolean checkSlot(String doctor_id,String date,String time_slot) throws Exception{
		dbConnect();
		String sql = "select count(*) as count from books_appt where doctor_id=? AND date=? AND time=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(doctor_id)); 
		pstmt.setString(2, date);
		pstmt.setString(3, time_slot);
		
		ResultSet rst = pstmt.executeQuery();
		
		int count=0;
		while(rst.next()){
			count =rst.getInt("count");
		}
		
		dbClose();
		if(count< 8){
			return true;
		}
		return false;
	}

	public void insertAppt(int id, String doctor_id, String date,String time_slot) throws Exception {
		dbConnect();
		String sql = "insert into books_appt values(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.setInt(2, Integer.parseInt(doctor_id));
		pstmt.setString(3, date);
		pstmt.setString(4, time_slot);
		pstmt.executeUpdate();
		dbClose();
	}
	
	public ArrayList<Patient> fetchAppointment(int doctor_id) throws Exception{
		dbConnect();
		
		String sql = "select * from patient ,books_appt where patient.id=patient_id AND doctor_id = ? AND date=? ORDER BY time";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,doctor_id); 
		pstmt.setString(2,DateFormat.getDateInstance().format(new Date())); 
		
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()){
			Patient p = new Patient();
			int id = rst.getInt("patient.id");
			String name=rst.getString("patient.name");
			String email=rst.getString("patient.email");
			String contact=rst.getString("patient.contact");
			String age=rst.getString("patient.age");
			String address= rst.getString("patient.address");
			String date = rst.getString("date");
			String time = rst.getString("time");
			p.setDate(date);
			p.setTime(time);			
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
	public void insertHistory(String patient_id,String current_history) throws Exception{
		dbConnect();
		String sql = "insert into history(patient_id,history,date) values(?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(patient_id));
		pstmt.setString(2, current_history);
		pstmt.setString(3, DateFormat.getDateInstance().format(new Date()));
		pstmt.executeUpdate();
		dbClose();
	}
}














