package member;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String id = null;
	private String name = null;
	private String pw = null;
	private String repw = null;
	
	
	private int phone = 0;
	private int birth = 0;
	
	private String gender = null;
	private String address = null;
	private String mail = null;
	private String likeM = null;
	private String likeS = null;
	private String hobby = null;
	private String job = null;
	
	private Timestamp date;

	
	public String getRepw() {
		return repw;
	}
	public void setRepw(String repw) {
		this.repw = repw;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getLikeM() {
		return likeM;
	}
	public void setLikeM(String likeM) {
		this.likeM = likeM;
	}
	public String getLikeS() {
		return likeS;
	}
	public void setLikeS(String likeS) {
		this.likeS = likeS;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	

}
