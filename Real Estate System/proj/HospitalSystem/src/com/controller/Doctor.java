package com.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Doc;
import com.beans.Patient;
import com.model.Account;


public class Doctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action== null){
			request.getRequestDispatcher("doctor_jsps/login.jsp").forward(request, response);
		}
		else{ 
			doPost(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session=request.getSession();
		if(action.equals("dologin")){
			String username = request.getParameter("username");
			String password=request.getParameter("password");
			Doc d = new Doc();
			boolean status = d.doLogin(username, password);
			if(status == true){
				
				//String id = doc.getId(username);
				session.setAttribute("doctor_id", 1);
				request.getRequestDispatcher("doctor_jsps/index.jsp").forward(request, response);
				
			}
		}
		
		if(action.equals("today_appt")){
			Account account = new Account();
			ArrayList<Patient> list = new ArrayList<Patient>();
			try {
				String id =request.getParameter("id");
				list = account.fetchAppointment(Integer.parseInt(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.setAttribute("flag", 100);
			request.getRequestDispatcher("doctor_jsps/today_appt.jsp").forward(request, response);
		}
		if(action.equals("view_history")){
			String id=request.getParameter("id");//2
			request.setAttribute("pid", id);//2
			request.getRequestDispatcher("doctor_jsps/view_history.jsp").forward(request, response);
			}
		if(action.equals("current_history")){
			String current_history = request.getParameter("current_history");
			String patient_id = request.getParameter("patient_id");
			
			Account a = new Account();
			try {
				
				a.insertHistory(patient_id,current_history);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("id", patient_id);
			request.setAttribute("msg", "History added Successfully");
			
			request.getRequestDispatcher("doctor_jsps/view_history.jsp").forward(request, response);
			
			
		}
		if(action.equals("book_doctor_appt")){
			String pid=request.getParameter("pid");
			String did=request.getParameter("did");
			String date=request.getParameter("date");
			String slot=request.getParameter("slot");
			Account account=new Account();
			
			try {
				System.out.println(date);
				Date ip = new SimpleDateFormat("yyyy-MM-dd").parse(date); // for formatting input
				String op = DateFormat.getDateInstance().format(ip); // for formatting output
				account.insertAppt(Integer.parseInt(pid),did,op,slot);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("doctor_id", did);
			request.setAttribute("pid", pid);
request.setAttribute("msg", "Appointment Confirmed");
			
			request.getRequestDispatcher("doctor_jsps/view_history.jsp").forward(request, response);
			
			
			
		}
	}

}











