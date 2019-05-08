package com.hello.connectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectDB {
	// Kết nối vào MySQL.
	public static Connection getMySQLConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test01?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root", "");
		return conn;
	}
}
