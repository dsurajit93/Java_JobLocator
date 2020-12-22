package jl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBFactory.DBConnect;
import jl.pojo.Applicant;
import jl.pojo.Job;

public class JobDao {
	public boolean createJob(Job jb) {
		boolean status=false;
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("insert into jobdetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2,jb.getRid());
			ps.setString(3, jb.getJobtitle());
			ps.setString(4,jb.getJobdescription());
			ps.setString(5, jb.getJoblocation());
			ps.setString(6, jb.getPostname());
			ps.setInt(7,jb.getVacancy());
			ps.setString(8,jb.getDiploma());
			ps.setString(9,jb.getBachelor());
			ps.setString(10,jb.getMaster());
			ps.setString(11,jb.getPhd());
			ps.setString(12,jb.getQbranch());
			ps.setString(13,jb.getRskill());
			ps.setInt(14, jb.getYoe());
			ps.setDate(15, jb.getC_date());
			ps.setDate(16, jb.getLastdate());
			ps.setString(17,jb.getSalary());
			int i=ps.executeUpdate();
			if(i>0)
				status=true;
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return status;
	}
	
	public ArrayList<Job> getJobs(int rid) {
		ArrayList<Job> al=new ArrayList<Job>();
		
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from jobdetails where r_id=(?)");
			ps.setInt(1, rid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Job jb=new Job();
				jb.setId(rs.getInt(1));
				jb.setRid(rs.getInt(2));
				jb.setJobtitle(rs.getString(3));
				jb.setJobdescription(rs.getString(4));
				jb.setJoblocation(rs.getString(5));
				jb.setPostname(rs.getString(6));
				jb.setVacancy(rs.getInt(7));
				jb.setDiploma(rs.getString(8));
				jb.setBachelor(rs.getString(9));
				jb.setMaster(rs.getString(10));
				jb.setPhd(rs.getString(11));
				jb.setQbranch(rs.getString(12));
				jb.setRskill(rs.getString(13));
				jb.setYoe(rs.getInt(14));
				jb.setC_date(rs.getDate(15));
				jb.setLastdate(rs.getDate(16));
				jb.setSalary(rs.getString(17));
				
				//System.out.println(rs.getInt(1));
				
				al.add(jb);
			}
			ps.close();
			con.close();
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<Job> getAllJobs(){
		ArrayList<Job> al=new ArrayList<Job>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps,psn; 
			ps=con.prepareStatement("select * from jobdetails order by id desc");
			ResultSet rs,rsn; 
			rs=ps.executeQuery();
			while(rs.next()) {
				Job jb=new Job();
				
				jb.setId(rs.getInt(1));
				jb.setJobtitle(rs.getString(3));
				jb.setJoblocation(rs.getString(5));
				jb.setPostname(rs.getString(6));
				jb.setQbranch(rs.getString(12));
				jb.setRskill(rs.getString(13));
				jb.setYoe(rs.getInt(14));
				jb.setLastdate(rs.getDate(16));
				jb.setSalary(rs.getString(17));
				psn=con.prepareStatement("select name from recruiterdetails where id=(?)");
				psn.setInt(1, rs.getInt(2));
				rsn=psn.executeQuery();
				if(rsn.next()) {
					jb.setRname(rsn.getString(1));
				}
				
				al.add(jb);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		
		return al;
	}
	
	public Job getJobDetails(int id) {
		Job jb=new Job();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from jobdetails where id=(?)");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				jb.setId(rs.getInt(1));
				jb.setRid(rs.getInt(2));
				jb.setJobtitle(rs.getString(3));
				jb.setJobdescription(rs.getString(4));
				jb.setJoblocation(rs.getString(5));
				jb.setPostname(rs.getString(6));
				jb.setVacancy(rs.getInt(7));
				jb.setDiploma(rs.getString(8));
				jb.setBachelor(rs.getString(9));
				jb.setMaster(rs.getString(10));
				jb.setPhd(rs.getString(11));
				jb.setQbranch(rs.getString(12));
				jb.setRskill(rs.getString(13));
				jb.setYoe(rs.getInt(14));
				jb.setC_date(rs.getDate(15));
				jb.setLastdate(rs.getDate(16));
				jb.setSalary(rs.getString(17));
				
				PreparedStatement psn=con.prepareStatement("select name from recruiterdetails where id=(?)");
				psn.setInt(1, rs.getInt(2));
				ResultSet rsn=psn.executeQuery();
				if(rsn.next()) {
					jb.setRname(rsn.getString(1));
				}
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return jb;
	}
	
	public boolean applyJob(int jid,int rid,int aid) {
		boolean status=false;
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from appliedjobs where jid=(?) and aid=(?)");
			ps.setInt(1, jid);
			ps.setInt(2, aid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
				status=false;
			else {
				ps=con.prepareStatement("insert into appliedjobs values(?,?,?,?,?)");
				ps.setInt(1,0);
				ps.setInt(2,jid);
				ps.setInt(3, rid);
				ps.setInt(4, aid);
				ps.setString(5,"Pending");
				int i=ps.executeUpdate();
				if(i>0)
					status=true;
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return status;
	}
	
	public boolean saveJob(int jid,int rid,int aid) {
		boolean status=false;
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from savedjobs where jid=(?) and aid=(?)");
			ps.setInt(1, jid);
			ps.setInt(2, aid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
				status=false;
			else {
				ps=con.prepareStatement("insert into savedjobs values(?,?,?,?)");
				ps.setInt(1,0);
				ps.setInt(2,jid);
				ps.setInt(3, rid);
				ps.setInt(4, aid);
				int i=ps.executeUpdate();
				if(i>0)
					status=true;
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return status;
	}
	
	public ArrayList<Job> appliedJobs(int aid){
		ArrayList<Job> al=new ArrayList<Job>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from appliedjobs where aid=(?)");
			ps.setInt(1, aid);
			ResultSet rs=ps.executeQuery();
			ResultSet rsj,rsr;
			int jid=0;
			while(rs.next()) {
				Job jb=new Job();
				
				jid=rs.getInt(2);
				
				jb.setId(jid);
				jb.setStatus(rs.getString(5));
				
				ps=con.prepareStatement("select r_id,jobtitle from jobdetails where id=(?)");
				ps.setInt(1, jid);
				rsj=ps.executeQuery();
				if(rsj.next()) {
					jb.setJobtitle(rsj.getString(2));
					ps=con.prepareStatement("select name from recruiterdetails where id=(?)");
					ps.setInt(1, rsj.getInt(1));
					rsr=ps.executeQuery();
					if(rsr.next()) {
						jb.setRname(rsr.getString(1));
					}
				}
				al.add(jb);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		
		return al;
	}
	
	public ArrayList<Job> savedJobs(int aid){
		ArrayList<Job> al=new ArrayList<Job>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from savedjobs where aid=(?)");
			ps.setInt(1, aid);
			ResultSet rs=ps.executeQuery();
			ResultSet rsj,rsr;
			int jid=0;
			while(rs.next()) {
				Job jb=new Job();
				
				jid=rs.getInt(2);
				
				jb.setId(jid);
				
				ps=con.prepareStatement("select r_id,jobtitle from jobdetails where id=(?)");
				ps.setInt(1, jid);
				rsj=ps.executeQuery();
				if(rsj.next()) {
					jb.setJobtitle(rsj.getString(2));
					ps=con.prepareStatement("select name from recruiterdetails where id=(?)");
					ps.setInt(1, rsj.getInt(1));
					rsr=ps.executeQuery();
					if(rsr.next()) {
						jb.setRname(rsr.getString(1));
					}
				}
				al.add(jb);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}	
		return al;
	}
	
	public ArrayList<Applicant> getPendingApplicant(int jid, int rid){
		ArrayList<Applicant> al=new ArrayList<Applicant>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select aid from appliedjobs where jid=(?) and rid=(?) and status=(?)");
			ps.setInt(1, jid);
			ps.setInt(2, rid);
			ps.setString(3, "Pending");
			ResultSet rs,rsap,rsac;
			rs=ps.executeQuery();
			while(rs.next()) {
				Applicant app=new Applicant();
				ps=con.prepareStatement("select * from applicantpersonaldetails where id=(?)");
				ps.setInt(1, rs.getInt(1));
				rsap=ps.executeQuery();
				ps=con.prepareStatement("select * from applicantacademicdetails where id=(?)");
				ps.setInt(1, rs.getInt(1));
				rsac=ps.executeQuery();
				if(rsap.next()&&rsac.next()) {
					app.setId(rsap.getInt(1));
					app.setName(rsap.getString(2));
					app.setAddress(rsap.getString(5));
					app.setSkill(rsap.getString(9));
					app.setQualification(rsac.getString(6));
				}
				al.add(app);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return al;
	}
	
	public boolean approveRequest(int jid,int rid,Integer[] aids) {
		boolean status = false;
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("update appliedjobs set status='Approved' where jid='"+jid+"' and rid='"+rid+"' and aid=(?)");
			for(int i=0;i<aids.length;i++) {
				ps.setInt(1, aids[i]);
				ps.addBatch();
			}
			int[] ar=ps.executeBatch();
			if(aids.length==ar.length)
				status=true;
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return status;
	}
	
	public ArrayList<Applicant> getApprovedApplicant(int jid, int rid){
		ArrayList<Applicant> al=new ArrayList<Applicant>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select aid from appliedjobs where jid=(?) and rid=(?) and status='Approved'");
			ps.setInt(1, jid);
			ps.setInt(2, rid);
			ResultSet rs,rsa;
			rs=ps.executeQuery();
			int aid=0;
			while(rs.next()) {
				Applicant app=new Applicant();
				aid=rs.getInt("aid");
				app.setId(aid);
				ps=con.prepareStatement("select name,mob,email from applicantpersonaldetails where id='"+aid+"'");
				rsa=ps.executeQuery();
				if(rsa.next()) {
					app.setName(rsa.getString(1));
					app.setMob(rsa.getLong(2));
					app.setEmail(rsa.getString(3));
				}
				al.add(app);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		
		return al;
	}
	
	public ArrayList<Job> getJobsForAdmin(){
		ArrayList<Job> al=new ArrayList<Job>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps,psn; 
			ps=con.prepareStatement("select * from jobdetails order by lastdate");
			ResultSet rs,rsn; 
			rs=ps.executeQuery();
			while(rs.next()) {
				Job jb=new Job();
				
				jb.setId(rs.getInt(1));
				jb.setJobtitle(rs.getString(3));
				jb.setLastdate(rs.getDate(16));
				jb.setSalary(rs.getString(17));
				psn=con.prepareStatement("select name from recruiterdetails where id=(?)");
				psn.setInt(1, rs.getInt(2));
				rsn=psn.executeQuery();
				if(rsn.next()) {
					jb.setRname(rsn.getString(1));
				}
				
				al.add(jb);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		
		return al;
	}
	public ArrayList<Integer> idByLocation(String location){
		ArrayList<Integer> al=new ArrayList<Integer>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select id from jobdetails where joblocation like '%"+location+"%'");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				al.add(rs.getInt(1));
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<String> getPostNames(){
		ArrayList<String> al=new ArrayList<String>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("SELECT DISTINCT postname FROM jobdetails");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				al.add(rs.getString(1));
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<Job> searchJob(String qry){
		ArrayList<Job> al=new ArrayList<Job>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps,psn; 
			ps=con.prepareStatement(qry);
			ResultSet rs,rsn; 
			rs=ps.executeQuery();
			while(rs.next()) {
				Job jb=new Job();
				
				jb.setId(rs.getInt(1));
				jb.setJobtitle(rs.getString(3));
				jb.setPostname(rs.getString(6));
				jb.setQbranch(rs.getString(12));
				jb.setRskill(rs.getString(13));
				jb.setYoe(rs.getInt(14));
				jb.setLastdate(rs.getDate(16));
				jb.setSalary(rs.getString(17));
				psn=con.prepareStatement("select name from recruiterdetails where id=(?)");
				psn.setInt(1, rs.getInt(2));
				rsn=psn.executeQuery();
				if(rsn.next()) {
					jb.setRname(rsn.getString(1));
				}
				
				al.add(jb);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<Applicant> searchCandidate(String location,String skill){
		ArrayList<Applicant> al=new ArrayList<Applicant>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from applicantpersonaldetails where address like '%"+location+"%' and keyskill like '%"+skill+"%'");
			ResultSet rs,rsap,rsac;
			rs=ps.executeQuery();
			while(rs.next()) {
				Applicant app=new Applicant();
				ps=con.prepareStatement("select * from applicantpersonaldetails where id=(?)");
				ps.setInt(1, rs.getInt(1));
				rsap=ps.executeQuery();
				ps=con.prepareStatement("select * from applicantacademicdetails where id=(?)");
				ps.setInt(1, rs.getInt(1));
				rsac=ps.executeQuery();
				if(rsap.next()&&rsac.next()) {
					app.setId(rsap.getInt(1));
					app.setName(rsap.getString(2));
					app.setAddress(rsap.getString(5));
					app.setSkill(rsap.getString(9));
					app.setQualification(rsac.getString(6));
				}
				al.add(app);
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return al;
	}

	public ArrayList<String> getHighlight() {
		ArrayList<String> al=new ArrayList<String>();
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select jobtitle from jobdetails order by id desc limit 5");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				al.add(rs.getString(1));
			}
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return al;
	}

	public boolean DeleteJob(int jid, int rid) {
		boolean status=false;
		int i=0,j=0,k=0;
		Connection con=DBConnect.getConnection();
		
		try {
			con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement("select * from jobdetails where id=(?) and r_id=(?)");
			ps.setInt(1, jid);
			ps.setInt(2, rid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				ps=con.prepareStatement("DELETE FROM jobdetails WHERE id=(?)");
				ps.setInt(1, jid);
				i=ps.executeUpdate();
				
				ps=con.prepareStatement("select * from appliedjobs where jid=(?)");
				ps.setInt(1, jid);
				rs=ps.executeQuery();
				if(rs.next()) {
					ps=con.prepareStatement("DELETE FROM appliedjobs WHERE jid=(?)");
					ps.setInt(1, jid);
					j=ps.executeUpdate();
				}
				
				ps=con.prepareStatement("select * from savedjobs where jid=(?)");
				ps.setInt(1, jid);
				rs=ps.executeQuery();
				if(rs.next()) {
					ps=con.prepareStatement("DELETE FROM savedjobs WHERE jid=(?)");
					ps.setInt(1, jid);
					k=ps.executeUpdate();
				}
				System.out.println(i+"\t"+j+"\t"+k);
				if(i>0 || j>0 || k>0) {
					status=true;
					con.commit();
				}
			}
			ps.close();
			con.close();
		}
		catch(Exception ee) {
			try {
				con.rollback();
				ee.printStackTrace();
			}
			catch(Exception exp) {
				exp.printStackTrace();
			}
		}
		return status;
	}

	public boolean updateJob(Job jb,int jid) {
		boolean status=false;
		Connection con=DBConnect.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("update jobdetails set r_id=(?),jobtitle=(?),jobdescription=(?),joblocation=(?),postname=(?),vacancy=(?),diploma=(?),bachelor=(?),master=(?),phd=(?),qbranch=(?),rskill=(?),yoe=(?),lastdate=(?),salary=(?) where id=(?)");
			ps.setInt(16, jid);
			ps.setInt(1,jb.getRid());
			ps.setString(2, jb.getJobtitle());
			ps.setString(3,jb.getJobdescription());
			ps.setString(4, jb.getJoblocation());
			ps.setString(5, jb.getPostname());
			ps.setInt(6,jb.getVacancy());
			ps.setString(7,jb.getDiploma());
			ps.setString(8,jb.getBachelor());
			ps.setString(9,jb.getMaster());
			ps.setString(10,jb.getPhd());
			ps.setString(11,jb.getQbranch());
			ps.setString(12,jb.getRskill());
			ps.setInt(13, jb.getYoe());
			ps.setDate(14, jb.getLastdate());
			ps.setString(15,jb.getSalary());
			int i=ps.executeUpdate();
			if(i>0)
				status=true;
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
		return status;
	}
}
