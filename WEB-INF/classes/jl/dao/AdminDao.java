package jl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBFactory.DBConnect;
import jl.pojo.Admin;

public class AdminDao {

public int checkUser(Admin ad) {
	int id=0;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from AdminRegister where email=(?) and password=(?)");
		ps.setString(1, ad.getEmail());
		ps.setString(2, ad.getPassword());
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			id=rs.getInt(1);
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return id;
}

}
