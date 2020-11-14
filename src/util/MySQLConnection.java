package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Stack;

public class MySQLConnection {

	private static String classForName;
	private static String url;
	private static String username;
	private static String password;
	private static Stack<Connection> connPools;

	static {
		connPools = new Stack<Connection>();

		classForName = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://127.0.0.1:3306/ltm?useUnicode=yes&characterEncoding=UTF-8";
		username = "root";
		password = "admin";

		try {
			Class.forName(classForName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection connect() throws SQLException {
		Connection conn = null;
		if (connPools.empty()) {
			conn = DriverManager.getConnection(url, username, password);
		} else {
			conn = connPools.pop();
		}
		return conn;
	}

}