package com.kyu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyu.bean.Note;
import com.kyu.db.DBImpl;


public class InsertNoteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String title = request.getParameter("title");
		String note = request.getParameter("note");	
//		out.print("Title:-"+title+"<br>Content:<br>");
//		String[] temp = note.split("\n");
//		for (String string : temp) {
//			out.print(string+"<br>");
//		}
		Note noteObj = new Note(title,note);
		boolean b = new DBImpl().insertNotes(noteObj);
		if (b) {
			System.out.println("Note Inserted");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			out.println("Note Inserted<br>");
			rd.include(request, response);
		}else {
			System.out.println("Note not Inserted");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			out.println("Note not Inserted.........<br>");
			rd.include(request, response);
		}
			
	}

}
