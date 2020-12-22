package jl.pojo;

public class Job {
	private int id,rid,vacancy,yoe;
	private String rname,jobtitle,jobdescription,joblocation,postname,diploma,bachelor,master,phd,qbranch,rskill,salary;
	private String status;
	private java.sql.Date c_date,lastdate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public int getVacancy() {
		return vacancy;
	}
	public void setVacancy(int vacancy) {
		this.vacancy = vacancy;
	}
	public int getYoe() {
		return yoe;
	}
	public void setYoe(int yoe) {
		this.yoe = yoe;
	}
	public String getJobtitle() {
		return jobtitle;
	}
	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}
	public String getJobdescription() {
		return jobdescription;
	}
	public void setJobdescription(String jobdescription) {
		this.jobdescription = jobdescription;
	}
	public String getJoblocation() {
		return joblocation;
	}
	public void setJoblocation(String joblocation) {
		this.joblocation = joblocation;
	}
	public String getPostname() {
		return postname;
	}
	public void setPostname(String postname) {
		this.postname = postname;
	}
	public String getDiploma() {
		return diploma;
	}
	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}
	public String getBachelor() {
		return bachelor;
	}
	public void setBachelor(String bachelor) {
		this.bachelor = bachelor;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public String getPhd() {
		return phd;
	}
	public void setPhd(String phd) {
		this.phd = phd;
	}
	public String getQbranch() {
		return qbranch;
	}
	public void setQbranch(String qbranch) {
		this.qbranch = qbranch;
	}
	public String getRskill() {
		return rskill;
	}
	public void setRskill(String rskill) {
		this.rskill = rskill;
	}
	public java.sql.Date getC_date() {
		return c_date;
	}
	public void setC_date(java.sql.Date c_date) {
		this.c_date = c_date;
	}
	public java.sql.Date getLastdate() {
		return lastdate;
	}
	public void setLastdate(java.sql.Date lastdate) {
		this.lastdate = lastdate;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
