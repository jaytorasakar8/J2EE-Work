package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.model.Account;

public class Seller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C://Users//Manoj//workspace//RealEstate//WebContent//propertyImg";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter();

		out.println("Hello");
    	String action = request.getParameter("action");
		if(action == null){
			request.getRequestDispatcher("seller_jsps/index.jsp").forward(request, response);
		}
		else if(action.equals("login")){
			request.getRequestDispatcher("login_jsps/login.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(ServletFileUpload.isMultipartContent(request)){
			Account acc=new Account();
		}
			for (FileItem item : formItems) {
			    // processes only fields that are not form fields
			    if (!item.isFormField()) {
			        String fileName = ;
			        
			        String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
			        File storeFile = new File(UPLOAD_DIRECTORY);
			        // saves the file on disk
			        item.write(storeFile);
			    } else {
			        //here...
			        String fieldname = item.getFieldName();
			        String fieldvalue = item.getString();
			        if (fieldname.equals("p_data")) {
			            //logic goes here...
			        } else if (fieldname.equals("upload_wall_gallery")) {
			            //next logic goes here...
			        }
			    }
        }
	else if(action.equals("sell")){
		String location=request.getParameter("location");
		String area=request.getParameter("area");
		String price=request.getParameter("price");
		String seller_name=request.getParameter("seller_name");
		String contact=request.getParameter("contact_no");
		String desc=request.getParameter("desc");
		String user_id=request.getParameter("user_id");
		/*System.out.println("Location :"+location );
		System.out.println("Area :"+area );
		System.out.println("Price :"+price );
		System.out.println("seller :"+seller_name );
		System.out.println("Contact :"+contact );
		System.out.println("Desc :"+desc );
		System.out.println("user_id :"+user_id );
		*/Account acc= new Account();
		String name = null;
		try{
		name = acc.sellProperty(location,area,price,seller_name,contact,desc,user_id);
		}
		catch(Exception e){
			request.setAttribute("msg", "Exception");
			request.getRequestDispatcher("seller_jsps/index.jsp").forward(request, response);
		}
		request.setAttribute("imgName", name);
		request.getRequestDispatcher("seller_jsps/upload.jsp").forward(request, response);
	}
        
     
    }


}
