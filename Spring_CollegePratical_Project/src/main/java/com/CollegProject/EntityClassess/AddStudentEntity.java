package com.CollegProject.EntityClassess;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Student_Pratical")
public class AddStudentEntity
{

	
	private String sname;
	
	@Id
	private String suid;
	
	private String spassword;
	
	private String sclass;
		
	private String sbatch;

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSuid() {
		return suid;
	}

	public void setSuid(String suid) {
		this.suid = suid;
	}

	public String getSpassword() {
		return spassword;
	}

	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getSbatch() {
		return sbatch;
	}

	public void setSbatch(String sbatch) {
		this.sbatch = sbatch;
	}

	@Override
	public String toString() {
		return  	"Student Name:"+sname+"    <br>                         Student Class:"+sclass+"      <br>                    Student Batch:"+sbatch;
	}

	
	
	
}
