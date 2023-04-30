<%@page import="ua.foxminded.dynamicweb.DatabaseFacade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
	<h1>List of books</h1>
	
	<%
	for(String name : DatabaseFacade.getBooks()){
		out.print(name + "<br/>");
	}		
	%>
	
	
	<h2>Add a book</h2>
	<form method="POST">
		<label for="id">ID:</label>
		<input type="number" name="id" id="id"><br>
		<label for="name">Name:</label>
		<input type="text" name="name" id="name"><br>
		<input type="submit" value="Add Book">
	</form>
	
	<%
	if(request.getMethod().equals("POST")) {
		int id = 0;
		String name = null;
		String idParm = request.getParameter("id");
		String nameParm = request.getParameter("name");
		  if(idParm != null && !idParm.isEmpty()) { 
			id = Integer.parseInt(idParm);
		}
		  if(nameParm != null && !nameParm.isEmpty()){
			  name = nameParm;
		  }
		DatabaseFacade.addBooks(id, name);
	}
	%>
	
	<h3>Delete a book</h3>
	<form method="POST">
		<label for="deleteName">Name:</label>
		<input type="text" name="deleteName" id="deleteName"><br>
		<input type="submit" value="Delete book">
	</form>
	<%
	if (request.getMethod().equals("POST")){
		String deleteName = request.getParameter("deleteName");
		DatabaseFacade.deleteBook(deleteName);
	}
	
	%>
	
	
	
	
</body>
</html>