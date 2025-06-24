package com.CollegProject.Controller;

import java.io.IOException;
import java.net.http.HttpHeaders;
import java.net.http.HttpResponse;
import java.text.DecimalFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.CollegProject.CollegeServiceLayer.StudentServiceClass;
import com.CollegProject.EntityClassess.AddBatches;
import com.CollegProject.EntityClassess.AddStudentEntity;
import com.CollegProject.EntityClassess.AddTeacherEntity;
import com.CollegProject.EntityClassess.BatchDate;
import com.CollegProject.EntityClassess.StudentAttendance;
import com.CollegProject.EntityClassess.StudentAttendanceEntity;
import com.CollegProject.EntityClassess.StudentLoginLogoutTime;
import com.CollegProject.PojoClasses.StudentCountClass;
import com.CollegProject.Repositories.AddBatchRepository;
import com.CollegProject.Repositories.AddStudentRepositoty;
import com.CollegProject.Repositories.AddTeacherRepository;
import com.CollegProject.Repositories.BatchDateAdd;
import com.CollegProject.Repositories.StudentAttendanceRepository;
import com.CollegProject.Repositories.StudentLoginLogoutRepository;


import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@Controller
public class CollegeController 
{
	
	@Autowired
	AddTeacherRepository  addTeacherRepository;
	
	@Autowired
	
	AddStudentRepositoty student;
	
	@Autowired
	AddBatchRepository bat;
	
	@Autowired
	StudentServiceClass serviceClass;
	
	@Autowired
	StudentLoginLogoutRepository loginLogoutRepository;
	
	@Autowired
	StudentAttendanceRepository attendanceRepository;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	BatchDateAdd batchDateAdd;
	
	 
	//====================================================================================
	
	//Home Page Method
	
	@RequestMapping("/Index")
	public String goHomePage()
	{
		
		return "Index";
	}
	
	
		
	
	
	
	
	
	//AdminLogin Page
	
	@RequestMapping("/AdminLogin")
	public String AdminLoginPage()
	{
		
		
		return "AdminLogin";
	}
	
	
	
	
	
	
	
	
	
	
	//Admin Id And Pasword check
	@PostMapping("/AdminLoginData")
	public ModelAndView AdminValidateLogin(@RequestParam("id") String id,@RequestParam("password") String password)
	{
		ModelAndView mv=new ModelAndView();
		if(id.equals("mgm")&&password.equals("159"))
		{
			mv.setViewName("AdminDashbord");
			
		}
		else
		{
			mv.setViewName("AdminLogin");
			mv.addObject("message", "Invalid UserName And Password...");
		}
		
		
		return mv;
		
		
	}
	
	
	
	
	
	
	
	
	
	//Go Add Teachers page
	@GetMapping(path="/AddTeachers")
	public String goAddTeacher()
	{
		
		
		return "AddTeacher";
	}
	
	
	
	
	
	
	
	
	
	//Add Teacher Data In Database
	@PostMapping("/InsertTeacherData")
	public ModelAndView addTeacherData(@RequestParam("tid")String eid,@RequestParam("tpassword")String epassword,@RequestParam("tname")String ename,@RequestParam("tsubject")String esubject)
	{
		
		AddTeacherEntity addTea=new AddTeacherEntity();
		addTea.setEid(eid);
		addTea.setEname(ename);
		addTea.setEpassword(epassword);
		addTea.setEsubject(esubject);
		//System.out.println(eid+"\n"+epassword);
		
		addTeacherRepository.save(addTea);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("AdminDashbord");
		
		return mv;
	}
	
	
	//View Teachers Data
	
	@RequestMapping("/ViewTeachers")
	public ModelAndView getTeacherData(org.springframework.ui.Model mod)
	{
		List<AddTeacherEntity> tlist = addTeacherRepository.findAll();
		ModelAndView mm=new ModelAndView();
		if(tlist.size()>0)
		{
		
		mod.addAttribute("Tealist", tlist);
		mm.setViewName("View_Teacher_Data");
		}
		else
		{
			mod.addAttribute("msg", "Data Not Found");
			mm.setViewName("View_Teacher_Data");
		}
		return mm;
	}
	
	
	//Delete Teacher Data
	@RequestMapping("teadelete/{teaId}")
	public String deleteTeaData(@PathVariable("teaId")String teaId)
	{
		
		addTeacherRepository.deleteById(teaId);
		
		return "redirect:/ViewTeachers";
		
	}
	
	//Go  Update Teacher Page
	@RequestMapping("teaupdate/{teacherId}")
	public ModelAndView goUpdateTeacherTable(@PathVariable("teacherId")String teaId)
	{
		Optional<AddTeacherEntity> byId = addTeacherRepository.findById(teaId);
		AddTeacherEntity teaObj=null;
		ModelAndView mv=new ModelAndView();
		if(byId.isPresent())
		{
			 teaObj = byId.get();
			 mv.addObject("teaData", teaObj);
			 mv.setViewName("TeacherUpdateData");
		}
		else
		{
			mv.addObject("message", "Teacher Id Not Found...");
			mv.setViewName("Error");
		}
		
		return mv;
	}
	
	//Update Teacher Data 
	@PostMapping("/TeacherUpdateData")
	public String updateTeacherData(HttpServletRequest req)
	{
		String tea=req.getParameter("tid");
		AddTeacherEntity byEid = addTeacherRepository.findByEid(tea);
		
		String tpass = req.getParameter("tpassword");
		String tname = req.getParameter("tname");
		
		String esubject = byEid.getEsubject();
		
		AddTeacherEntity add=new AddTeacherEntity();
		add.setEid(tea);
		add.setEpassword(tpass);
        add.setEname(tname);
        add.setEsubject(esubject);
        
        addTeacherRepository.save(add);
        
		
		return "redirect:/ViewTeachers";
	}
	
	
	
	
	
	
	
	
	//Go to Home Page
	@GetMapping("GoHome")
	public String goAdminToHome()
	{
		
		
		return "redirect:/Index";
	}
	

	/*
	 @GetMapping("/GoHome")
	    public String logout(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate(); // Invalidate the session
	        }
	        return "redirect:/AdminLogin"; // Redirect to login page with a logout message
	    }
*/	
	
	
	//**********Pratical_Incharge******************
	
	@GetMapping("PraticalInchargeLogin")
	public String goPraticalLogin()
	{
		
		return "PraticalInchargeLogin";
	}
	
	
	
	//Pratical_Incharge Login Data
	//@SuppressWarnings("deprecation")
	
	@PostMapping("PraticalInchargeLoginData")
	public ModelAndView PraticalLogin(@RequestParam("id") String id,@RequestParam("password") String password,org.springframework.ui.Model mm)
	{
		List<AddTeacherEntity> list = addTeacherRepository.findByEidAndEpassword(id, password);
		
List<String> li = list.stream().map(m1->m1.getEname()).collect(Collectors.toList());

 AddTeacherEntity byEid = addTeacherRepository.findByEid(id);
 
 String ename = byEid.getEname();

 System.out.println(ename);
List<AddBatches> tbatches = bat.findByTname(ename);


	
		
		
		ModelAndView mv=new ModelAndView();	
	if(list.isEmpty())
	{
		mv.addObject("message", "Login Faild");
		mv.setViewName("Error");
	}
	else
	{

		mv.addObject("teaname", ename);
		mm.addAttribute("logteadata", tbatches);
		mv.setViewName("Pratical_Incharge_Dashbord");
	}
	

		
		return mv;
	}
	
	// View Batches Students
	
	@RequestMapping("/studentbatch/{batchId}/{subject}")
	public ModelAndView findBatchStudents(@PathVariable("batchId")String bId,@PathVariable("subject") String sub)
	{
		
List<AddStudentEntity> byId = student.findBySbatch(bId);



//String query1="select count(suid) from Student_Pratical_Attendance where suid=? and sub=? and attendance=? ";





		
            List<String> st = byId.stream().map(m1->m1.getSclass()).collect(Collectors.toList());

        //String sclass = st.get(0);
          
            String query="select count(sbatch) from Student_Pratical where sbatch=?";

         
            Integer ii = this.jdbcTemplate.queryForObject(
            query, Integer.class, new Object[] { bId});
            
            System.out.println("Count Of="+ii);
		ModelAndView mv=new ModelAndView();
		
		if(byId.isEmpty())
		{
			
			mv.setViewName("Error");
		}
		else
		{
			mv.addObject("stubject", sub);
			mv.addObject("stubatch", bId);
			mv.addObject("sbatch", byId);
			mv.addObject("scount", ii);
			mv.setViewName("ViewStudentBatches");
		}
		
		
		return mv;
	}
	
	
	
	//Assign Date To Batch
	@RequestMapping("/databatch/{stubatch}/{subject}")
	public String goDateToBatch(@PathVariable("stubatch")String sbatch,@PathVariable("subject")String subject, org.springframework.ui.Model mod)
	{
		mod.addAttribute("batch", sbatch);
		mod.addAttribute("sub", subject);
		List<BatchDate> all = batchDateAdd.findAll(Sort.by(Direction.ASC, "bid"));
		
		if(all.size()>0)
		{
			mod.addAttribute("datelist", all);
		}
		
		
		
		return "DateToBatch";
		
		
		
	}
	//Store Date To Batch
	@PostMapping("/BatchDataDate")
	public String storeDateToBatch(HttpServletRequest req,org.springframework.ui.Model mod,	RedirectAttributes redirectAttributes)
	{
		
		System.out.println(req.getParameter("batch")+"======="+req.getParameter("sdate")+" ####  "+req.getParameter("tsub"));
		String sbatch=req.getParameter("batch");
		String subject=req.getParameter("tsub");
	String teasub = req.getParameter("tsub");
	String batch=null;
	
	 List<BatchDate> list=null;
	
	
		String dd = req.getParameter("sdate");
		System.out.println("Selected Date:"+dd.length());
		String adddate=null;
		Optional<String> op = Optional.ofNullable(dd);
		if(op.isPresent())
		{
		
			String ddd = op.get();
	if(ddd.length()>0)
	{
		String[] sp = ddd.split("-");
		String year = sp[0];
	String month = sp[1];
    String 	day=sp[2];
    
     adddate=day+"-"+month+"-"+year;
      batch = req.getParameter("batch");
     
  BatchDate batchDate = batchDateAdd.findByBatchAndBdateAndSclass(batch, adddate, teasub);    
      
     if(batchDate!=null)
     {
      
     BatchDate bdate=new BatchDate();
     bdate.setBatch(batch);
     bdate.setBdate(adddate);
     bdate.setSclass(teasub);
     batchDateAdd.save(bdate);

     
     list = batchDateAdd.findByBatchAndSclass(batch, teasub,Sort.by(Direction.ASC, "bid"));
     
    
     if(list.size()>0)
     {
 	mod.addAttribute("message", "Date Sucessfully Added");

 		//RedirectView rv=new RedirectView();
 		mod.addAttribute("batch", batch);
 		redirectAttributes.addFlashAttribute("batch", batch);
 		mod.addAttribute("sub", teasub);
 		redirectAttributes.addFlashAttribute("sub", teasub);
 		
 		redirectAttributes.addFlashAttribute("datelist", list);
 		//mod.addAttribute("datelist", list);
 		//rv.setUrl("DateToBatch");
     }
     else
     {
     	mod.addAttribute("message", "Data Not Found....");
     	redirectAttributes.addFlashAttribute("message","Data Not Found...." );
     }
     }
 	else
	{
		 BatchDate bdate=new BatchDate();
	     bdate.setBatch(batch);
	     bdate.setBdate(adddate);
	     bdate.setSclass(teasub);
	     batchDateAdd.save(bdate);
	     
	     
	     
	     list = batchDateAdd.findByBatchAndSclass(batch, teasub,Sort.by(Direction.ASC, "bid"));
	     
	     
	     if(list.size()>0)
	     {
	 	mod.addAttribute("message", "Date Sucessfully Added");

	 		//RedirectView rv=new RedirectView();
	 		mod.addAttribute("batch", batch);
	 		redirectAttributes.addFlashAttribute("batch", batch);
	 		mod.addAttribute("sub", teasub);
	 		redirectAttributes.addFlashAttribute("sub", teasub);
	 		
	 		redirectAttributes.addFlashAttribute("datelist", list);
	 		//mod.addAttribute("datelist", list);
	 		//rv.setUrl("DateToBatch");
	     }
	     else
	     {
	     	mod.addAttribute("message", "Data Not Found....");
	     	redirectAttributes.addFlashAttribute("message","Data Not Found...." );
	     }

	}
     
     
     
	}
	else
	{
		//mod.addAttribute("message", "Plase Select Date First");
		redirectAttributes.addFlashAttribute("message","Plase Select Date First" );
	}
	
	}
		else
		{
			//mod.addAttribute("message", "Plase Select Date First");
		 	redirectAttributes.addFlashAttribute("message","Plase Select Date First" );
		}
		
	
  
		
		return "redirect:/databatch/"+sbatch+"/"+subject;
	}
	
	
	//Delete Pratical Date
	@RequestMapping("pdatedelete/{sdate}/{sbatch}/{sub}")
	public String praticalDateDelete(@PathVariable("sdate")String sdate,@PathVariable("sbatch")String sbatch,@PathVariable("sub")String sub)
	{
		
		
		
		 batchDateAdd.deleteByBdateAndBatchAndSclass(sdate, sbatch, sub);
		 
		 return "redirect:/databatch/"+sbatch+"/"+sub;
	}
	
	
	
	
	//Add Student Attendance
	
	@GetMapping("/attendance/{batchId}/{subject}")
	public ModelAndView goAttendancePage(@PathVariable("batchId")String batchId,@PathVariable("subject") String subject)
	{
		System.out.println(batchId);
		List<StudentLoginLogoutTime> satt = loginLogoutRepository.findBySbatchAndSub(batchId,subject);
		
		
		System.out.println("skjjkedkj"+satt);
		
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView();
		if(satt.isEmpty())
		{
			mv.addObject("message","Students Not Login Yet");
			mv.addObject("sbatch", batchId);
			mv.addObject("sub", subject);
			mv.setViewName("NewStudentPer");
			
		}
		else
		{
		mv.addObject("sattendance", satt);
		mv.addObject("sbatch", batchId);
		mv.addObject("sub", subject);
	
		mv.setViewName("NewStudentPer");
		
		}
		
		return mv;
	}
	
	//Delete All Student Login Logout Data By using batch and subject
	@RequestMapping("DeleteAllLoginLogout/{sbatch}/{sub}")
	public String deleteAllLoginLogout(@PathVariable("sbatch")String sbatch,@PathVariable("sub")String sub,org.springframework.ui.Model mod)
	{
		int k = loginLogoutRepository.deleteBySbatchAndSub(sbatch, sub);
		if(k>0)
		{
			mod.addAttribute("message", "All Record Deleted Sucessfully...");
			
		}
		else
		{
			mod.addAttribute("message", "Data Not Available in table");
		}
		return "redirect:/attendance/"+sbatch+"/"+sub;
	}
	
	
	
	
	
	//Store Attendance Into Database
	
	
	
	//Store Absent Attendance
	
	@RequestMapping("Next")
	public String absent()
	{
		return "redirect:/Index";
		
	}
	
	
//=======================================================================================
	
	//Add Student Page
	
	@RequestMapping("AddStudents")
	public String goAddStudentPage()
	{
		
		return "AddStudentsView";
	}

	//Insert Student Data Into Table
	
	@PostMapping("AddAllStudentData")
	public ModelAndView addStudentData(HttpServletRequest req)
	{
		
		String stuclass = req.getParameter("stuClass");
		
		String stubatch = req.getParameter("stuBatch");
		
		ModelAndView mv=new ModelAndView();
		if(stuclass.equals("Select Class")|| stubatch.equals("Select Batch"))
		{
			mv.addObject("message", "Please Select Batch And Class");
			mv.setViewName("AddStudentsView");
		}
		
		else
		{
		String pass="159MGM";
		
		double number=Math.floor(Math.random()*10000);
		
		DecimalFormat format=new DecimalFormat("0.#");
		
		String password =pass+format.format(number);
		
		AddStudentEntity stu=new AddStudentEntity();
		
		stu.setSname(req.getParameter("stuName"));
		
		stu.setSuid(req.getParameter("stuUid"));
		
		stu.setSpassword(password);
		
		stu.setSclass(req.getParameter("stuClass"));
		
		stu.setSbatch(req.getParameter("stuBatch"));
		
		student.save(stu);
		
		
		
		mv.addObject("message", "Student Added Successfully Done....");
		
		mv.setViewName("AddStudentsView");
		}
		
		
		return mv;
		
	}
	
	//Go to Student View
	
	@RequestMapping("ViewStudent")
	public String goStudentView(@ModelAttribute("stojb")List<AddStudentEntity> stulist,@ModelAttribute("msg")String message,org.springframework.ui.Model mod)
	{
		
		
		
		return "StudentViewPage";
	}
	
	//Show Student Data
	
	@PostMapping("StudentViewData")
	public String showAllStudentData(HttpServletRequest req,org.springframework.ui.Model mod,RedirectAttributes attributes)
	{
		//ModelAndView mv=new ModelAndView();
		List<AddStudentEntity> stulist = student.findBySclassAndSbatch(req.getParameter("stuClass"), req.getParameter("stuBatch"));
		if(stulist.size()>0)
		{
		
		//mv.addObject("stobj", stulist);
		//mod.addAttribute("stobj", stulist);
		attributes.addFlashAttribute("stobj", stulist);
		//mv.setViewName("StudentViewPage");
		}
		else
		{
			//mod.addAttribute("msg", "Data Not Found");
			attributes.addFlashAttribute("msg", "Data Not Found");
		}
		return "redirect:/ViewStudent";
	}
	
	/*
	//Go Home Admin
	@RequestMapping("GoHomeAdmin")
	public String goHomeAdmin()
	{
		return "redirect:/AdminDashbord";
	}
	
	*/
	
	
	
	//Update Student Records
	
	@RequestMapping("/update/{updateId}")
	public ModelAndView goUpdateStudent(@PathVariable("updateId") String suid)
	{
		Optional<AddStudentEntity> st = student.findById(suid);
		ModelAndView mv=new ModelAndView();
		
		if(st.isPresent())
		{
			AddStudentEntity stu = st.get();
			mv.addObject("stUpdate", stu);
			mv.setViewName("StudentUpdatePage");
			
		}
		else
		{
			mv.setViewName("Error");
		}
		
		return mv;
	}
	
	//Update Student Record
	
	@PostMapping("/StudentUpdate")
	public String	 updateStudent(HttpServletRequest req)
	{
	
		System.out.println("Student Uid:"+req.getParameter("suid"));
		
		AddStudentEntity stu=new AddStudentEntity();
		
		stu.setSname(req.getParameter("sname"));
		stu.setSuid(req.getParameter("suid"));
		stu.setSpassword(req.getParameter("spassword"));
		stu.setSclass(req.getParameter("sclass"));
		stu.setSbatch(req.getParameter("sbatch"));

		student.save(stu);
		
		//RedirectView view=new RedirectView();
		//view.setUrl("StudentViewPage");

	//	ModelAndView mv=new ModelAndView();
	//	mv.addObject("message", "1 Record Updated Sucessfully...");
	//	mv.setViewName("ShowPop");
		
		return "redirect:/ViewStudent";
	}
	
	
	//Delete Student Record
	
	@RequestMapping("/delete/{deleteId}")
	public String deleteStudentRecord(@PathVariable("deleteId") String suid)
	{
		
		String query="delete from Student_Pratical_Attendance where suid=?";
		
		jdbcTemplate.update(query, suid);
		student.deleteById(suid);
	
		return "redirect:/ViewStudent";
		
		
		
		
	}
	
	
	//Go Student Data Page
	
	@RequestMapping("GoStudentDataPage")
	public String goStudentDatapage(HttpServletResponse res) throws IOException
	{
		
		return "ShowPop";
		
	}
	
	//Go To AddBatches Page
	
	@RequestMapping("AddBatches")
	public ModelAndView goAddBatches(@ModelAttribute("mess")String msg)
	{
		List<AddTeacherEntity> tlist = addTeacherRepository.findAll();
		ModelAndView mv=new ModelAndView();
		if(tlist.size()>0)
		{
		mv.addObject("tea",tlist);
		mv.setViewName("AddBatch");
		mv.addObject("message", msg);
		}
		else
		{
			mv.addObject("message","Data Not Found");
			mv.setViewName("AddBatch");
		}
		
		
		return mv;
	}
	
	//Store Batch Data
	
	@PostMapping("AddBatchesToTeacher")
	public String batchData(HttpServletRequest req,org.springframework.ui.Model mod,RedirectAttributes redirectAttributes)
	{
		AddBatches batch=new AddBatches();
		ModelAndView mv=new ModelAndView();
		if(req.getParameter("addbatch").equals("Select Teachers")||req.getParameter("stuSubject").equals("Select Subject")||req.getParameter("stuBatch").equals("Select Batch")||req.getParameter("stuClass").equals("Select Class"))
		{
			redirectAttributes.addFlashAttribute("mess", "Please Select All Options");
		mod.addAttribute("message", "Please Select All Options");
		}
		else
		{
		batch.setTname(req.getParameter("addbatch"));
		batch.setSubject(req.getParameter("stuSubject"));
		batch.setSbatch(req.getParameter("stuBatch"));
		batch.setSclass(req.getParameter("stuClass"));
		
		//batch.setSr(seq_person.nextval);
		
		bat.save(batch);
	
		redirectAttributes.addFlashAttribute("mess","Batch Added Successfully");

		}
	
	
	
		
		return "redirect:/AddBatches";
	}
	
	//View Teachers Batches
	@RequestMapping("ViewBatches")
	public ModelAndView viewTeachersBatches()
	{
		
		ModelAndView mv=new ModelAndView();
		List<AddBatches> all = bat.findAll();
		if(all.size()>0)
		{
			mv.addObject("allbatches", all);
			mv.setViewName("ViewBatches");
		}
		else
		{
			mv.addObject("msg", "Data Not Found");
			mv.setViewName("ViewBatches");
		}
		
		return mv;
	}
	
	//Delete Teacher Batches 
	@RequestMapping("batchdelete/{tname}/{subject}/{sbatch}")
	public String teacherDeleteBatches(@PathVariable("tname")String tname,@PathVariable("subject")String subject,@PathVariable("sbatch")String sbatch,org.springframework.ui.Model mod)
	{
		
		int k = bat.deleteByTnameAndSubjectAndSbatch(tname, subject, sbatch);
		
		return "redirect:/ViewBatches";
		
	}
	
	
	
	//Student Login Details
	
	//Go to Student Login Page
	
	@RequestMapping("StudentLogin")
	public String goStudentLogin()
	{
		
		
		return "StudentLogin";
	}
	
	//Login Student With User and Password
	
	@PostMapping("StudentLoginPage")
	public ModelAndView loginStudent(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String sid=req.getParameter("sid");
		String sub=req.getParameter("stuSubject");
		String stubatch = req.getParameter("stuBatch");
	    String adddate=null;
		
	 
			String dd = req.getParameter("sdate");
			
			Optional<String> op = Optional.ofNullable(dd);
			if(op.isPresent())
			{
			
				String pp = op.get();
			String[] sp = pp.split("-");
			String year = sp[0];
		String month = sp[1];
	    String 	day=sp[2];
	    
	     adddate=day+"-"+month+"-"+year;
	     
	     System.out.println("Student date show me :"+adddate);
	     
			}
	    ModelAndView mv=new ModelAndView();
	     
	    BatchDate byBdate = batchDateAdd.findByBatchAndBdateAndSclass(stubatch, adddate, sub);
	    
	    if(byBdate!=null)
	    {
	    
	    if(adddate.equals(byBdate.getBdate()) && sub.equals(byBdate.getSclass()) && stubatch.equals(byBdate.getBatch()))
	    {
		
		
		AddStudentEntity slist = student.findBySuidAndSpassword(req.getParameter("sid"), req.getParameter("spassword"));
		
	System.out.println("Student Object:"+slist);
		
		
		//Optional<AddStudentEntity> check = Optional.of(slist);
		
		if(slist==null)
		{
		
			
			mv.addObject("message", "Student Login Fail");
		mv.setViewName("StudentLogin");
			
		}
		else
		{
			serviceClass.studentLoginTime(sid,sub);
			//AddStudentEntity list = check.get();
			String sname = slist.getSname();
			String sbatch = slist.getSbatch();
			String sclass = slist.getSclass();
			
			
			mv.addObject("suid", sid);
			mv.addObject("subject", sub);
			mv.addObject("stuname", sname);
			mv.addObject("stubatch", sbatch);
			mv.addObject("stuclass", sclass);
			mv.setViewName("StudentDashbord");
			
		}
		
	    }
	   
	    }
	    else
	    {
	    	mv.addObject("message", "Student Login Faild");
			mv.setViewName("StudentLogin");
	    }
		return mv;
	}
	
	//Student Logout Date
	
	@RequestMapping("/StudentLogout/{sid}/{subject}")
	public String studentLogout(@PathVariable("sid") String suid,@PathVariable("subject") String subject)
	{
	
		
		
		
		
		
		 serviceClass.studentLogoutTime(suid,subject);
		
		System.out.println("Subject Logout:"+subject);
		
		
		StudentLoginLogoutTime bySuid = loginLogoutRepository.findBySuid(suid);
		
		String stuid=null;
		String studate=null;
		String qery="select *from Student_Pratical_Attendance where suid=? and pdate=?";


		System.out.println("Login time="+bySuid.getLogintime());


		String calculate=bySuid.getLogintime();
		String callogout = bySuid.getLogouttime();

		String[] split = calculate.split(":");

		String sp = split[0];
		String mi = split[1];
		
		
		int hourlogin=Integer.parseInt(sp);
		if(hourlogin>12)
		{
			hourlogin=hourlogin-12;
		}
		
		int minlogin=Integer.parseInt(mi);

		String[] split1 = callogout.split(":");

		String splog = split1[0];
		String milog = split1[1];
        
		int hourlog=Integer.parseInt(splog);
		if(hourlog>12)
		{
			hourlog=hourlog-12;
		}
		
		
		int minlog=Integer.parseInt(milog);

		int result=hourlog-hourlogin;
		System.out.println("Result p="+result);
		int minute=0;
		if(minlogin>minlog)
		{
			minute=minlogin-minlog;
		}
		else
		{
			minute=minlog-minlogin;
		}
		
		
		int caltime=((hourlog-hourlogin)*60)+minute;
		
		System.out.println("Result final="+caltime);
		
ModelAndView mv=new ModelAndView();		
		String sid=null;
		String sname=null;
		String sdate=null;
		String ssub=null;
		String att=null;
		String logtime=null;

		String logindate = bySuid.getLogindate();
		
		System.out.println("What is login date:"+logindate);
	
List<StudentAttendance> list = jdbcTemplate.query(qery,  new BeanPropertyRowMapper<StudentAttendance>(StudentAttendance.class),suid ,logindate);
System.out.println("Option class object:"+list);
	
		
if(list.size()==0)
{
	
if(caltime>=2)
{
	
 sid=suid;
sname=bySuid.getSname();
sdate=bySuid.getLogindate();



ssub=bySuid.getSub();
att="Present";
logtime=String.valueOf(caltime)+"MIN";
	
}
else
{
	
sid=suid;
sname=bySuid.getSname();
sdate=bySuid.getLogindate();
ssub=bySuid.getSub();
att="Absent";

logtime=String.valueOf(caltime)+" Min";
	
}
		

	String query="insert into Student_Pratical_Attendance values(?,?,?,?,?,?)";
	
	 jdbcTemplate.update(query, sid,sname,sdate,att,ssub,logtime);
		
		//attendanceRepository.save(stu);
		mv.addObject("message", "Attendance Done Successfully...");
		mv.setViewName("Error");

System.out.println("************************************************");


 
	
		
}	
		
		
		
		
	
		
		return "redirect:/Index";
	}
	


	
	//==================================Exception Method======================================================
	
	//Exception Handler Method
	
	@ExceptionHandler(value=Exception.class)
	public String HandleExecption(org.springframework.ui.Model md)
	{
		md.addAttribute("message", "Oops! The page you are looking for does not exist.");
		
		return "ExceptionMessage";
	}
	
	
	//Go to Home
	@RequestMapping("GoHomeException")
	public String GoHomeException()
	{
		return "Index";
	}
	
	@ExceptionHandler(value=DuplicateKeyException.class)
	public String duplicateHandleExecption(org.springframework.ui.Model md)
	{
		md.addAttribute("message", "Oops! The page you are looking for does not exist.");
		
		return "ExceptionMessage";
	}
	
	//==================================================================================================








@GetMapping("/present/{studentId}/{stulogindate}")
public ModelAndView storedata(@PathVariable("studentId")String suid,@PathVariable("stulogindate")String stulogindate,HttpServletResponse res) throws IOException//@PathVariable("studentUid")String suid
{
	
StudentLoginLogoutTime bySuid = loginLogoutRepository.findBySuid(suid);

	
	String stuid=null;
	String studate=null;
	
	//Optional<StudentAttendanceEntity> op = attendanceRepository.findById(suid);
	
	String qery="select *from Student_Pratical_Attendance where suid=? and pdate=?";
	
	ModelAndView mv=new ModelAndView();
String sid=suid;
String sname=bySuid.getSname();
String sdate=bySuid.getLogindate();
String ssub=bySuid.getSub();
String att="Present";
	
	 List<StudentAttendance> list = jdbcTemplate.query(qery,  new BeanPropertyRowMapper<StudentAttendance>(StudentAttendance.class),suid ,stulogindate);
	 System.out.println("Option class object:"+list);

	 if(list.size()>0)
	 {
		 
	 StudentAttendance stuatt = list.get(0);
System.out.println("get object:"+stuatt);
	 

stuid=stuatt.getSuid();
studate=stuatt.getPdate();



//com.CollegProject.EntityClassess.StudentAttendance 

//System.out.println("Option class object:"+queryForObject);

//Optional<StudentAttendance> op = Optional.of(stuatt);
/*
	if(op.isPresent())
	{
		StudentAttendance stu = op.get();
		stuid=stu.getSuid();
		studate=stu.getPdate();
		System.out.println("sid:"+stuid+" sdate:"+studate);
	
*/
RedirectView rv=new RedirectView();
if(stuid.equals(sid) && studate.equals(sdate))
{
	mv.addObject("mess", "Attendance Already Done....");
//mv.setViewName("redirect:/NewStudentPer");
	mv.setViewName("NewStudentPer");
	
	System.out.println("kjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
}
else
{
String query="insert into Student_Pratical_Attendance values(?,?,?,?,?)";
	
 jdbcTemplate.update(query, sid,sname,sdate,att,ssub);
	
	//attendanceRepository.save(stu);
	mv.addObject("message", "Attendance Done Successfully...");
	mv.setViewName("Error");
	
	System.out.println("============================================================");
}
	 }

else
{

	String query="insert into Student_Pratical_Attendance values(?,?,?,?,?)";
	
	 jdbcTemplate.update(query, sid,sname,sdate,att,ssub);
		
		//attendanceRepository.save(stu);
		mv.addObject("message", "Attendance Done Successfully...");
		mv.setViewName("Error");

System.out.println("************************************************");

}
 
		
	
	 
	
	
	return mv;
	
}

/*
@GetMapping("/absent/{studentId}/{stulogindate}")
public ModelAndView storeStudentAbsent(@PathVariable("studentId")String suid,@PathVariable("stulogindate")String stulogindate,HttpServletResponse res) throws IOException//@PathVariable("studentUid")String suid
{
	
StudentLoginLogoutTime bySuid = loginLogoutRepository.findBySuid(suid);
	
String stuid=null;
String studate=null;
String qery="select *from Student_Pratical_Attendance where suid=? and pdate=?";




//System.out.println("Batch Id:"+suid);
//System.out.println("attjhjd="+bySuid);
	StudentAttendanceEntity stu=new StudentAttendanceEntity();
	
	ModelAndView mv=new ModelAndView();
	
String sid=suid;
String sname=bySuid.getSname();
String sdate=bySuid.getLogindate();
String ssub=bySuid.getSub();
String att="Absent";
	
System.out.println("Login time="+bySuid.getLogintime());


String calculate=bySuid.getLogintime();
String callogout = bySuid.getLogouttime();

String[] split = calculate.split(":");

String sp = split[0];
String mi = split[1];
int hourlogin=Integer.parseInt(sp);
int minlogin=Integer.parseInt(mi);

String[] split1 = callogout.split(":");

String splog = split1[0];
String milog = split1[1];

int hourlog=Integer.parseInt(splog);
int minlog=Integer.parseInt(milog);

int result=hourlog-hourlogin;
System.out.println("Result p="+result);
int minute=0;
if(minlogin>minlog)
{
	minute=minlogin-minlog;
}
else
{
	minute=minlog-minlogin;
}

int caltime=((hourlog-hourlogin)*60)+minute;
System.out.println("Result final="+caltime);


List<StudentAttendance> list = jdbcTemplate.query(qery,  new BeanPropertyRowMapper<StudentAttendance>(StudentAttendance.class),suid ,stulogindate);
System.out.println("Option class object:"+list);

if(list.size()>0)
{

StudentAttendance stuatt = list.get(0);
System.out.println("get object:"+stuatt);


stuid=stuatt.getSuid();
studate=stuatt.getPdate();

if(stuid.equals(sid) && studate.equals(sdate))
{
	mv.addObject("message", "Attendance Already Done....");
	mv.setViewName("Error");
	//res.sendRedirect("NewStudentPer");
	System.out.println("kjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
}
else
{
String query="insert into Student_Pratical_Attendance values(?,?,?,?,?)";
	
 jdbcTemplate.update(query, sid,sname,sdate,att,ssub);
	
	//attendanceRepository.save(stu);
	mv.addObject("message", "Attendance Done Successfully...");
	mv.setViewName("Error");
	
	System.out.println("============================================================");
}
	 }

else
{

	String query="insert into Student_Pratical_Attendance values(?,?,?,?,?)";
	
	 jdbcTemplate.update(query, sid,sname,sdate,att,ssub);
		
		//attendanceRepository.save(stu);
		mv.addObject("message", "Attendance Done Successfully...");
		mv.setViewName("Error");

System.out.println("************************************************");

}
 



	
	
	
	
	return mv;
	
}

*/

@RequestMapping(value="/StudentAbsent/{sid}/{sname}/{sub}/{logdate}/{batch}",method=RequestMethod.GET)
public String insertAbsentAtt(@PathVariable("sid")String sid,@PathVariable("sname")String sname,@PathVariable("sub")String sub,@PathVariable("logdate")String logdate, @PathVariable("batch")String batch, org.springframework.ui.Model mod,RedirectAttributes redirectAttributes)
{
	/*
	StudentAttendanceEntity stu=new StudentAttendanceEntity();
	stu.setSuid(sid);
	stu.setSname(sname);
	stu.setSub(sub);
	stu.setPdate(logdate);
	stu.setLogtime("0 MIN");
	stu.setAttendance("Absent");
	*/
	String att="Absent";
	String logtime="0 MIN";
	///${sub}/${batch}/${logdate}
	System.out.println("SSid:"+sid);
	System.out.println("Sname:"+sname);
	System.out.println("SSubject"+sub);
	//System.out.println("SSbatch:"+batch);
	System.out.println("Login Date:"+logdate);
	//String batch="FYBCS-A3";
	String msg=null;
	StudentAttendanceEntity bySuidAndSub = attendanceRepository.findBySuidAndSubAndPdate(sid, sub, logdate);
	
	if(bySuidAndSub==null)
	{

		String query="insert into Student_Pratical_Attendance values(?,?,?,?,?,?)";
		
		 jdbcTemplate.update(query, sid,sname,logdate,att,sub,logtime);
		//attendanceRepository.save(stu);
		
		msg=sname+" Attendance Successfully Done....";
	}
	else
	{
		msg=sname+" Already Attenance Done....";
	}
	redirectAttributes.addFlashAttribute("ddd", logdate);
	redirectAttributes.addFlashAttribute("sub", sub);
	redirectAttributes.addFlashAttribute("batch", batch);
	redirectAttributes.addFlashAttribute("message", msg);
	
	return "redirect:/viewAttStu";
	
}







@GetMapping("/check")
public String ckeckPage()
{
	
	
	return "redirect:/Index";
}


@RequestMapping("/BackAdminDashbord")
public String goAdminDashbord()
{
	
	return "AdminDashbord";
}


//View Student Profile Page

@RequestMapping("viewstudentprofile/{suid}/{subject}/{sname}/{sbatch}")
public ModelAndView goStudentProfile(@PathVariable("suid")String suid,@PathVariable("subject")String subject,@PathVariable("sname") String sname,@PathVariable("sbatch")String sbatch)
{
	
	//List<StudentAttendanceEntity> studentAtt = attendanceRepository.findBySuidAndSub(suid, subject);
	String att="Present";
	long cou = attendanceRepository.countBySuidAndSubAndAttendance(suid,subject,att);
	
	String abs="Absent";
	long absent = attendanceRepository.countBySuidAndSubAndAttendance(suid,subject,abs);
	System.out.println("Student Absent:"+absent);
	
	String ss=suid;
	String qua="select *from Student_Pratical_Attendance where suid=? And sub=?";

	long totaldate = batchDateAdd.countByBatchAndSclass(sbatch, subject);
	String attpra=null;
	System.out.println("Total Date:"+totaldate);
	if(cou>0)
	{
	double per=totaldate/cou;
	System.out.println("Per"+per);
	
	double pp=100/per;
	
	double result=Math.round(pp*100)/100.0;
	 attpra=result+" %";
	}
	else
	{
		
		 attpra="0.0"+" %";
	}
	System.out.println("Result:"+attpra);
    
	
	
	
	//List<StudentAttendance> list = jdbcTemplate.query(qua, new BeanPropertyRowMapper<StudentAttendance>(StudentAttendance.class));
	List<StudentAttendance> list = jdbcTemplate.query(qua, new BeanPropertyRowMapper<StudentAttendance>(StudentAttendance.class),suid,subject);
	
	//System.out.println("Student Object:"+studentAtt);
	
	//Optional<StudentAttendanceEntity> op = attendanceRepository.findById(suid);
	
	//StudentAttendance st = list.
	//String sname = st.getSname();
	
	
	
	
	ModelAndView mv=new ModelAndView();
	if(list.isEmpty())
	{
		mv.addObject("stuId", suid);
		mv.addObject("sub", subject);
		mv.addObject("stuname", sname);
		mv.setViewName("StudentViewProfile");
	}
	else
	{
		//mv.addObject("stuName", sname);
		mv.addObject("stuId", suid);
		mv.addObject("sub", subject);
		mv.addObject("stuname", sname);
		mv.addObject("present", cou);
		mv.addObject("stuabs", absent);
		mv.addObject("total", totaldate);
		mv.addObject("percentage", attpra);
		mv.addObject("stuAtt", list);
		mv.setViewName("StudentViewProfile");
	}
	
	return mv;
}

@RequestMapping("/StudentAttBatch/{sub}")
public String stuAttCheck(@PathVariable("sub")String sub,org.springframework.ui.Model mod)
{
    
LocalDate date=LocalDate.now();
		
	
		
		String loginDate= date.getDayOfMonth()+"-"+date.getMonth()+"-"+date.getYear();
	
	
		
	List<StudentAttendanceEntity> stuatt = attendanceRepository.findBySubAndPdate(sub, loginDate,Sort.by(Direction.ASC, "suid"));
	
		
		mod.addAttribute("stu", stuatt);
	
		
		return "redirect:/NewStudentPer";
	
	
}

@RequestMapping("/CheckAtt/{subject}/{sbatch}")
public String goCheckAtt(@PathVariable("subject")String subject,@PathVariable("sbatch")String sbatch, org.springframework.ui.Model mod)
{
	mod.addAttribute("sub", subject);
	mod.addAttribute("batch", sbatch);
	return "checkStuAtt";
}
@RequestMapping("/viewAttStu")
public String goCheckAttStu(@ModelAttribute("ddd")String ddd,@ModelAttribute("sub")String stusub,@ModelAttribute("batch")String sbatch,@ModelAttribute("message")String msg,  HttpServletRequest req,org.springframework.ui.Model mod)
{

	

	String last=null;
	String middle=null;
	int month=0;
	String first=null;
	String data=null;
	

	
	System.out.println("Second Date:"+ddd);
	String sdate=req.getParameter("d1");

	System.out.println("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD:"+sdate);
	
	
	if(sdate==null)
	{
		data=ddd;
	}
	else
	{
		String[] split = sdate.split("-");
		
		 last=	split[0];
		 
		 middle=	split[1];
		
		month=Integer.parseInt(middle);
		 first=	split[2];
	
	

String monthString;
switch (month) {
    case 1:  monthString = "JANUARY";       break;
    case 2:  monthString = "February";      break;
    case 3:  monthString = "March";         break;
    case 4:  monthString = "April";         break;
    case 5:  monthString = "May";           break;
    case 6:  monthString = "JUNE";          break;
    case 7:  monthString = "July";          break;
    case 8:  monthString = "August";        break;
    case 9:  monthString = "September";     break;
    case 10: monthString = "October";       break;
    case 11: monthString = "November";      break;
    case 12: monthString = "DECEMBER";      break;
    default: monthString = "Invalid month"; break;
}

//System.out.println(monthString);


 data=first+"-"+monthString+"-"+last;
 
 System.out.println("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK:"+data);
	
	}
	LocalDate date=LocalDate.now();
	
	System.out.println(data);
	
	
	List<StudentAttendanceEntity> byPdate = attendanceRepository.findByPdate(data);
	if(byPdate==null)
	{
		System.out.println("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
	}

	Iterator<StudentAttendanceEntity> it = byPdate.iterator();
	
	while(it.hasNext())
	{
		System.out.println("Iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii:"+it.next());
	}
	
	
	List<StudentAttendanceEntity> list=null;
  String msgprint=null;
	String batch = null;
	String subject=null;
	String sub=req.getParameter("stusub");
	
	if(sub==null)
	{
		 list = attendanceRepository.findBySubAndPdate(stusub, data,Sort.by(Direction.ASC, "suid"));
		  subject=stusub;
		  batch=sbatch;
		  msgprint=msg;
		
	}
	else
	{
		list = attendanceRepository.findBySubAndPdate(sub, data,Sort.by(Direction.ASC, "suid"));
		 subject=req.getParameter("stusub");
			 batch = req.getParameter("sbatch");
	}

	
	
	
	
	System.out.println("List object:"+list);
	
	RedirectView rv=new RedirectView();
	if(list.isEmpty())
	{
		List<AddStudentEntity> bySbatch = student.findBySbatch(batch);
		if(bySbatch.size()>0)
		{
		mod.addAttribute("allstu", bySbatch);
		}
		mod.addAttribute("msg", "Student Not Login Today");
		  mod.addAttribute("sub", subject);
		mod.addAttribute("batch", batch);
		mod.addAttribute("logdate", data);
	}
	else
	{
		
    mod.addAttribute("sub", subject);
	mod.addAttribute("stulist", list);
	mod.addAttribute("logdate", data);
	mod.addAttribute("batch", batch);
	mod.addAttribute("message", msgprint);
	List<AddStudentEntity> bySbatch = student.findBySbatch(batch);
	if(bySbatch.size()>0)
	{
	mod.addAttribute("allstu", bySbatch);
	}

	}
	
	
	
	System.out.println(req.getParameter("d1")+"===="+req.getParameter("stusub"));
	return "checkStuAtt";
}


//Pratical Back Page

@RequestMapping("/PraticalBack")
public String goPraticalBack()
{





	return "redirect:/Pratical_Incharge_Dashbord";
}




}














