package com.CollegProject.EntityClassess;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Add_Teacher_Data")
public class AddTeacherEntity 
{

	@Id
	private String eid;
	
	private String epassword;
	
	private String ename;
	
	private String esubject;

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getEpassword() {
		return epassword;
	}

	public void setEpassword(String epassword) {
		this.epassword = epassword;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEsubject() {
		return esubject;
	}

	public void setEsubject(String esubject) {
		this.esubject = esubject;
	}

	@Override
	public String toString() {
		return ename;
	}

	
	
	
	
	
	
}
