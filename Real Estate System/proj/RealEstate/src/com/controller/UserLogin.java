package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Account;

public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null){
			request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session= request.getSession();
		if(action.equals("login")){
		
			request.getRequestDispatcher("login_jsps/login.jsp").forward(request, response);
		}
		if(action.equals("logout")){
			if(session != null){
			session.removeAttribute("user_id");
			session.invalidate();
			request.getRequestDispatcher("login_jsps/login.jsp").forward(request, response);
			}
		}
		if(action.equals("register")){
			
			request.getRequestDispatcher("login_jsps/register.jsp").forward(request, response);
		}
		if(action.equals("register-form")){
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			if(email.equals("") || password.equals("") || name.equals("")){
				request.setAttribute("msg", "All Fields Required..!");
				request.getRequestDispatcher("login_jsps/register.jsp").forward(request, response);
			}
			else{
			
			Account acc=new Account();
			String user_id=null;
			try{
			user_id=acc.register(email,name,password);
			if(user_id==null){
				request.setAttribute("msg", "This Email Id is already registered with us.");
				request.getRequestDispatcher("login_jsps/register.jsp").forward(request, response);
			}
			else{
				session.setAttribute("user_id", user_id);
				request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
			}
			}catch(Exception e){
				e.printStackTrace();
				request.setAttribute("msg", "Some Problem Occurred ! Please Try Again.");
				request.getRequestDispatcher("login_jsps/register.jsp").forward(request, response);
			}
			}
			
		}
		if(action.equals("login-form")){
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			if(email.equals("") || password.equals("") ){
				request.setAttribute("msg", "All Fields Required..!");
				request.getRequestDispatcher("login_jsps/login.jsp").forward(request, response);
			}
			else{
			Account acc= new Account();
			String user_id=null;
			try{
				user_id=acc.login(email,password);
				if(user_id==null){
					request.setAttribute("msg", "Invalid Login");
				request.getRequestDispatcher("login_jsps/login.jsp").forward(request, response);
				}
				else{
					session.setAttribute("user_id", user_id);
					request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
				}
			}catch(Exception e){
				request.setAttribute("msg", "Some Problem Occurred ! Login Again");
				request.getRequestDispatcher("login_jsps/login.jsp").forward(request, response);
			}
			}
			
		}
		
	}

}
