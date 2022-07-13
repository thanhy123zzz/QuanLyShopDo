package com.spring.beans;

public class Product {

	private int id;
	private String name;
	private String size;
	private Double price;
	private String status;
	private int amount;
	private int idType;
	
	public int getIDType() {
		return idType;
	}
	public void setIDType(int idType) {
		this.idType = idType;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
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
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Product() {
		super();
	}

	}