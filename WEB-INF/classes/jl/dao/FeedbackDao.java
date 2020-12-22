package jl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBFactory.DBConnect;
import jl.pojo.Feedback;

public class FeedbackDao {

	public boolean insertFeedback(Feedback fdb) {
		boolean status=false;
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("insert into feedback values(?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, fdb.getName());
			ps.setString(3, fdb.getEmail());
			ps.setLong(4, fdb.getCno());
			ps.setString(5, fdb.getFeedback());
			int i=ps.executeUpdate();
			if(i>0) {
				status=true;
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return status;
	}

	public ArrayList<Feedback> getFeedbacks() {
		ArrayList<Feedback> al=new ArrayList<Feedback>();
		Connection con=DBConnect.getConnection();
		try{
			PreparedStatement ps=con.prepareStatement("select * from feedback");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Feedback fb=new Feedback();
				fb.setName(rs.getString(2));
				fb.setEmail(rs.getString(3));
				fb.setCno(rs.getLong(4));
				fb.setFeedback(rs.getString(5));
				al.add(fb);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();;
		}
		return al;
	}
	
}
