package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.beans.Location;
import com.beans.Property;
import com.model.Account;

public class Buyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action== null){
			request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equals("login")){
			request.getRequestDispatcher("login_jsps/login.jsp").forward(request, response);
		}
		if(action.equals("search")){
			String search_query = request.getParameter("search_query");
			if(search_query.equals("") || search_query.equals(" ") || search_query==null){
				request.setAttribute("msg", "Please Enter The Location");
				request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
			}
			else{
				ArrayList<Location> list = new ArrayList<Location>();
			Account acc = new Account();
			try {
				list = acc.searchLocation(search_query);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
		 }
		}
		if(action.equals("location")){
			String location = request.getParameter("loc");
			try {
			if(location.equals("") || location.equals(" ") || location==null){
				request.setAttribute("msg", "No Location Found, Please Enter The Location");
				request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
			}
			else{
				ArrayList<Property> list = new ArrayList<Property>();
			Account acc = new Account();
				list = acc.searchProperty(location);
			request.setAttribute("prop", list);
			request.getRequestDispatcher("buyer_jsps/index.jsp").forward(request, response);
			} 
			}catch (Exception e) {
				request.setAttribute("msg", "No Location Found, Please Enter The Location");
				request.getRequestDispatcher("main_jsps/index.jsp").forward(request, response);
			}
		 }
		}
	}

