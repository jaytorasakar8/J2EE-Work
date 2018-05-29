package com.beans;

import java.util.ArrayList;

public class Product
{
	private int id;
	private String name;
	private String price;
	private String short_desc;
	private String desc;
	private String image;
	
	static ArrayList<Product> list = new ArrayList<Product>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getShort_desc() {
		return short_desc;
	}

	public void setShort_desc(String short_desc) {
		this.short_desc = short_desc;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ArrayList<Product> addToCart(Product p)
	{
		list.add(p);
		return list;
	}
	
	public ArrayList<Product> remove(int id)
	{
		
		for(Product p:list){
			if(p.getId() == id){
				list.remove(p);
				break;
			}
		}
		return list;
	}
}
