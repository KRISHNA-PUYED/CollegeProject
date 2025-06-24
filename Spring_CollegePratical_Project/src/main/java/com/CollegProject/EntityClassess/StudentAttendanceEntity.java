package com.CollegProject.EntityClassess;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Student_Pratical_Attendance")
public class StudentAttendanceEntity 
{
	
	@Id
	private String suid;
	
	private String sname;
	
	private String pdate;
	
	private String attendance;

	private String sub;
	
	private String logtime;
	

	public String getLogtime() {
		return logtime;
	}

	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}

	public String getSuid() {
		return suid;
	}

	public void setSuid(String suid) {
		this.suid = suid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getAttendance() {
		return attendance;
	}
	
	

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	
	
	

}
