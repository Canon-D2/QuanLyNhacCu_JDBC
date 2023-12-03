package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/quanlynhaccu";
		String user = "root";
		String password = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception er) {
			er.printStackTrace();
		}
		return con;
	}
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnection());
        } catch (Exception e) {

        }
    }
}