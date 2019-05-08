package com.hello.controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hello.connectDB.connectDB;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un = request.getParameter("username");
        String pw = request.getParameter("password");
        Connection conn = null;
		try {
			conn = connectDB.getMySQLConnection();
			PreparedStatement ps = conn.prepareStatement("select * from user where username=? and password=?");
			ps.setString(1, un);
			ps.setString(2, pw);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if(rs.getString("username").equals("admin")) {
					HttpSession session = request.getSession();	   
					session.setAttribute("username",rs.getString("username")); 
					session.setAttribute("name",rs.getString("fullname")); 
					response.sendRedirect("/Hello/admin");
					return;
				}else {
					HttpSession session = request.getSession();	    
			        session.setAttribute("userid",rs.getInt(1)); 
			        session.setAttribute("username",rs.getString("fullname")); 
					response.sendRedirect("/Hello");
					return;
				}
            }
			String mess = "Tài khoản hoặc mật khẩu không chính xác, vui lòng thử lại!";
			request.setAttribute("err", mess);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
			// close connection
			conn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
