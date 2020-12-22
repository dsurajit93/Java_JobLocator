package jl.pojo;

public class Recruiter {
	private int id;
	private String name;
	private String email;
	private String password;
	private String headoffice,branches,description,lastrecruitment;
	private long cno;
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
	public String getHeadoffice() {
		return headoffice;
	}
	public void setHeadoffice(String headoffice) {
		this.headoffice = headoffice;
	}
	public String getBranches() {
		return branches;
	}
	public void setBranches(String branches) {
		this.branches = branches;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getCno() {
		return cno;
	}
	public void setCno(long cno) {
		this.cno = cno;
	}
	public String getLastrecruitment() {
		return lastrecruitment;
	}
	public void setLastrecruitment(String lastrecruitment) {
		this.lastrecruitment = lastrecruitment;
	}
}
