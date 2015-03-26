<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.msn.ds.dao.*,edu.neu.cs5200.msn.ds.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Hello World</h1>
    
    <%
    MovieDAO movieDAO = new MovieDAO();
    
/*     Movie movie = new Movie();
    movie.setTitle("Terminator");
    movie.setPoster("I'll be back");
    movie.setMovieId("432");
    
    movieDAO.create(movie);
 */
    List<Movie> movies = movieDAO.findAllMovies();
    
    for(Movie movie : movies)
    {
        out.println(movie.getTitle());
    }
    
    Movie movie = movieDAO.findById(1);
    out.println(movie.getTitle());
    
    movie.setTitle("Avatar 3");
    movieDAO.updateMovie(1, movie);
    
    movie = movieDAO.findById(1);
    out.println(movie.getTitle());
    
    movieDAO.deleteMovie(2);
    %>
</body>
</html>