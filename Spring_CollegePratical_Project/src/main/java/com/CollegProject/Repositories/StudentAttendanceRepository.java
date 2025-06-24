package com.CollegProject.Repositories;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.CollegProject.EntityClassess.StudentAttendanceEntity;

public interface StudentAttendanceRepository extends JpaRepository<StudentAttendanceEntity, String>
{

	List<StudentAttendanceEntity> findBySuidAndSub(String suid,String sub);
	
	List<StudentAttendanceEntity> findBySubAndPdate(String sub,String pdate,Sort sort);
	
	List<StudentAttendanceEntity> findByPdate(String pdate);
	//List<StudentAttendanceEntity> findBySubAndPdate(String sub,Sort sort);
	 @Query(value = "SELECT COUNT(*) FROM Student_Pratical_Attendance WHERE suid = ?1 AND sub=?2 AND attendance=?3", nativeQuery = true)
	    long countBySuidAndSubAndAttendance(String suid,String sub,String attendance);
	 
	 StudentAttendanceEntity findBySuidAndSubAndPdate(String suid,String sub,String pdate);
	 
}
