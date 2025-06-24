package com.CollegProject.Repositories;

import java.util.List;


import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.CollegProject.EntityClassess.BatchDate;

import jakarta.transaction.Transactional;

@Transactional
@Repository
public interface BatchDateAdd extends JpaRepository<BatchDate, Integer>
{

	List<BatchDate> findByBatchAndSclass(String batch,String sclass,Sort sort);
	
	BatchDate findByBatchAndBdateAndSclass(String batch, String bdate,String sclass);
	

	 @Query(value = "SELECT COUNT(*) FROM Add_Batch_Date WHERE  batch=?1 AND sclass=?2", nativeQuery = true)
	    long countByBatchAndSclass(String batch,String sclass);
	 
	int deleteByBdateAndBatchAndSclass(String bdate,String batch,String sclass);
	
}
