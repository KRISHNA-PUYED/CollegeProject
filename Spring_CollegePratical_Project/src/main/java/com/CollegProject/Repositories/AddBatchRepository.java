package com.CollegProject.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CollegProject.EntityClassess.AddBatches;

import jakarta.transaction.Transactional;

@Transactional
@Repository
public interface AddBatchRepository  extends JpaRepository<AddBatches, Integer>
{
List<AddBatches> findByTname(String tname);

AddBatches findByTnameAndSubjectAndSclassAndSbatch(String tname,String subject,String sclass,String sbatch);

int deleteByTnameAndSubjectAndSbatch(String tname,String subject,String sbatch);



}


