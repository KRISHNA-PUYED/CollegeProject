package com.CollegProject.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CollegProject.EntityClassess.AddTeacherEntity;

public interface AddTeacherRepository extends JpaRepository<AddTeacherEntity, String>
{

	List<AddTeacherEntity> findByEidAndEpassword(String eid,String epassword);
	
	AddTeacherEntity findByEid(String eid);
	
	
	
	
}
