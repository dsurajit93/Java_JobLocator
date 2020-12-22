package jl.dao;

import jl.pojo.Applicant;
import java.sql.*;
import java.util.ArrayList;

import DBFactory.DBConnect;

public class ApplicantDao {

public Applicant checkUser(Applicant ap) {
	Applicant app=new Applicant();
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from ApplicantRegister where email=(?) and password=(?)");
		ps.setString(1, ap.getEmail());
		ps.setString(2, ap.getPassword());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			app.setId(rs.getInt(1));
			app.setName(rs.getString(2));
			ps=con.prepareStatement("select imageName from filepath where id=(?)");
			ps.setInt(1, rs.getInt(1));
			rs=ps.executeQuery();
			if(rs.next()) {
				app.setImageName(rs.getString(1));
			}
		}
		else
			app=null;
		
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return app;
}

public boolean createUser(Applicant ap) {
	boolean status=false;
	Connection con=null;
	try {
		con=DBConnect.getConnection();
		con.setAutoCommit(false);
		PreparedStatement ps=con.prepareStatement("insert into ApplicantRegister values(?,?,?,?)");
		ps.setInt(1, 0);
		ps.setString(2, ap.getName());
		ps.setString(3, ap.getEmail());
		ps.setString(4, ap.getPassword());
		int i=ps.executeUpdate();
		if(i!=0) {
			status=true;
		}
		con.commit();
		ps.close();
		con.close();
	}
	catch(Exception ee) {
		try {
			ee.printStackTrace();
			con.rollback();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	return status;
}
public boolean checkId(int id) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from ApplicantPersonalDetails where id=(?)");
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

public boolean createApplicant(Applicant ap) {
	boolean status=false;
	Connection con=null;
	try {
		con=DBConnect.getConnection();
		con.setAutoCommit(false);
		PreparedStatement ps=con.prepareStatement("select name,email from applicantregister where id=(?)");
		int id=ap.getId();
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			
			String name=rs.getString(1);
			String email=rs.getString(2);
			ps=con.prepareStatement("insert into applicantpersonaldetails values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, ap.getFname());
			ps.setDate(4, ap.getDob());
			ps.setString(5, ap.getAddress());
			ps.setLong(6, ap.getMob());
			ps.setString(7, email);
			ps.setString(8, ap.getObjective());
			ps.setString(9, ap.getSkill());
			int i=ps.executeUpdate();
			
			ps=con.prepareStatement("insert into applicantacademicdetails values(?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2,ap.getDiploma());
			ps.setString(3, ap.getBachelor());
			ps.setString(4, ap.getMaster());
			ps.setString(5, ap.getPhd());
			ps.setString(6, ap.getQualification());
			int j=ps.executeUpdate();
			
			ps=con.prepareStatement("insert into filepath values(?,?,?)");
			ps.setInt(1,id);
			ps.setString(2, null);
			ps.setString(3, null);
			int k=ps.executeUpdate();
			
			if(i>0 && j>0 && k>0) {
				status=true;
			}
			con.commit();
			ps.close();
			con.close();
		}
	}
	catch(Exception ee) {
		try {
			ee.printStackTrace();
			con.rollback();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	return status;
}

public boolean createJobProfile(Applicant ap) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("insert into applicantjobdetails values(?,?)");
		ps.setInt(1, ap.getId());
		ps.setString(2, ap.getJobdetails());
		int i=ps.executeUpdate();
		if(i>0) {
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

public Applicant getApplicantPersonalDetails(int id) {
	Applicant ap=new Applicant();
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from applicantpersonaldetails where id=(?)");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			ap.setName(rs.getString(2));
			ap.setFname(rs.getString(3));
			ap.setDob(rs.getDate(4));
			ap.setAddress(rs.getString(5));
			ap.setMob(rs.getLong(6));
			ap.setEmail(rs.getString(7));
			ap.setObjective(rs.getString(8));
			ap.setSkill(rs.getString(9));
		}
		ps.close();
		con.close();
	}catch(Exception ee) {
		ee.printStackTrace();
	}
	return ap;
}

public Applicant getApplicantAcademicDetails(int id) {
	Applicant ap=new Applicant();
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from applicantacademicdetails where id=(?)");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			ap.setDiploma(rs.getString(2));
			ap.setBachelor(rs.getString(3));
			ap.setMaster(rs.getString(4));
			ap.setPhd(rs.getString(5));
			ap.setQualification(rs.getString(6));
		}
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return ap;
}

public Applicant getApplicantJobDetails(int id) {
	Applicant ap=new Applicant();
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from applicantjobdetails where id=(?)");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			ap.setJobdetails(rs.getString(2));
		}
		else 
			ap=null;
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return ap;
}

public Applicant getApplicantFileDetails(int id) {
	Applicant ap=new Applicant();
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("select imageName,resumeName from filepath where id=(?)");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			ap.setImageName(rs.getString(1));
			ap.setResumeName(rs.getString(2));
		}
		else 
			ap=null;
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return ap;
}


public boolean updateImage(int id,String imageName) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("UPDATE filepath SET imageName=(?) WHERE id=(?)");
		ps.setString(1, imageName);
		ps.setInt(2, id);
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

public boolean updateResume(int id, String fileName) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("UPDATE filepath SET resumeName=(?) WHERE id=(?)");
		ps.setString(1, fileName);
		ps.setInt(2, id);
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


public ArrayList<Applicant> getApplicantList(){
	ArrayList<Applicant> al=new ArrayList<Applicant>();
	Connection con=DBConnect.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select * from applicantpersonaldetails");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			Applicant app=new Applicant();
			app.setId(rs.getInt(1));
			app.setName(rs.getString(2));
			app.setAddress(rs.getString(5));
			app.setMob(rs.getLong(6));
			app.setEmail(rs.getString(7));
			
			al.add(app);
		}
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return al;
}

public int updatePersonalDetails(int id,Applicant app) {
	int i=0;
	Connection con=DBConnect.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("update applicantpersonaldetails set name=(?),f_name=(?),dob=(?),address=(?),mob=(?),email=(?),objective=(?),keyskill=(?) where id=(?)");
		ps.setString(1, app.getName());
		ps.setString(2, app.getFname());
		ps.setDate(3, app.getDob());
		ps.setString(4, app.getAddress());
		ps.setLong(5, app.getMob());
		ps.setString(6,app.getEmail());
		ps.setString(7, app.getObjective());
		ps.setString(8, app.getSkill());
		ps.setInt(9, id);
		i=ps.executeUpdate();
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return i;
}

public boolean updateApplicant(Applicant ap,int id) {
	boolean status=false;
	Connection con=DBConnect.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("update applicantacademicdetails set deploma=(?),bachelor=(?),master=(?),phd=(?),qualification=(?) where id=(?)");
		ps.setInt(6, id);
		ps.setString(1,ap.getDiploma());
		ps.setString(2, ap.getBachelor());
		ps.setString(3, ap.getMaster());
		ps.setString(4, ap.getPhd());
		ps.setString(5, ap.getQualification());
		int i=ps.executeUpdate();
		if(i>0)
			status=true;
	}
	catch(Exception ee) {
		ee.printStackTrace();
	}
	return status;
}

public boolean updateJobProfile(Applicant ap) {
	boolean status=false;
	try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("update applicantjobdetails set jobdetails=(?) where id=(?)");
		ps.setString(1, ap.getJobdetails());
		ps.setInt(2, ap.getId());
		int i=ps.executeUpdate();
		if(i>0) {
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

public boolean checkPassward(int id, String password) {
	boolean status=false;
	Connection con=DBConnect.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select * from applicantregister where id=(?) and password=(?)");
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
		PreparedStatement ps=con.prepareStatement("update applicantregister set password=(?) where id=(?)");
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

public boolean DeleteAccount(int aid) {
	boolean status=false;
	Connection con=DBConnect.getConnection();
	PreparedStatement ps;
	try {
		con.setAutoCommit(false);
			ps=con.prepareStatement("delete from applicantregister where id=(?)");
			ps.setInt(1, aid);
			ps.executeUpdate();
		
			ps=con.prepareStatement("delete from applicantpersonaldetails where id=(?)");
			ps.setInt(1, aid);
			ps.executeUpdate();
		
			ps=con.prepareStatement("delete from applicantacademicdetails where id=(?)");
			ps.setInt(1, aid);
			ps.executeUpdate();
			
			ps=con.prepareStatement("delete from applicantjobdetails where id=(?)");
			ps.setInt(1, aid);
			ps.executeUpdate();
		
			ps=con.prepareStatement("delete from appliedjobs where aid=(?)");
			ps.setInt(1, aid);
			ps.executeUpdate();
		
			ps=con.prepareStatement("delete from savedjobs where aid=(?)");
			ps.setInt(1, aid);
			ps.executeUpdate();
			
		status=true;
		con.commit();
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
