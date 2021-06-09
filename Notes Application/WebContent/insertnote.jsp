<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/editpage.css">
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<div class="mainDiv">
<form action="InsertNoteServlet">
	<input class="input_title" type='text' name='title' placeholder="Enter Title ..."><br>
	<hr>
	<textarea class="input_note" name='note' rows="30" cols="70" placeholder="Write here........"></textarea><br>
	<p align="right" style="padding:unset;"><input class="submit_button" type="submit" value=""></p>
</form>
</div>
</body>
</html>