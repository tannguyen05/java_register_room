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

import com.hello.connectDB.connectDB;

@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Fix lỗi tiếng việt
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String fullname = request.getParameter("fullname");
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		Connection conn = null;
		try {
			conn = connectDB.getMySQLConnection();
			
			PreparedStatement ps = conn.prepareStatement("select * from user where username=?");
			ps.setString(1, un);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String mess = "Tên đăng nhập đã tồn tại, vui lòng thử lại!";
				request.setAttribute("err", mess);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
				return;
			}
			PreparedStatement ps1 = conn.prepareStatement("INSERT INTO user VALUES (NULL, ?, ?, ?)");
			ps1.setString(1, un);
			ps1.setString(2, pw);
			ps1.setString(3, fullname);
			int rs1 = ps1.executeUpdate();
			while (rs1 > 0) {
				String mess = "Đăng kí thành công!";
				request.setAttribute("mess", mess);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
			String mess = "Đăng kí thất bại, vui lòng thử lại!";
			request.setAttribute("err", mess);
			request.getRequestDispatcher("signup.jsp").forward(request, response);
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
