package com.uniquedeveloper.Model;

public class BookItem {
	
	public int Id;
	public String Title;
	public String Author;
	public String Description;
	public int Price;
	public String ImageUrl;
	
    public BookItem(int id, String title, String author, String description, int price, String imageUrl) {
    	this.Id = id;
    	this.Title = title;
    	this.Author = author;
    	this.Description = description;
    	this.Price = price;
    	this.ImageUrl = imageUrl;
    }
}
