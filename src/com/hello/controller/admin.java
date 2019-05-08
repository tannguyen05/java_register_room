package com.hello.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hello.connectDB.connectDB;
import com.hello.ojb.Register;
import com.hello.ojb.Room;

@WebServlet("/admin")
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			try {
				conn = connectDB.getMySQLConnection();
				int room = 1;
				if(request.getParameter("room") != null)
				{
					room = Integer.parseInt(request.getParameter("room"));
				}
				// get list register
				PreparedStatement ps = conn.prepareStatement(
						"select register.id, ca, thu, mon, lop, buoithaythe, fullname, user_id from register inner join user on register.user_id = user.id where room_id="+room);
				ResultSet rs = ps.executeQuery();
				Register[][] list = new Register[3][7];
				while (rs.next()) {
					int id1 = rs.getInt("id");
					int ca = rs.getInt("ca");
					int thu = rs.getInt("thu");
					String mon = rs.getString("mon");
					String lop = rs.getString("lop");
					String buoithaythe = rs.getString("buoithaythe");
					String name = rs.getString("fullname");
					int user_id = rs.getInt("user_id");
					Register r = new Register(id1, ca, thu, mon, lop, buoithaythe, name, user_id);
					list[ca - 1][thu - 1] = r;
				}
				
				// get list room
				PreparedStatement ps1 = conn.prepareStatement("select * from pratice_room");
				ResultSet rs1 = ps1.executeQuery();
				ArrayList<Room> listRoom = new ArrayList<Room>();

				while (rs1.next()) {
					int id_room = rs1.getInt("id");
					String room_name = rs1.getString("name");
					Room ro = new Room(id_room, room_name);
					listRoom.add(ro);
				}
				
				request.setAttribute("listRoom", listRoom);
				request.setAttribute("list", list);
				request.setAttribute("room", room);
				
				request.getRequestDispatcher("admin.jsp").forward(request, response);

				// Close all the connections
				conn.close();
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("login");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
