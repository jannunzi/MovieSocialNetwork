package edu.neu.cs5200.msn.ds.model;

import java.util.List;

public class User {
	private int id;
	private String firstName;
	private String lastName;
	private String username;
	private String password;
	private String email;
	
	private List<Movie> likes;
	
	public List<Movie> getLikes()
	{
		return this.likes;
	}
	
	public void setLikes(List<Movie> likes)
	{
		this.likes = likes;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User(int id, String firstName, String lastName, String username,
			String password, String email) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.email = email;
	}
	public User() {
		super();
	}
	
}
