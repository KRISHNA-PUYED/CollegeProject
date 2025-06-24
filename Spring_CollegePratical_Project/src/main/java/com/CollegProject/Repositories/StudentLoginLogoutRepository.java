package com.CollegProject.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CollegProject.EntityClassess.StudentLoginLogoutTime;

import jakarta.transaction.Transactional;

@Transactional
@Repository
public interface StudentLoginLogoutRepository extends JpaRepository<StudentLoginLogoutTime, String>
{

	List<StudentLoginLogoutTime> findBySbatchAndSub(String sbatch,String sub);
	
	StudentLoginLogoutTime findBySuid(String suid);
	
	int deleteBySbatchAndSub(String sbatch,String sub);
}
