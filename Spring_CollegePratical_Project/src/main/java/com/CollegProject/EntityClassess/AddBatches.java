package com.CollegProject.EntityClassess;



import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Add_Batches")
public class AddBatches 
{

	@Id
@GeneratedValue(strategy = GenerationType.AUTO)
	private int sr;
	
	private String tname;
	
	private String subject;
	
	private String sclass;
	
	private String sbatch;
	
	public int getSr() {
		return sr;
	}

	public void setSr(int sr) {
		this.sr = sr;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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
		return tname;
	}

	

	

	
	
	
	
	
	
}
