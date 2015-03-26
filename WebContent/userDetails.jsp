<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.msn.ds.dao.*,edu.neu.cs5200.msn.ds.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <h1>Profile Page</h1>
        
        <%
        UserDAO userDAO = new UserDAO();
        
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        
        User user = userDAO.findUserById(id);
        %>
        
        First Name: <%=user.getFirstName() %>
        Last Name: <%=user.getLastName() %>
        
        <ul>
        <%
        for(Movie movie : user.getLikes())
        {
        %> <li><%= movie.getTitle() %></li>
        <%}
        %>
        
        </ul>
    </div>
</body>
</html>