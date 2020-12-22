package jl.pojo;

public class Applicant {
	private int id;
	private String name;
	private String email;
	private String password;
	private String fname,address,objective,skill,diploma,bachelor,master,phd,qualification,jobdetails,imageName,resumeName;
	public String getResumeName() {
		return resumeName;
	}
	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}
	private long mob;
	private java.sql.Date dob;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getObjective() {
		return objective;
	}
	public void setObjective(String objective) {
		this.objective = objective;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
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
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public long getMob() {
		return mob;
	}
	public void setJobdetails(String jobdetails) {
		this.jobdetails = jobdetails;
	}
	public void setMob(long mob) {
		this.mob = mob;
	}
	public java.sql.Date getDob() {
		return dob;
	}
	public void setDob(java.sql.Date dob) {
		this.dob = dob;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getJobdetails() {
		return jobdetails;
	}
}
