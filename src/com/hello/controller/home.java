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
import com.hello.ojb.CurrentUser;
import com.hello.ojb.Register;
import com.hello.ojb.Room;

/**
 * Servlet implementation class home
 */
@WebServlet("")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("userid") != null) {
			try {
				conn = connectDB.getMySQLConnection();
				int id = (int) session.getAttribute("userid");

				// get current user
				PreparedStatement ps = conn.prepareStatement("select id, fullname from user where id=" + id);
				ResultSet rs = ps.executeQuery();
				CurrentUser user = new CurrentUser();
				while (rs.next()) {
					user.setId(rs.getInt("id"));
					user.setFullname(rs.getString("fullname"));
				}

				// get list register
				PreparedStatement ps1 = conn.prepareStatement(
						"select register.id, ca, thu, mon, lop, buoithaythe, fullname, user_id from register inner join user on register.user_id = user.id where room_id=1 ");
				ResultSet rs1 = ps1.executeQuery();
				Register[][] list = new Register[3][7];
				while (rs1.next()) {
					int id1 = rs1.getInt("id");
					int ca = rs1.getInt("ca");
					int thu = rs1.getInt("thu");
					String mon = rs1.getString("mon");
					String lop = rs1.getString("lop");
					String buoithaythe = rs1.getString("buoithaythe");
					String name = rs1.getString("fullname");
					int user_id = rs1.getInt("user_id");
					Register r = new Register(id1, ca, thu, mon, lop, buoithaythe, name, user_id);
					list[ca - 1][thu - 1] = r;
				}

				// get list room
				PreparedStatement ps2 = conn.prepareStatement("select * from pratice_room");
				ResultSet rs2 = ps2.executeQuery();
				ArrayList<Room> listRoom = new ArrayList<Room>();

				while (rs2.next()) {
					int id_room = rs2.getInt("id");
					String room_name = rs2.getString("name");
					Room ro = new Room(id_room, room_name);
					listRoom.add(ro);
				}

				request.setAttribute("listRoom", listRoom);
				request.setAttribute("list", list);
				request.setAttribute("name", user.getFullname());
				request.setAttribute("current_user_id", id);
				request.setAttribute("room", 1);

				request.getRequestDispatcher("room.jsp").forward(request, response);

				// Close all the connections
				conn.close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//Fix lỗi tiếng việt
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        
		// get data form
		int ca = Integer.parseInt(request.getParameter("ca"));
		int thu = Integer.parseInt(request.getParameter("thu"));
		String mon = request.getParameter("monhoc");
		String lop = request.getParameter("lophoc");
		String buoithaythe = request.getParameter("buoithaythe");
		int room = Integer.parseInt(request.getParameter("room"));

		Connection conn = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("userid") != null) {
			try {
				int id = (int) session.getAttribute("userid");
				conn = connectDB.getMySQLConnection();
				String sql = "INSERT INTO register VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, ca);
				ps.setInt(2, thu);
				ps.setString(3, mon);
				ps.setString(4, lop);
				ps.setString(5, buoithaythe);
				ps.setInt(6, id);
				ps.setInt(7, room);
				int rs = ps.executeUpdate();
				if (rs > 0) {
					response.sendRedirect("register-room?room=" + room);
				}

				// close connection
				conn.close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("login");
		}
	}

}
