<%@page import="com.kyu.bean.Note"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kyu.db.DBImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<a href='insertnote.jsp'>Create Note</a>&emsp;<a href='DeleteAllServlet'>Delete All</a>
	
	<%
			ArrayList<Note> list = new DBImpl().getAllNotes();
			if(!list.isEmpty()){
			%>
	<div class="table-responsive">
	<table class="table table-striped table-hover ">
		<thead>
			
			<tr>
			<th>Sno.</th>
			<th>Title</th>
			<th>Description</th>
			<th>Date Modified</th>
			<th>Edit</th>
			<th>Delete</th>
			</tr>
			<%}else{
					out.print("<br><h1>aise aise chutiya log palle pad gye hain kachu dalo hai nae aur dekhwe aa jatae</h1>");	
			}%>
		</thead>
		<tbody>
			
			<%
			int count=1;
			
			for(Note note:list){
			%>
			<tr>
			<td><%=count++ %></td>
			<td><%= note.getTitle() %></td>
			<td><%  String[] s =note.getNote().split("\n");
					for(String temp : s){
						out.print(temp+"<br>");
					}
			
			%></td>
			<td><%= note.getTs() %></td>
			<td><form action='edit.jsp'><input type='hidden' name='sno' value='<%= note.getSno()%>'>
	<input type='submit' value='Click' class="btn btn-success" >
	</form> </td>
	
			<td>
			<form action='DeleteServlet'><input type='hidden' name='sno' value='<%= note.getSno()%>'>
			<input type='submit' value='Delete' class="btn btn-danger" >
			</form>
			</tr>
				
			<%	
			}
			%>		
		</tbody>
	</table>
	</div>
	
	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>