package edu.neu.cs5200.msn.ds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import edu.neu.cs5200.msn.ds.model.Movie;
import edu.neu.cs5200.msn.ds.model.User;

public class UserDAO {

	DataSource ds;
	
	public UserDAO()
	{
	  try {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MovieSocialNetworkDB");
		System.out.println(ds);
	  } catch (NamingException e) {
		e.printStackTrace();
	  }
	}
	
	// create a user
	public User createUser(User user)
	{
		String sql = "insert into user values (null,?,?,?,?,?)";
		try {
			Connection connection = ds.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, user.getFirstName());
			statement.setString(2, user.getLastName());
			statement.setString(3, user.getUsername());
			statement.setString(4, user.getPassword());
			statement.setString(5, user.getEmail());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	// retrieve all users
	public List<User> findAllUsers()
	{
		List<User> movies = new ArrayList<User>();
		String sql = "select * from user";
		try {
			Connection connection = ds.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			while(results.next())
			{
				User user = new User();
				user.setId(results.getInt("id"));
				user.setFirstName(results.getString("firstName"));
				user.setLastName(results.getString("lastName"));
				user.setUsername(results.getString("username"));
				user.setPassword(results.getString("password"));
				user.setEmail(results.getString("email"));
				movies.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return movies;
	}
	// retrieve a user by id
	public User findUserById(int id)
	{
		User user = new User();
		
		String sql = "select * from user where id = ?";
		try {
			Connection connection = ds.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			if(result.next())
			{
				user.setId(result.getInt("id"));
				user.setEmail(result.getString("email"));
				user.setFirstName(result.getString("firstName"));
				user.setLastName(result.getString("lastName"));
				user.setUsername(result.getString("username"));
				user.setPassword(result.getString("password"));
			}
			
			sql = "select * from likes, movie where likes.userId = ? and movie.id=likes.movieId";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, user.getId());
			ResultSet results = statement.executeQuery();
			List<Movie> movies = new ArrayList<Movie>();
			while(results.next())
			{
				Movie movie = new Movie();
				movie.setId(results.getInt("id"));
				movie.setTitle(results.getString("title"));
				movie.setMovieId(results.getString("movieId"));
				movies.add(movie);
			}
			user.setLikes(movies);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return user;
	}
	// update a user by id
	public User updateUser(int id, User user)
	{
		String sql = "update user set firstName=?, lastName=?, username=?, password=?, email=? where id=?";
		try {
			Connection connection = ds.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, user.getFirstName());
			statement.setString(2, user.getLastName());
			statement.setString(3, user.getUsername());
			statement.setString(4, user.getPassword());
			statement.setString(5, user.getEmail());
			statement.setInt(6, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return user;
	}
	// delete a user by id
	public int deleteUser(int id)
	{
		String sql = "delete from user where id=?";
		try {
			Connection connection = ds.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			return statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
