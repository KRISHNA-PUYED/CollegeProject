package com.CollegProject.CollegeServiceLayer;


import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CollegProject.EntityClassess.AddStudentEntity;
import com.CollegProject.EntityClassess.StudentLoginLogoutTime;
import com.CollegProject.Repositories.AddStudentRepositoty;
import com.CollegProject.Repositories.StudentLoginLogoutRepository;

@Service
public class StudentServiceClass 
{

	@Autowired
	StudentLoginLogoutRepository stulog;
	
	@Autowired
	AddStudentRepositoty addstu;
	

	
	public void studentLoginTime(String studentId,String subject)
	{
	    String pattern = "hh:mm:ss a";
		LocalTime time=LocalTime.now();
		String nwhour = time.format(DateTimeFormatter.ofPattern(pattern));
	
		
		
	    
LocalDate date=LocalDate.now();
		
	
		int day = date.getDayOfMonth();
		String nday=null;
		if(day>0 && day<=9)
		{
			nday="0"+day;
		}
		else
		{
			nday=String.valueOf(day);
		}
		String loginDate= nday+"-"+date.getMonth()+"-"+date.getYear();
		
	System.out.println("LlllllllllllllllllllllllllllllllllllDDDDDDDDDDDDDDD:"+loginDate);
	
		//String loginTime= nwhour+":"+time.getMinute()+":"+time.getSecond()+" AM";
		
		System.out.println("Hour stu:"+nwhour);
		StudentLoginLogoutTime stu=new StudentLoginLogoutTime();
		
		
	
		
		Optional<AddStudentEntity> byId = addstu.findById(studentId);
		
		if(byId.isPresent())
		{
			
			AddStudentEntity stuentity = byId.get();
			
			
			
			System.out.println(stuentity.getSname()+" "+stuentity.getSclass());
			
			String sname = stuentity.getSname();
			String sclass = stuentity.getSclass();
			String sbatch = stuentity.getSbatch();
			
			System.out.println(sname+":"+sclass+":"+sbatch);
			stu.setSname(sname);
			stu.setSclass(sclass);
			stu.setSbatch(sbatch);
			stu.setSuid(studentId);
			stu.setLogindate(loginDate);
			stu.setLogintime(nwhour);
			stu.setLogouttime(" ");
			stu.setSub(subject);
			
			stulog.save(stu);
			
			
		}
		
		
		
	
		
	
		
		
		
		
		
	}
	

	
	public void studentLogoutTime(String sid,String subject)
	{
		
		  String pattern = "hh:mm:ss a";
		LocalTime time=LocalTime.now();
		String nwhour = time.format(DateTimeFormatter.ofPattern(pattern));
		
		StudentLoginLogoutTime log=new StudentLoginLogoutTime();
		
		
		
		
		StudentLoginLogoutTime student=new StudentLoginLogoutTime();
		
		
		//String slogout= nwhour+":"+time.getMinute()+":"+time.getSecond()+" AM";
		
		Optional<StudentLoginLogoutTime> stu = stulog.findById(sid);
		
		if(stu.isPresent())
		{
			StudentLoginLogoutTime sdate = stu.get();
			
			student.setSuid(sid);
			student.setSname(sdate.getSname());
			student.setSclass(sdate.getSclass());
			student.setSbatch(sdate.getSbatch());
			student.setLogintime(sdate.getLogintime());
			student.setLogindate(sdate.getLogindate());
		student.setSub(subject);
			student.setLogouttime(nwhour);
			
			stulog.save(student);
			
			
		}
		
		
	
		
		
		
	}
	
	
	
	
	
	
}
