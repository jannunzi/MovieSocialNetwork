<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.msn.ds.dao.*,edu.neu.cs5200.msn.ds.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
    <h1>Movies</h1>
    
    <%
    MovieDAO movieDAO = new MovieDAO();
    
    String action = request.getParameter("action");
    String id = request.getParameter("id");
    String title  = request.getParameter("title");
    String poster = request.getParameter("poster");
    String movieId = request.getParameter("movieId");
    
    if("create".equals(action))
    {
        Movie movie = new Movie();
        movie.setTitle(title);
        movie.setPoster(poster);
        movie.setMovieId(movieId);
        movieDAO.create(movie);
    }
    else if("delete".equals(action))
    {
        int idInt = Integer.parseInt(id);
        movieDAO.deleteMovie(idInt);   
    }
    else if("update".equals(action))
    {
        int idInt = Integer.parseInt(id);
        Movie movie = new Movie();
        movie.setTitle(title);
        movie.setPoster(poster);
        movie.setMovieId(movieId);
        movieDAO.updateMovie(idInt, movie);
    }
    
    
    List<Movie> movies = movieDAO.findAllMovies();
    %>
    
    <form action="movies.jsp">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Poster</th>
                <th>Movie ID</th>
            </tr>
            <tr>
                <th><input class="form-control" name="id" value="<%=id%>" readonly/></th>
                <th><input class="form-control" name="title" placeholder="Title" value="<%=title%>"/></th>
                <th><input class="form-control" name="poster" placeholder="Poster URL" value="<%=poster%>"/></th>
                <th><input class="form-control" name="movieId" placeholder="Movie ID" value="<%=movieId%>"/></th>
                <th>
                    <button class="btn btn-success" name="action" value="create">Add</button>
                    <button class="btn btn-primary" name="action" value="update">Update</button>
                </th>
            </tr>
        </thead>
        <tbody>
    <%
    for(Movie movie : movies)
    {
        %>
            <tr>
                <td><%=movie.getId() %></td>
                <td><a href="movieDetails.jsp?id=<%=movie.getId()%>"><%=movie.getTitle() %></a></td>
                <td><%=movie.getPoster() %></td>
                <td><%=movie.getMovieId() %></td>
                <td>
                    <a class="btn btn-danger" href="movies.jsp?action=delete&id=<%=movie.getId() %>">Delete</a>
                    <a class="btn btn-warning" href="movies.jsp?action=select&id=<%=movie.getId() %>&title=<%=movie.getTitle()%>&poster=<%=movie.getPoster()%>&movieId=<%=movie.getMovieId()%>">Select</a>
                </td>
            </tr>
        <%
    }
    %>
        </tbody>
    </table>
    </form>
    </div>
</body>
</html>