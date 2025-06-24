package com.CollegProject.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CollegProject.EntityClassess.AddStudentEntity;

public interface AddStudentRepositoty extends JpaRepository<AddStudentEntity, String>
{

	List<AddStudentEntity> findBySclassAndSbatch(String sclass,String sbatch);
	
	List<AddStudentEntity> findBySbatch(String sbatch);
	
	AddStudentEntity findBySuidAndSpassword(String suid,String spassword);
	
	
	
}
