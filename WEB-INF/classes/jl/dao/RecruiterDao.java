package jl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBFactory.DBConnect;
import jl.pojo.Recruiter;

public class RecruiterDao {

public Recruiter checkUser(Recruiter rt) {
	Recruiter rec=new Recruiter();
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from RecruiterRegister where email=(?) and password=(?)");
		ps.setString(1, rt.getEmail());
		ps.setString(2, rt.getPassword());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			rec.setId(rs.getInt(1));
			rec.setName(rs.getString(2));
		}
		else
			rec=null;
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return rec;
}

public boolean createUser(Recruiter rt) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("insert into RecruiterRegister values(?,?,?,?)");
		ps.setInt(1, 0);
		ps.setString(2, rt.getName());
		ps.setString(3, rt.getEmail());
		ps.setString(4, rt.getPassword());
		int i=ps.executeUpdate();
		if(i!=0)
			status=true;
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return status;
}

public boolean checkId(int id) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from recruiterdetails where id=(?)");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			status=true;
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return status;
}

public boolean createRecruiter(Recruiter rec) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select name,email from recruiterregister where id=(?)");
		int id=rec.getId();
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			
			String name=rs.getString(1);
			String email=rs.getString(2);
			ps=con.prepareStatement("insert into recruiterdetails values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, rec.getHeadoffice());
			ps.setString(4, rec.getDescription());
			ps.setString(5, email);
			ps.setLong(6, rec.getCno());
			ps.setString(7, rec.getLastrecruitment());
			ps.setString(8, rec.getBranches());
			int i=ps.executeUpdate();
			if(i>0)
				status=true;
		}
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return status;
}

public Recruiter getRecruiterDetails(int id) {
	Recruiter rec=new Recruiter();
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from recruiterdetails where id=(?)");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			rec.setName(rs.getString(2));
			rec.setHeadoffice(rs.getString(3));
			rec.setDescription(rs.getString(4));
			rec.setEmail(rs.getString(5));
			rec.setCno(rs.getLong(6));
			rec.setLastrecruitment(rs.getString(7));
			rec.setBranches(rs.getString(8));
		}
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return rec;
}

public ArrayList<Recruiter> getRecruiterList(){
	ArrayList<Recruiter> al=new ArrayList<Recruiter>();
	Connection con=DBConnect.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select * from recruiterdetails");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			Recruiter rec=new Recruiter();
			rec.setId(rs.getInt(1));
			rec.setHeadoffice(rs.getString(3));
			rec.setName(rs.getString(2));
			rec.setCno(rs.getLong(6));
			rec.setEmail(rs.getString(5));
			
			al.add(rec);
		}
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return al;
}

public boolean updateRecruiter(Recruiter rec, int id) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
			PreparedStatement ps=con.prepareStatement("update recruiterdetails set headoffice=(?),description=(?),cno=(?),lastrecruitment=(?),branches=(?) where id=(?)");
			ps.setInt(6, id);
			ps.setString(1, rec.getHeadoffice());
			ps.setString(2, rec.getDescription());
			ps.setLong(3, rec.getCno());
			ps.setString(4, rec.getLastrecruitment());
			ps.setString(5, rec.getBranches());
			int i=ps.executeUpdate();
			if(i>0)
				status=true;
			ps.close();
			con.close();	
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return status;
}

public boolean checkPassward(int id, String password) {
	boolean status=false;
	Connection con=DBConnect.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select * from recruiterregister where id=(?) and password=(?)");
		ps.setInt(1, id);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			status=true;
		}
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return status;
}

public boolean updatePassword(int id, String newpassword) {
	boolean status=false;
	Connection con=DBConnect.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("update recruiterregister set password=(?) where id=(?)");
		ps.setString(1, newpassword);
		ps.setInt(2, id);
		int i=ps.executeUpdate();
		if(i>0)
			status=true;
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return status;
}

public boolean DeleteAccount(int rid) {
	boolean status=false;
	Connection con=DBConnect.getConnection();
	PreparedStatement ps;
	ResultSet rs;
	try {
		con.setAutoCommit(false);
		ps=con.prepareStatement("select * from recruiterregister where id=(?)");
		ps.setInt(1, rid);
		rs=ps.executeQuery();
		if(rs.next()) {
			ps=con.prepareStatement("delete from recruiterregister where id=(?)");
			ps.setInt(1, rid);
			ps.executeUpdate();
		}
		
		ps=con.prepareStatement("select * from recruiterdetails where id=(?)");
		ps.setInt(1, rid);
		rs=ps.executeQuery();
		if(rs.next()) {
			ps=con.prepareStatement("delete from recruiterdetails where id=(?)");
			ps.setInt(1, rid);
			ps.executeUpdate();
		}
		
		ps=con.prepareStatement("select * from jobdetails where r_id=(?)");
		ps.setInt(1, rid);
		rs=ps.executeQuery();
		if(rs.next()) {
			ps=con.prepareStatement("delete from jobdetails where r_id=(?)");
			ps.setInt(1, rid);
			ps.executeUpdate();
		}
		
		ps=con.prepareStatement("select * from appliedjobs where rid=(?)");
		ps.setInt(1, rid);
		rs=ps.executeQuery();
		if(rs.next()) {
			ps=con.prepareStatement("delete from appliedjobs where rid=(?)");
			ps.setInt(1, rid);
			ps.executeUpdate();
		}
		
		ps=con.prepareStatement("select * from savedjobs where rid=(?)");
		ps.setInt(1, rid);
		rs=ps.executeQuery();
		if(rs.next()) {
			ps=con.prepareStatement("delete from savedjobs where rid=(?)");
			ps.setInt(1, rid);
			ps.executeUpdate();
		}
		status=true;
		con.commit();
		rs.close();
		ps.close();
	}
	catch(Exception ee) {
		try {
			con.rollback();
			ee.printStackTrace();
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	}
	return status;
}

}
