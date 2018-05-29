package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Product;
import com.model.Account;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		if(action == null)
		{
			//Simple thing, when user is coming to the site redirect him to the index page.
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		else
		{
			doPost(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		HttpSession session = request.getSession(); //Starting a session
		ArrayList<Product> list = new ArrayList<Product>();//Here we are making a list of the products to be added to the cart
		
		
		
		if(action.equals("loginpage"))
		{
			String status1=(String)session.getAttribute("status");
			if(status1!=null )	
			{  
				if(status1.equals("loggedin"))
				{	
					request.setAttribute("msg", "");
					request.getRequestDispatcher("userprofile.jsp").forward(request, response);
				}
			}
			else{
			//Redirect him to our login+signup page
			request.setAttribute("msg", "");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		
		if(action.equals("login"))
		{
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			int id=0 ;
			
			Account acc = new Account();
			Account acc1 =new Account();
			boolean status1=false;
			try{
				status1=acc.validateuser(email,password);
			}
			catch(Exception e)
			{ //If there is some problem while entering data in database
				request.setAttribute("msg", "There is some problem with your data. <br> Please Login again.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
			
			if(status1==true)//THis means that the person is a registered user and has a account with us.
			{
				
				try{
					id = acc1.getuserid(email,password);
				}
				catch(Exception e)
				{ //If there is some problem while entering data in database
					request.setAttribute("msg", "There is some problem with your data. <br> Please Login again.");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				
				}
				
				  if(id!=0)
					{ 	request.setAttribute("msg", "Welcome to our menu section. You are logged in");
						session.setAttribute("userid", id);
						session.setAttribute("status", "loggedin");
						request.getRequestDispatcher("userprofile.jsp").forward(request, response);
						return;
					}
				  else
				  {
					  request.setAttribute("msg", "There is some problem with your data. <br> Please Login again.");
						request.getRequestDispatcher("login.jsp").forward(request, response);
				  }
				
			}
			else //Not a registered user.
			{
				/*request.setAttribute("msg", "Invalid login. Please SignUp if you have not Registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;*/
				request.setAttribute("msg", "You are not Registered.<br>Please SignUp, It's Free");
				session.setAttribute("status", "invalidlogin");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
			
		}
		
		if(action.equals("signup"))
		{
			String name= request.getParameter("name");
			String address=request.getParameter("address");
			String phone =request.getParameter("phone");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			Account acc = new Account();
			boolean status2=false;			
			
			try{
				status2=acc.validateuser(email,password);
			}
			catch(Exception e)
				{ 
				request.setAttribute("msg", e.getMessage());
				request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			
		    if(status2==true)//This means that the user is already registered with us, so needs to login only
				{
				request.setAttribute("msg", "You are already registered.<br>Kindly Login");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				}
		    
		   else//This means that we have a new user. So insert his data in the database
		    {
		    	try
			    {
				//here we are trying to insert data into the database
				acc.insert(name,address,phone,email,password);
			    } 
			     catch (Exception e) 
			     {
				request.setAttribute("msg", e.getMessage());
				request.getRequestDispatcher("login.jsp").forward(request, response);
			    }
			
			     request.setAttribute("msg", "Registration Successfull <br> Please Login!");
			     request.getRequestDispatcher("login.jsp").forward(request, response);
			     return;
		    }
		}//end of if-signup
		
		
		
		if(action.equals("showmenu"))
		{
			request.getRequestDispatcher("menu.jsp").forward(request, response);
			return;
		}
		
		if(action.equals("showcart")){
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(action.equals("category"))
		{
			String cid=request.getParameter("catid");
			String id=request.getParameter("id");
			
			request.setAttribute("cid", cid);
			if(id ==null)
			{
				request.getRequestDispatcher("productdetail.jsp").forward(request, response);
				return;
			}
			if(id!=null)
			{
				 String pid=request.getParameter("id");
				request.setAttribute("pid", pid);
				request.getRequestDispatcher("productdetail2.jsp").forward(request, response);
				return;
			}
			
			
		}
		
		if(action.equals("reservation"))
		{
			Integer userid=(Integer)session.getAttribute("userid");
			String date = request.getParameter("date");
			String people = request.getParameter("people");
			String time = request.getParameter("time");
			String status1= (String) session.getAttribute("status");
			Account acc=new Account();
			
		if(status1!=null )	
		{  
			if(status1.equals("loggedin"))
			{	if(date!=null && people!=null && time!=null)
		   {	try{
			   acc.makereservation(userid,date,people,time);
				}
		   		catch(Exception e)
		   			{
		   			
				}
		   	request.setAttribute("date", date);
			request.setAttribute("people", people);
			request.setAttribute("time", time);
			
			request.getRequestDispatcher("reservation.jsp").forward(request, response);
			return;
		   }// end of data entering in database
			}//end of status1=loggedin
		}//end  of null checking
		else
			{
			
			request.setAttribute("msg", "Please Login in order to make a Reservation. <br>Or else Sign up. It's free.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
			}
		}//end of reservation
		
		
		if(action.equals("addtocart"))
		{
			String pid=request.getParameter("pid");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String image = request.getParameter("image");
			String cid = request.getParameter("catid");
			Product p = new Product();
			p.setId(Integer.parseInt(pid));
			p.setName(name);
			p.setPrice(price);
			p.setImage(image);
			list=p.addToCart(p);
			p=null;
			
			session.setAttribute("list", list);
			request.setAttribute("cid", cid);
			request.setAttribute("pid", pid);
			request.setAttribute("msg", "Product Added to Cart");
			request.setAttribute("name", name);
			request.getRequestDispatcher("productdetail2.jsp").forward(request, response);
			

		}//end of addtocart
		
		if(action.equals("addreview"))
		{
			Integer userid=(Integer)session.getAttribute("userid");
			String pid=(String)request.getParameter("pid");
			String review=request.getParameter("review");
			String rating=request.getParameter("rating");
			
			Account acc=new Account();
			try{
				acc.addreview(userid,pid,review,rating);
			}
			catch(Exception e)
			{
				request.setAttribute("msg", e.getMessage());
				request.getRequestDispatcher("test.jsp").forward(request, response);
				return;
			}
			request.setAttribute("msg", "Review added succesfully");
			request.getRequestDispatcher("test.jsp").forward(request, response);
			return;
		}
		
		
		
		
		
		
		if(action.equals("remove"))
		{
			String pid=request.getParameter("pid");
			Product p = new Product();
			try{
				list=p.remove(Integer.parseInt(pid));
			
			}
			catch(Exception e){
				
				e.printStackTrace();
			}
			p=null;
			
			session.setAttribute("list", list);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(action.equals("myprofile"))
		{
			String status1= (String) session.getAttribute("status");
			
			if(status1!=null )	
			{  
				if(status1.equals("loggedin"))
				{
					request.getRequestDispatcher("userprofile.jsp").forward(request, response);
					return;
				}
			}
			else
			{
			request.setAttribute("msg", "Please Login in order to see your Dashboard. <br>Or else Sign up. It's free.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
			}
			
		}
		
		
		if(action.equals("checkout"))
		{
			String status1=(String)session.getAttribute("status");
			if(status1!=null)
			{
				if(status1.equals("loggedin"))
				{
					
					Long orderid=  Calendar.getInstance().getTimeInMillis();
					Integer userid=(Integer)session.getAttribute("userid");  
					int count=0,i=0;
					
					
					ArrayList list1 = (ArrayList)session.getAttribute("list");
					Integer a[]=new Integer[100];
					for(Object o :list1)
					{
						Product p = (Product)o;
						a[i]= p.getId();
						i++;
					}
					
					Account acc=new Account();
					try{
					acc.checkout(orderid,userid,a);
					}
					catch(Exception e){
						e.getMessage();
						request.setAttribute("msg",e.getMessage() );
						request.setAttribute("orderid", orderid);
						request.getRequestDispatcher("checkout.jsp").forward(request, response);
						return;
					}
					request.setAttribute("msg","order placed" );
					request.setAttribute("orderid", orderid);
					request.getRequestDispatcher("checkout.jsp").forward(request, response);
					return;
				}
			}
			else
			{
				request.setAttribute("msg", "Please Login in order to place your order. <br>Or else Sign up. It's free.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
				
			}
		}//end of checkout		
		
		
		
		
		
		}

}
