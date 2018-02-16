package com.beans;

public class Doc {
		public boolean doLogin(String username,String password) {
			//DB Code to check weather username & password exist in DB
			if(username.equals("smith") && password.equals("123"))
				return true;
			return false;
		}
	}


