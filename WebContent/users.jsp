<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.msn.ds.dao.*,edu.neu.cs5200.msn.ds.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
    <h1>Users</h1>
    
    <%
    UserDAO userDAO = new UserDAO();
    
    String action = request.getParameter("action");
    String id = request.getParameter("id");
    String firstName  = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    
    if("create".equals(action))
    {
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        userDAO.createUser(user);
    }
    else if("delete".equals(action))
    {
        int idInt = Integer.parseInt(id);
        userDAO.deleteUser(idInt);   
    }
    else if("update".equals(action))
    {
        int idInt = Integer.parseInt(id);
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        userDAO.updateUser(idInt, user);
    }
    
    
    List<User> users = userDAO.findAllUsers();
    %>
    
    <form action="users.jsp">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
            <tr>
                <th><input class="form-control" name="id" value="<%=id%>" readonly/></th>
                <th><input class="form-control" name="firstName" placeholder="First Name" value="<%=firstName%>"/></th>
                <th><input class="form-control" name="lastName" placeholder="Last Name" value="<%=lastName%>"/></th>
                <th>
                    <button class="btn btn-success" name="action" value="create">Add</button>
                    <button class="btn btn-primary" name="action" value="update">Update</button>
                </th>
            </tr>
        </thead>
        <tbody>
    <%
    for(User user : users)
    {
        %>
            <tr>
                <td><%=user.getId() %></td>
                <td><a href="userDetails.jsp?id=<%=user.getId()%>"><%=user.getFirstName() %></a></td>
                <td><%=user.getLastName() %></td>
                <td>
                    <a class="btn btn-danger" href="users.jsp?action=delete&id=<%=user.getId() %>">Delete</a>
                    <a class="btn btn-warning" href="users.jsp?action=select&id=<%=user.getId() %>&firstName=<%=user.getFirstName()%>&lastName=<%=user.getLastName()%>">Select</a>
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