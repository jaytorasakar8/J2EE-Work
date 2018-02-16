package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Product;
import com.model.Account;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action == null){
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		ArrayList<Product> list = new ArrayList<Product>();
		if(action.equals("category")){
			String cat_id=request.getParameter("cat_id");
			Account account = new Account();
			try {
				list = account.getProduct(Integer.parseInt(cat_id));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("list", list);
			request.setAttribute("cat_id", cat_id);
			request.getRequestDispatcher("product.jsp").forward(request, response);

			
			
		}
		
		if(action.equals("")){
			
		}

		if(action.equals("")){
	
		}

		if(action.equals("")){
	
		}

		if(action.equals("")){
	
		}
	}

}
