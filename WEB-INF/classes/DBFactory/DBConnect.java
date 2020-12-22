package DBFactory;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
static Connection cn;
public static Connection getConnection() {
	try {
		/*Class.forName("oracle.jdbc.driver.OracleDriver");
		cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");*/
		Class.forName("com.mysql.cj.jdbc.Driver");
		cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/JobLocator","root","12345");
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return cn;
}
}
