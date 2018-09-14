package cv.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cv.dto.CompaniesList;
import cv.models.Batch;
import cv.models.CVStudent;
import cv.models.NotificationHolder;
import cv.services.AdminService;
import cv.services.StudentService;
@Controller
public class IndexController {
	
	cv.services.BatchService batchService;
	private StudentService studentService;
	private AdminService adminService;

	public cv.services.BatchService getBatchService() {
		return batchService;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setBatchService(cv.services.BatchService batchService) {
		this.batchService = batchService;
	}

	@RequestMapping("/")
	public ModelAndView homePage(HttpServletRequest request)
	{
		final ModelAndView mv;
		
		if(request.getSession().getAttribute("admin")!=null)
		{
			
			
		mv= new ModelAndView("adminDashBoard");
		List<Batch> batches= batchService.getBatches();
		mv.addObject("batches", batches);
		mv.addObject("java", batchService.getTopicsBySubject("Java"));
		mv.addObject("math", batchService.getTopicsBySubject("Math"));
		mv.addObject("linux", batchService.getTopicsBySubject("Linux"));
		mv.addObject("comms", batchService.getTopicsBySubject("Comms"));
		mv.addObject("notifications",batchService.getNotifications());
		}
		else if(request.getSession().getAttribute("student")!=null)
		{
			CVStudent st=(CVStudent)request.getSession().getAttribute("student");
			System.out.println("testing testing");
			mv= new ModelAndView("studentDashBoard");
			
			Thread runFirst=new Thread(new Runnable() {
			
					@Override
					public void run() {
			mv.addObject("java", batchService.getTopicsBySubject("Java"));
			mv.addObject("math", batchService.getTopicsBySubject("Math"));
			mv.addObject("linux", batchService.getTopicsBySubject("Linux"));
			mv.addObject("comms", batchService.getTopicsBySubject("Comms"));
			mv.addObject("qpAvail", studentService.getQuestionPapersForExam(""+st.getBatchNumber(), st.getEmail(),"Multiple"));
			mv.addObject("qaqpAvail", studentService.getQuestionPapersForExam(""+st.getBatchNumber(), st.getEmail(),"QA"));
		    mv.addObject("qpDone", studentService.getQuestionPapersDone(st.getEmail()));
		    mv.addObject("notification",studentService.getNotification(","+st.getBatchNumber()+","));
		    
		   // System.out.println("test waiting");
					}
		});
			
			runFirst.start();
		    
			
		    mv.addObject("JavaFiles",studentService.getFilesBySubject("Java",st.getBatchNumber()));
		    //System.out.println("next");
		    mv.addObject("MathFiles",studentService.getFilesBySubject("Math",st.getBatchNumber()));

		    mv.addObject("MySQLFiles",studentService.getFilesBySubject("MySQL",st.getBatchNumber()));
		    mv.addObject("CommsFiles",studentService.getFilesBySubject("Comms",st.getBatchNumber()));
		    mv.addObject("OthersFiles",studentService.getFilesBySubject("Others",st.getBatchNumber()));

		    mv.addObject("LinuxFiles",studentService.getFilesBySubject("Linux",st.getBatchNumber()));

		    
		    mv.addObject("studentsInGame", studentService.getLeadBoard());
            
		    try {
				runFirst.join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
			mv=new ModelAndView("index");
	
		
		
		return mv;
	}

	@RequestMapping("/Logout")
	public ModelAndView Logout(HttpServletRequest request)
	{
        ModelAndView mv=new ModelAndView("index");
		
		if(request.getSession().getAttribute("admin")!=null)
		{
		     request.getSession().invalidate();
		}
		else if(request.getSession().getAttribute("student")!=null)
		{
			 request.getSession().invalidate();
		}
	
		return mv;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	@RequestMapping(value="/temporaryStudentRegestration",method=RequestMethod.GET)
	public ModelAndView tempRegister()
	{
		return new ModelAndView("register");
	}
	
	@RequestMapping(value="/forgotAdminPassword/{email}/{any}", method=RequestMethod.GET)
	public @ResponseBody String forgotAdminPassword(@PathVariable String email)
	{
		
		return adminService.forgotPassword(email);
	}
	
	@RequestMapping(value="/getNotificationsByBatch/{batch}", method=RequestMethod.GET)
	public @ResponseBody NotificationHolder getNotificationsByBatch(@PathVariable int batch)
	{
		NotificationHolder obj=new NotificationHolder();
		obj.setNotificationList(batchService.getNotificationsByBatch(batch));
		return obj;
	}
	
	@RequestMapping(value="/forgotStudentPassword/{email}/{any}", method=RequestMethod.GET)
	public @ResponseBody String forgotStudentPassword(@PathVariable String email)
	{
		return studentService.forgotPassword(email);
	}
	@RequestMapping(value="/updateMyData",method=RequestMethod.GET)
	public ModelAndView temporeryStudentDataUpdationForm()
	{
		return new ModelAndView("DataUpdation");
	}
	
	@RequestMapping(value="/updateMath",consumes="Application/JSON",produces="Application/JSON",method=RequestMethod.POST)
	public @ResponseBody String updateData(@RequestBody String reqBody)
	{
		System.out.println(reqBody);
		return studentService.updateData(reqBody);
		
	}
	
	@RequestMapping(value="/updateDrive",consumes="Application/JSON",produces="Application/JSON",method=RequestMethod.POST)
	public @ResponseBody String updateDrive(@RequestBody String reqBody)
	{
		System.out.println(reqBody);
		return studentService.updateDrive(reqBody);
		
	}
	
	@RequestMapping(value="/companies/{str}",produces="Application/JSON",method=RequestMethod.GET)
	public @ResponseBody CompaniesList getCompanies(@PathVariable("str") String str)
	{
	
		return studentService.getCompanies(str);
		
	}
	
}
