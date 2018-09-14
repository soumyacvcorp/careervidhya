package cv.controllers;


import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cv.dto.BatchesList;
import cv.dto.CVStudentAttDashbord;
import cv.dto.CVStudentAttDashbordList;
import cv.dto.Company;
import cv.dto.DetailedReports;
import cv.dto.DriveStatus;
import cv.dto.DriveStatuses;
import cv.dto.Faculty;
import cv.dto.FacultyList;
import cv.dto.MailData;
import cv.dto.MailSendAttDashbord;
import cv.dto.TopicListOfAttanceList;
import cv.models.Admin;
import cv.models.Batch;
import cv.models.CVStudent;
import cv.models.CVStudentAtt;
import cv.models.DateReport;
import cv.models.EditStudentDriveRound;
import cv.models.OfflineExam;
import cv.models.OfflineExamContainer;
import cv.models.OfflineExamScore;
import cv.models.PlacementDrive;
import cv.models.PlacementDriveCompany;
import cv.models.PlacementDriveList;
import cv.models.QAAnswersList;
import cv.models.QAQuestion;
import cv.models.QAQuestionsList;
import cv.models.Question;
import cv.models.QuestionPaper;
import cv.models.QuestionPapersList;
import cv.models.QuestionsList;
import cv.models.StudentDriveReportList;
import cv.models.StudentsAttList;
import cv.models.StudentsList;
import cv.models.Topic;
import cv.models.TopicComHolder;
import cv.models.TopicComp;
import cv.models.TopicHolder;
import cv.models.TopicsList;
import cv.services.AdminService;
import cv.services.BatchService;
import cv.services.QAQuestionService;
import cv.services.QuestionPaperService;
import cv.services.QuestionService;
import cv.services.StudentService;







/* Considering few requests / services and application being not role based app
security is hard coded at every request
In fact security is independent and can be removed or modified for future enhancements
Security is a session based security.
*/


@Controller
public class AdminController {

	AdminService adminService;
	QuestionService questionService;
	QuestionPaperService questionPaperService;
	QAQuestionService qaQuestionService;
	
	BatchService batchService;
	
    
	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	public void setQuestionService(QuestionService questionService)
	{
		this.questionService=questionService;
	}
	public QuestionService getQuestionService()
	{
		return questionService;
	}
	public QAQuestionService getQaQuestionService() {
		return qaQuestionService;
	}
	public void setQaQuestionService(QAQuestionService qaQuestionService) {
		this.qaQuestionService = qaQuestionService;
	}
	public QuestionPaperService getQuestionPaperService() {
		return questionPaperService;
	}
	public void setQuestionPaperService(QuestionPaperService questionPaperService) {
		this.questionPaperService = questionPaperService;
	}
	
	
	@RequestMapping(value="/adminLogin",method=RequestMethod.POST)
	public ModelAndView adminLogin(@RequestParam("email") String email,@RequestParam("password") String password,HttpServletRequest request)
	{
		ModelAndView mv;
		
		
		if(adminService.validateAdmin(email, password,request))
		{
			mv=new ModelAndView("redirect:/");
			return mv;
		}
		else
		{
			mv=new ModelAndView("index");
			mv.addObject("errorA", "!Authentication failure");
			return mv;
		}
	}
	@RequestMapping(value="/registerStudent",method=RequestMethod.GET)
	public @ResponseBody String registerStudent(@ModelAttribute("std")CVStudent st,HttpServletRequest request)
	{
		
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		
		
		boolean status=adminService.registerStudent(st);
		System.out.println(st);
		String notification="You "+st.getFullName()+" are Registered Successfully Under Batch No"+st.getBatchNumber();
		if(!status)
			notification="Oops! something went wrong, Student not registered successfully may be for the following cause. Student email already registered."
					+ "You might be entered a wrong date or format might not of type (YYYY-MM-DD)";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
    
	@RequestMapping(value="/changeAdminPassword",method=RequestMethod.POST)
	public @ResponseBody String changePassword(@RequestParam("oldPassword")String oldPassword,@RequestParam("newPassword")String newPassword,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		
		String notification="Password changed successfully Login with your new Password in next login";
		boolean status=adminService.changePassword(oldPassword,newPassword,request);
		System.out.println(newPassword+"  "+oldPassword+" "+status);
		if(!status)
			notification="Oops something went wrong! check your previous password";
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="/viewBatch/{batchNumber}")
	public @ResponseBody StudentsList viewStudents(@PathVariable("batchNumber")int batchNumber,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
	
		List<CVStudent> students=adminService.viewStudents(batchNumber);
		StudentsList studentsList=new StudentsList();
		studentsList.setStudentsList(students);
		return studentsList;
	}
	
	//getStudentDriveReportList
	@RequestMapping(value="/getStudentDriveReportList/{id}")
	public @ResponseBody StudentDriveReportList getStudentDriveReportList(@PathVariable("id")int id,HttpServletRequest request)
	{
		
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
	
		StudentDriveReportList studentsList=new StudentDriveReportList();
		studentsList.setStudentReportList(adminService.getStudentDriveReportList(id));
		return studentsList;
	}
	
	@RequestMapping(value="/deleteStudDriveDetails/{id}")
	public @ResponseBody String deleteStudDriveDetails(@PathVariable("id")int id,HttpServletRequest request)
	{
	
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		
		boolean b=adminService.deleteStudDriveDetails(id);
		return "{\"status\":"+b+"}";
	}
	
	@RequestMapping(value="/editStudDriveDetails/{id}",method=RequestMethod.POST)
	public @ResponseBody String editStudDriveDetails(@PathVariable("id")int id,@RequestBody EditStudentDriveRound obj,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String out=adminService.editStudDriveDetails(id,obj);
		
		return "{ \"status\":\""+out+"\"}";
	}
	
	@RequestMapping(value="/viewBatchAtt/{batchNumber}/{date}",method=RequestMethod.GET)
	public @ResponseBody StudentsAttList viewStudents(@PathVariable("batchNumber")int batchNumber,@PathVariable("date")String date, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
	
		List<CVStudentAtt> students=adminService.viewStudentsAtt(batchNumber,date);
		StudentsAttList studentsList=new StudentsAttList();
		studentsList.setStudentsList(students);
		return studentsList;
	}
	@RequestMapping(value="/getPlacementDriveList",method=RequestMethod.GET)
	public @ResponseBody PlacementDriveList getPlacementDriveList(HttpServletRequest request)
	{
	
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		List<PlacementDriveCompany> driveList=adminService.getPlacementDriveList();
		PlacementDriveList placementDriveList=new PlacementDriveList();
		placementDriveList.setPlacementDriveList(driveList);
		return placementDriveList;
	}
	
	@RequestMapping(value="/getOfflineExamList/{batchNumber}/{subject}",method=RequestMethod.GET)
	public @ResponseBody OfflineExamContainer getOfflineExamList(@PathVariable("batchNumber")int batch,@PathVariable("subject")String subject,HttpServletRequest request)
	{
		
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return  null;
		}
		
		// security
		
	
		List<OfflineExam> list=adminService.getOfflineExamList(batch,subject);
		OfflineExamContainer offlineExamList=new OfflineExamContainer();
		offlineExamList.setOfflineExamList(list);
		return offlineExamList;
	}
	
	@RequestMapping(value="/editOfflineExamScore/{id}/{score}/{remark}",method=RequestMethod.GET)
	public @ResponseBody String editOfflineExamScore(@PathVariable("id")int id,@PathVariable("score")int score,@PathVariable("remark")String remark, HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String out=adminService.editOfflineExamScore(id,score,remark);
		return "{ \"status\":\""+out+"\"}";
	}
	
	@RequestMapping(value="/addOfflineExam/{batch}/{date}/{subject}/{examtype}/{topic}/{duration}/{fullmark}",method=RequestMethod.POST)
	public @ResponseBody String addOfflineExam(@PathVariable("batch")int batch,@PathVariable("date")String date,@PathVariable("subject")String subject,
			@PathVariable("examtype")String examtype,@PathVariable("topic")String topic,@PathVariable("duration")int duration,@PathVariable("fullmark")double fullmark,@RequestBody List<OfflineExamScore> obj,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		OfflineExam exam=new OfflineExam();
		exam.setBatch(batch);
		exam.setDuration(duration);
		exam.setExamDate(date);
		exam.setExamSubject(subject);
		exam.setFullmark(fullmark);
		exam.setExamType(examtype);
		exam.setScoreList(obj);
		exam.setTopic(topic);
		String out =adminService.addOfflineExam(exam);
		System.out.println("sipu "+out);
		return "{ \"status\":\""+out+"\"}";
	}
	
	
	
	@RequestMapping(value="/viewBatchAtt/{batchNumber}/{date}",method=RequestMethod.POST)
	public @ResponseBody String setStudentssAtt(@PathVariable("batchNumber")int batchNumber,@PathVariable("date")String date,@RequestBody List<CVStudentAtt> obj, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String out =adminService.setStudentsAtt(batchNumber,date,obj);
		String chk=adminService.addWorkingDay(batchNumber, date);
		System.out.println("sipu "+out);
		return out;
	}
	
	@RequestMapping(value="/addNewStudentIntoDriveList",method=RequestMethod.POST)
	public @ResponseBody String addNewStudentIntoDriveList(@RequestBody  List<DriveStatus> obj,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String out =adminService.addNewStudentIntoDriveList(obj);
		return "{ \"status\":\""+out+"\"}";
	}
	@RequestMapping(value="/addNewPlacementDrive",method=RequestMethod.POST)
	public @ResponseBody String addNewPlacementDrive(@RequestBody  PlacementDrive obj, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		int out =adminService.addNewPlacementDrive(obj);
		String h=(out>0)?"yes":"no";
		return "{ \"status\":\""+h+"\",\"id\":"+out+"}";
	}
	
	@RequestMapping(value="/addNewCompany",method=RequestMethod.POST)
	public @ResponseBody String addNewCompany(@RequestBody  Company obj,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String out =adminService.addNewCompany(obj);
		System.out.println(" ashigyds "+obj.getURL());
		return "{ \"status\":\""+out+"\"}";
	}
	
	@RequestMapping(value="/sendBlockMsg",method=RequestMethod.POST)
	public @ResponseBody String sendBlockMsg(@RequestBody  List<MailSendAttDashbord> list,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		try {
			for(int i=0;i<list.size();i++) {
				adminService.sendMail(list.get(i).getEmail(),list.get(i).getMessage());
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "{ \"status\":\""+true+"\"}";
	}
	
	//topic update
	@RequestMapping(value="/syllabusUpdate/{batchNumber}/{subject}",method=RequestMethod.GET)
	public @ResponseBody TopicComHolder getTopicComList(@PathVariable("batchNumber")int batchNumber,@PathVariable("subject")String subject,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
	
		List<TopicComp> topic=adminService.getTopicCoveredByBatch(batchNumber,subject);
		TopicComHolder topicList=new TopicComHolder();
		topicList.setTopicComList(topic);
		return topicList;
	}
	
	@RequestMapping(value="/viewAll")
	public @ResponseBody StudentsList viewAllStudents(HttpServletResponse response,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
	
		response.setHeader("Access-Control-Allow-Origin", "*");
		List<CVStudent> students=adminService.viewAllStudents();
		StudentsList studentsList=new StudentsList();
		studentsList.setStudentsList(students);
		
		return studentsList;
	}

	@RequestMapping(value="/pushQuestion",method=RequestMethod.GET)
	public @ResponseBody String pushQuestion(@ModelAttribute("question")Question question,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		
		question.setQby(admin.getName());
		boolean status=questionService.save(question);
		String notification="New Question pushed to Database succsfully under subject"+question.getSubject();
		
		if(!status)
			notification="Oops! Something went wrong, try again or contact admin";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	
	@RequestMapping(value="/getQAQuestionsBySubject/{subject}",method=RequestMethod.GET)
	public @ResponseBody QAQuestionsList getQuestionsBySubject(@PathVariable String subject, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		System.out.println(" Testing");
		List<QAQuestion> questions=qaQuestionService.getQAQuestionsBySubject(subject);
		QAQuestionsList ql=new QAQuestionsList();
		ql.setQaQuestionsList(questions);
		System.out.println(ql+" Testing");
		return ql;
	}
	
	
	@RequestMapping(value="/getQAQuestionsByAdmin/{adminName}",method=RequestMethod.GET)
	public @ResponseBody QAQuestionsList getQAQuestionsByAdmin(@PathVariable String adminName, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		System.out.println(" Testing");
		List<QAQuestion> questions=qaQuestionService.getQAQuestionsByAdmin(adminName);
		QAQuestionsList ql=new QAQuestionsList();
		ql.setQaQuestionsList(questions);
		System.out.println(ql+" Testing");
		return ql;
	}
	
	
	@RequestMapping(value="/getQAQuestionsByQuestion/{question}",method=RequestMethod.GET)
	public @ResponseBody QAQuestionsList getQAQuestionsByQuestion(@PathVariable String question,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		System.out.println(" Testing");
		List<QAQuestion> questions=qaQuestionService.getQAQuestionsByQuestion(question);
		QAQuestionsList ql=new QAQuestionsList();
		ql.setQaQuestionsList(questions);
		System.out.println(ql+" Testing");
		return ql;
	}
	
	@RequestMapping(value="/getQuestionsByTopic/{topic}",method=RequestMethod.GET)
	public @ResponseBody QuestionsList getQuestionsByTopic(@PathVariable String topic, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		List<Question> questions=questionService.getQuestionsByTopic(topic);
		QuestionsList ql=new QuestionsList();
		ql.setQuestionsList(questions);
		return ql;
	}
	
	
	
	@RequestMapping(value="/getQuestionsByAdmin/{adminName}",method=RequestMethod.GET)
	public @ResponseBody QuestionsList getQuestionsByAdmin(@PathVariable String adminName, HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		List<Question> questions=questionService.getQuestionsByAdmin(adminName);
		QuestionsList ql=new QuestionsList();
		ql.setQuestionsList(questions);
		return ql;
	}
	
	@RequestMapping(value="/getQuestionsByQuestion/{question}",method=RequestMethod.GET)
	public @ResponseBody QuestionsList getQuestionsByQuestions(@PathVariable String question,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		List<Question> questions=questionService.getQuestionsByQuestion(question);
		QuestionsList ql=new QuestionsList();
		ql.setQuestionsList(questions);
		return ql;
	}
	
	
	
	@RequestMapping(value="/createQuestionPaper",method=RequestMethod.GET)
	public @ResponseBody String createQuestionPaper(@ModelAttribute("qp")QuestionPaper questionPaper,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		System.out.println(questionPaper);
		boolean status=questionPaperService.createPaper(questionPaper,request);
		String notification="New QuestionPaper has been created succesfully for the Batches"+questionPaper.getBatchNos();
		
		if(!status)
			notification="Oops! Something went Wrong, Try again or contact admin";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="/publishQuestionPaper",method=RequestMethod.GET)
	public @ResponseBody String publishQuestionPaper(@RequestParam("qp_id") int qp_id,@RequestParam("BatchNos") String[] batches,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
	return	questionPaperService.pushPaper(qp_id,batches);
		
	}
	
	@RequestMapping(value="/getQuestionPapers/{qp_type}")
	public @ResponseBody QuestionPapersList getQuestionPapers(@PathVariable String qp_type,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		QuestionPapersList qplist=new QuestionPapersList();
		qplist.setQuestionPapersList(questionPaperService.getQuestionPapers(qp_type,request));
	
		return qplist;
	}
	
	
	@RequestMapping(value="/viewPaper/{questions}",method=RequestMethod.GET)
	public @ResponseBody QuestionsList viewPaper(@PathVariable String questions, HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		QuestionsList ql=new QuestionsList();
		ql.setQuestionsList(questionService.getQuestions(questions));
		return ql;
	}
	
	
	@RequestMapping(value="/viewQAPaper/{questions}",method=RequestMethod.GET)
	public @ResponseBody QAQuestionsList viewQAPaper(@PathVariable String questions,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		QAQuestionsList ql=new QAQuestionsList();
		ql.setQaQuestionsList(qaQuestionService.getQuestions(questions));
		System.out.println(ql);
		return ql;
	}
	
	@RequestMapping(value="/deleteQpaper/{qp_id}",method=RequestMethod.GET)
	public @ResponseBody String deleteQpaper(@PathVariable int qp_id, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String notification="QuestionPaper Successfully Deleted";
		boolean status=questionPaperService.deleteQPaper(qp_id);
		if(!status)
			notification="Oops! You cannot Delete this Question paper since few students have already taken exam, The record has been tracked";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}

	@RequestMapping(value="/updateFee/{email}/{feePaid}")
	public @ResponseBody String updateFee(@PathVariable String email,@PathVariable int feePaid,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		
		if(admin!=null && (admin.getEmail().equals("cv@cvcorp.in") || admin.getEmail().equals("akanksha@cvcorp.in") || admin.getEmail().equals("lalitha@cvcorp.in")))
		
		return adminService.updateFee(email,feePaid);
		else 
			return "{\"status\":"+false+",\"notification\":\"Not acceptable\"}";
	}
	
	@RequestMapping(value="/pushQAQuestion",method=RequestMethod.GET)
	public @ResponseBody String pushQAQuestion(@ModelAttribute("qaQuestion")QAQuestion qaQuestion,HttpServletRequest request )
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		
		String notification="New QA type question pushed to DB successfully";
		boolean status=qaQuestionService.save(request, qaQuestion);
		if(!status)
			notification="There is a problem in pushing the question to DB";
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="/getStudentReport/{email}/{any}",method=RequestMethod.GET)
	public @ResponseBody String getStudentReport(@PathVariable String email,HttpServletRequest request){
		
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		System.out.println(email);
		return 	adminService.getStudentReport(email);
		
	}
	
	@RequestMapping(value="/sendMail",method=RequestMethod.POST)
	public @ResponseBody String sendMail(@RequestParam("message")String message,@RequestParam("recipients")String[] recipients,
			@RequestParam("ccrecipients")String[] cc,@RequestParam("subject")String subject,@RequestParam("bccrecipients")String[] bcc,
			@ RequestParam(value="studentsNames",required=false) String[] names,HttpServletRequest request){
	
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String notification="Mail Sent successfully";
		
		//System.out.println(cc[0]);
		boolean status=adminService.sendMail(recipients,cc,subject,message,bcc,names);
		
		if(!status)
			notification="There is a problem in sending the mail please contact admin";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	
	@RequestMapping(value="/sendMailJSON",consumes="Application/JSON",produces="Application/JSON",method=RequestMethod.POST)
	public @ResponseBody String sendMailJSON(@RequestBody String reqBody,@ RequestParam(value="studentsNames",required=false) String[] names, HttpServletRequest request){
	
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		 System.out.println(reqBody);
		String notification="Mail Sent successfully";
		Gson g=new Gson();
	    MailData m=g.fromJson(reqBody, MailData.class);
		
		//System.out.println(cc[0]);
		boolean status=adminService.sendMail(m.getRecipients(),m.getCcrecipients(),m.getSubject(),m.getMessage(),m.getBccrecipients(),names);
		
		if(!status)
			notification="There is a problem in sending the mail please contact admin";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	
	
	@RequestMapping(value="/getStudentsMails/{text}")
	public @ResponseBody StudentsList getStudentsMails(@PathVariable String text,HttpServletRequest request)
	{
	
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		StudentsList studentsList=new StudentsList();
		
		studentsList.setStudentsList(adminService.getStudentsMails(text));
		return studentsList;
	}
	
	
	public BatchService getBatchService() {
		return batchService;
	}

	public void setBatchService(BatchService batchService) {
		this.batchService = batchService;
	}
	
	@RequestMapping(value="/getBatches",method=RequestMethod.GET)
	public @ResponseBody BatchesList getBatches()
	{
		BatchesList l=new BatchesList();
		l.setBatches(batchService.getBatches());
		return l;
	}
	@RequestMapping(value="/getActiveBatches",method=RequestMethod.GET)
	public @ResponseBody BatchesList getActiveBatches()
	{
		BatchesList l=new BatchesList();
		l.setBatches(batchService.getActiveBatches());
		return l;
	}
	

	@RequestMapping(value="/addBatch",method=RequestMethod.GET)
	public @ResponseBody String addBatch(@ModelAttribute Batch b, HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		System.out.println("test");
		String notification="New Batch with the number "+b.getBatchNumber()+" added successfully";
		boolean status=batchService.addBatch(b);
		if(!status)
			notification="There is problem in adding batch please check details"
					+ " Check Dates or check the batch Number might already enrolled";
		System.out.println(status+"  "+notification);
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="/getProgress/{batchNumber}/{subject}",method=RequestMethod.GET)
	public @ResponseBody String getProgress(@PathVariable int batchNumber,@PathVariable String subject, HttpServletRequest request)
	{
		
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
	return	batchService.getProgress(batchNumber,subject);
		
	}
	
	@RequestMapping(value="viewFinishedTopics/{batchNumber}/{subject}",method=RequestMethod.GET)
	public @ResponseBody TopicsList viewFinishedTopics(@PathVariable int batchNumber,@PathVariable String subject, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
	return	batchService.viewFinishedTopics(batchNumber,subject);
		
	}
	
	@RequestMapping(value="viewUnFinishedTopics/{batchNumber}/{subject}",method=RequestMethod.GET)
	public @ResponseBody TopicsList viewUnFinishedTopics(@PathVariable int batchNumber,@PathVariable String subject, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
	return	batchService.viewUnFinishedTopics(batchNumber,subject);
		
	}
	
	@RequestMapping(value="getCTopicListOfAllBatch",method=RequestMethod.GET)
	public @ResponseBody TopicListOfAttanceList getCTopicListOfAllBatch(HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		TopicListOfAttanceList obj=new TopicListOfAttanceList();
		obj.setTopicList(batchService.getCTopicListOfAllBatch());
		
	return	obj;
		
	}
	
	@RequestMapping(value="/updateTopic/{batchNumber}/{topic_id}/{dateDone}",method=RequestMethod.GET)
	public @ResponseBody String updateTopic(@PathVariable int batchNumber,@PathVariable int topic_id,@PathVariable String dateDone, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String notification="Topic updated successfully"; 
		boolean status=batchService.updateTopic(batchNumber,topic_id,dateDone);
		if(!status)
			notification="There is a problem in updating Topic please check date nor contact admin";
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="editTopicCover/{topic_id}/{topicCover_id}/{dateList}",method=RequestMethod.POST)
	public @ResponseBody String editTopicCover(@PathVariable int topic_id,@PathVariable int topicCover_id,@PathVariable String dateList, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String notification="Topic updated successfully";
		boolean status=adminService.editTopicCover(topic_id,topicCover_id,dateList);
		if(!status)
			notification="There is a problem in editing Topic";
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="addTopic/{topic}/{approx}/{subject}/{flow}/{dres}/{vres}",method=RequestMethod.POST)
	public @ResponseBody String addTopic(@PathVariable String topic,@PathVariable int approx,@PathVariable String subject,@PathVariable int flow,@PathVariable String dres,@PathVariable String vres
			,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String notification="Topic updated successfully";
		boolean status=adminService.addTopic(topic,approx,subject,flow,dres,vres);
		if(!status)
			notification="There is a problem in taday updating Topic";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="addTodayTopic/{batchNumber}/{topic_id}",method=RequestMethod.POST)
	public @ResponseBody String updateToadyTopic(@PathVariable int batchNumber,@PathVariable int topic_id, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		String notification="Topic updated successfully";
		System.out.println("updateToadyTopic in");
		
		boolean status=batchService.updateTopic(batchNumber,topic_id);
		if(!status)
			notification="There is a problem in taday updating Topic";
		

		System.out.println("updateToadyTopic out");
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="updateTodayTopic/{id}",method=RequestMethod.POST)
	public @ResponseBody String updateToadyTopic(@PathVariable int id, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		
		String notification="Topic updated successfully";
		System.out.println("updateToadyTopic in");
		
		int status=batchService.updateDayListTopic(id);
		if(status!=1)
			notification="There is a problem in updating Topic dayList";
		
		System.out.println("updateToadyTopic out"+status);
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="getTopicList/{subject}",method=RequestMethod.GET)
	public @ResponseBody TopicHolder getTopicList(@PathVariable String subject, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
	
		
		if(request.getSession().getAttribute("admin")==null && request.getSession().getAttribute("student")==null)
		{
			return null;
		}
		
		// security
		
		
		TopicHolder obj=new TopicHolder();
		obj.setTopicList(batchService.getTopicList(subject));
	return	obj;
		
	}
	

	
	@RequestMapping("/verifyPresents")
	public @ResponseBody String verifyPresents(HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return adminService.presentsToVerify();
	}
	
	
	@RequestMapping("/acceptPresent/{email}/{presentDate}")
	public @ResponseBody String acceptPresents(@PathVariable String email,@PathVariable String presentDate, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return adminService.acceptPresents(email,presentDate);
		
	}
	
	@RequestMapping("/rejectPresent/{email}/{presentDate}")
	public @ResponseBody String rejectPresents(@PathVariable String email,@PathVariable String presentDate, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return adminService.rejectPresents(email,presentDate);
		
	}
	@RequestMapping(value="/addNotification",method=RequestMethod.GET)
	public @ResponseBody String addNotification(@RequestParam("notification")String notification,@RequestParam("batchNos")String[] batchNos,
			HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		System.out.println(notification);
		return adminService.addNotification(notification,batchNos,request);
	}
	
	
	@RequestMapping(value="/getStudentsListByPaper/{qp_id}",method=RequestMethod.GET)
	public @ResponseBody String getStudentsListByPaper(@PathVariable int qp_id, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return adminService.getStudentsListByPaper(qp_id);
	}
	
	@RequestMapping(value="/getStudentQAAnswerPaper/{email}/{qp_id}",method=RequestMethod.GET)
	public @ResponseBody QAAnswersList getStudentQAAnswerPaper(@PathVariable int qp_id,@PathVariable String email,HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		System.out.println("testing");
		return adminService.getStudentQAAnswerPaper(qp_id,email);
	}
	
	@RequestMapping(value="/updateAnswerScore/{id}/{score}",method=RequestMethod.GET)
	public @ResponseBody String updateAnswerScore(@PathVariable int id,@PathVariable double score, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return adminService.updateAnswerScore(id,score);
	}
	
	@RequestMapping(value="/uploadFile",method=RequestMethod.POST)
	public @ResponseBody String fileUpload(@RequestParam("file") MultipartFile file,@RequestParam("fileName") String fileName,
			@RequestParam("subject")String subject,@RequestParam("batchNos")String[] BatchNos,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		System.out.println(file.getContentType());
		System.out.println(file.getName());
		return adminService.fileUpload(file,fileName,subject,BatchNos,request,file.getContentType());
	}
	
	@RequestMapping(value="/downloadResume/{email}/{any}",method=RequestMethod.GET)
	public ModelAndView downloadResume(@PathVariable String email,HttpServletResponse response, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		 ModelAndView model=new ModelAndView("errorPage");
		byte[] file=adminService.downloadResume(email);
		try {
			if(file!=null){
			response.setContentType("application/msword");
			OutputStream stream=response.getOutputStream();
			
			stream.write(file);
			stream.close();
			}
		} 
		catch (IOException| NullPointerException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			 model=new ModelAndView("errorPage");
		}
		return model;
	}
	
	@RequestMapping(value="/getTopicsList/{subject}/{topic}",method=RequestMethod.GET)
	public @ResponseBody String getTopicsList(@PathVariable String subject,@PathVariable String topic,
			HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
	    if(!topic.equals("nouse"))	
		return adminService.getTopicsList(subject,topic);
	    else
	    	return adminService.getTopicsList(subject,"");
	}
	
	@RequestMapping(value="/getTopicsListQA/{subject}/{topic}",method=RequestMethod.GET)
	public @ResponseBody String getTopicsListQA(@PathVariable String subject,@PathVariable String topic,
			HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
	    if(!topic.equals("nouse"))	
		return adminService.getTopicsListQA(subject,topic);
	    else
	    	return adminService.getTopicsListQA(subject,"");
	}
	
	@RequestMapping(value="/getQuestionsByTopicQA/{topic}",method=RequestMethod.GET)
	public @ResponseBody QAQuestionsList getQuestionsByTopicQA(@PathVariable String topic, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		List<QAQuestion> questions=questionService.getQuestionsByTopicQA(topic);
		QAQuestionsList ql=new QAQuestionsList();
		ql.setQaQuestionsList(questions);
		return ql;
	}
	
	@RequestMapping(value="/createRandomPaper/{subject}/{type}",method=RequestMethod.GET)
	public @ResponseBody String createRadomPaper(@PathVariable String subject,
			@PathVariable String type,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return questionPaperService.createRandomPaper(subject,type,request);
	}
	
	@RequestMapping(value="/updateQuestion",method=RequestMethod.POST)
	public @ResponseBody String updateQuestion(@ModelAttribute("question") Question question, HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		return questionService.updateQuestion(question);
	}
	
	@RequestMapping(value="/updateTotalFee/{email}/{totalFee}",method=RequestMethod.GET)
	public @ResponseBody String updateTotalFee(@PathVariable("email") String email,@PathVariable int totalFee,HttpServletRequest request)
	{
		
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		if(admin!=null && (admin.getEmail().equals("cv@cvcorp.in") || admin.getEmail().equals("akanksha@cvcorp.in") || admin.getEmail().equals("lalitha@cvcorp.in")))
		
		return adminService.updateTotalFee(email,totalFee);
		else 
			return "{\"status\":"+false+",\"notification\":\"Not acceptable\"}";
	}
	
	@RequestMapping(value="/getTotalWorkingDayList/{batch}",method=RequestMethod.GET)
	public @ResponseBody String getTotalWorkingDayList(@PathVariable("batch") int batch, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		
		if(request.getSession().getAttribute("admin")==null && request.getSession().getAttribute("student")==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
			return "{\"workingListdayList\":\""+adminService.getTotalWorkingDayList(batch)+"\"}";
	}
	
	@RequestMapping(value="/getDataAttDashbord",method=RequestMethod.GET)
	public @ResponseBody CVStudentAttDashbordList getDataAttDashbord(HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		List<CVStudentAttDashbord> students=adminService.getDataAttDashbord();
		CVStudentAttDashbordList list=new CVStudentAttDashbordList();
		list.setAttDashbordData(students);
		return list;
	}
	
	
	@RequestMapping(value="/updateStudent",consumes="Application/JSON",produces="Application/JSON",method=RequestMethod.POST)
	public @ResponseBody String updateStudent(@RequestBody String reqBody, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		System.out.println(reqBody);
		return adminService.updateStudent(reqBody);
		
	}
	
	@RequestMapping(value="/studentProfile/{student_id}",method=RequestMethod.GET)
	public ModelAndView getStudentProfile(@PathVariable("student_id") Integer student_id, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		ModelAndView mv=new ModelAndView("studentProfile");
        CVStudent st=adminService.getStudentById(student_id);
        mv.addObject("st", st);
		return mv;
		
	}
	
	@RequestMapping(value="/getStudentDetailedReport/{email}/any",produces="Application/JSON",method=RequestMethod.GET)
	public @ResponseBody DetailedReports getStudentDetailedReport(@PathVariable("email") String email, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		DetailedReports d=new DetailedReports();
		d.setReports(adminService.getStudentDetailedReport(email));
		return d;
		
	}
	
	
	@RequestMapping(value="/getTotalExamsForBatch/{batchNumber}",produces="Application/JSON",method=RequestMethod.GET)
	public @ResponseBody String getTotalExamsForBatch(@PathVariable("batchNumber") int batchNumber,HttpServletRequest request)
	{


		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return adminService.getTotalExamsForBatch(batchNumber);
		
	}
	
	@RequestMapping(value="/getStudentDriveData/{student_id}",produces="Application/JSON",method=RequestMethod.GET)
	public @ResponseBody DriveStatuses getStudentDriveData(@PathVariable("student_id") int student_id,
			HttpServletRequest request)
	{

		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
        DriveStatuses ds=new DriveStatuses();
		ds.setDriveData(adminService.getStudentDriveData(student_id));
		return ds;
	}
	
	@RequestMapping(value="/getFaculty",method=RequestMethod.GET)
	public @ResponseBody FacultyList getFaculty(HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
	
		
		if(request.getSession().getAttribute("admin") ==null && request.getSession().getAttribute("student")==null)
		{
			return null;
		}
		
		// security
		
		
		List<Faculty> fa=adminService.getFaculty();
		FacultyList ql=new FacultyList();
		ql.setFacultyList(fa);
		return ql;
	}
	
	@RequestMapping(value="/getReportByDate/{date}",method=RequestMethod.GET)
	public @ResponseBody DateReport getReport(@PathVariable("date") String date, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return null;
		}
		
		// security
		
		
		DateReport obj=new DateReport();
		obj.setReport(adminService.getReport(date));
		return obj;
	}
	
	@RequestMapping(value="/sendReport",method=RequestMethod.GET)
	public @ResponseBody String sendMsg(HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(admin==null)
		{
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically a web session token required\"}";
		}
		
		// security
		
		
		return adminService.sendReportToCV();
	}
	
}
