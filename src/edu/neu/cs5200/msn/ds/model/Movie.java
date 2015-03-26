package edu.neu.cs5200.msn.ds.model;

import java.util.List;

public class Movie {
	private int id;
	private String title;
	private String poster;
	private String movieId;
	
	private List<User> likes;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	
	public List<User> getLikes()
	{
		return this.likes;
	}
	
	public void setLikes(List<User> likes)
	{
		this.likes = likes;
	}
	
	public Movie() {
		super();
	}
	public Movie(int id, String title, String poster, String movieId) {
		super();
		this.id = id;
		this.title = title;
		this.poster = poster;
		this.movieId = movieId;
	}
}
