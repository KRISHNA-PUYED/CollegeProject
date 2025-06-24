package com.CollegProject.EntityClassess;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Add_Batch_Date")
public class BatchDate 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
 private int bid;
 
 private String batch;
 
 private String bdate;
 
 private String sclass;

public int getBid() {
	return bid;
}

public void setBid(int bid) {
	this.bid = bid;
}

public String getBatch() {
	return batch;
}

public void setBatch(String batch) {
	this.batch = batch;
}

public String getBdate() {
	return bdate;
}

public void setBdate(String bdate) {
	this.bdate = bdate;
}

public String getSclass() {
	return sclass;
}

public void setSclass(String sclass) {
	this.sclass = sclass;
}
 
 
 
	
	
	
	
}
