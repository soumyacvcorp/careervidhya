package cv.controllers;




import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cv.models.CVStudent;
import cv.models.QAAnswersList;
import cv.models.QuestionsList;
import cv.models.StudentAllExamHolder;
import cv.models.StudentExamScoreContainer;
import cv.models.StudentTopicStatusAllHolder;
import cv.models.TimeTableHolder;
import cv.services.AdminService;
import cv.services.QuestionService;
import cv.services.StudentService;

@Controller
public class StudentController {

	private StudentService studentService;
	private QuestionService questionService;
	
	public QuestionService getQuestionService() {
		return questionService;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	@RequestMapping(value="/studentLogin",method=RequestMethod.POST)
	public ModelAndView studentLogin(@RequestParam("email")String email,@RequestParam("password")String password,
			HttpServletRequest request)
	{
		System.out.println("test login");
		ModelAndView mv;
		boolean lg=studentService.login(email,password,request);
		if(lg==true)
		{
			
			mv=new ModelAndView("redirect:/");
			
			return mv;
		}
		{
			mv=new ModelAndView("index");
			mv.addObject("errorS", "!Authentication failure");
			return mv;
		}
	
	}
	
	@RequestMapping(value="/getTimeTable",method=RequestMethod.GET)
	public @ResponseBody TimeTableHolder getTimeTable(HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		//security
		
		
		TimeTableHolder obj=new TimeTableHolder();
		obj.setTimeTableList(studentService.getTimeTable());
		return obj;
	}
	
	@RequestMapping(value="/getStudentQpapers/{batchNo}",method=RequestMethod.GET)
	public ModelAndView getStudentQpapers(@PathVariable String batchNo,HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		//security
		
		
		ModelAndView mv=new ModelAndView("studentDashBoard");
		mv.addObject("qps",studentService.getQuestionPapersByBatch(batchNo));
		return mv;
	}
	
	public StudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	
	@RequestMapping(value="/registerAnswers/{qp_id}/{marks}/{manswers}",method=RequestMethod.GET)
	public @ResponseBody String registerAnswers(@PathVariable int qp_id,@PathVariable double marks,
			@PathVariable String manswers,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically it's a session based security\"}";
		
		
		//security
		
		System.out.println(manswers);
 
		String notification="Your score updated successfully";
        		
		CVStudent st=(CVStudent)request.getSession().getAttribute("student");
		boolean status=studentService.evaluateExam(qp_id,marks,st.getEmail(),manswers);
		
		if(!status)
			notification="Oops! Looks like you have already taken the exam, If not something went wrong contact Admin";
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
		
	}
	
	@RequestMapping(value="/getStudentReportViaStudent/{email}/{any}",method=RequestMethod.GET)
	public @ResponseBody String getStudentReport(@PathVariable String email, HttpServletRequest request){
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically it's a session based security\"}";
		
		
		//security
		
		
		System.out.println(email);
		return 	studentService.getStudentReport(email);
		
	}
	
	@RequestMapping(value="/changeStudentPassword",method=RequestMethod.POST)
	public @ResponseBody String changePassword(@RequestParam("oldPassword")String oldPassword,@RequestParam("newPassword")String newPassword,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically it's a session based security\"}";
		
		
		//security
		
		String notification="Password changed successfully Login with your new Password in next login";
		boolean status=studentService.changePassword(oldPassword,newPassword,request);
		System.out.println(newPassword+"  "+oldPassword+" "+status);
		if(!status)
			notification="Oops something went wrong! check your previous password";
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	@RequestMapping(value="/submitQAExam",method=RequestMethod.POST)
	public @ResponseBody String submitQAAnswers(@RequestParam("question_id")String[] question_ids,
			@RequestParam("qaAnswer")String[] qaAnswers,@RequestParam("qp_id")int qp_id,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically it's a session based security\"}";
		
		
		//security
		
		CVStudent student=(CVStudent)request.getSession().getAttribute("student");
		String notification="Your Exam submitted successfully";
		boolean status=studentService.submitQAExam(question_ids,qaAnswers,qp_id,student.getEmail());
		if(!status)
			notification="There is a problem in submitting Exam";
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}
	
	//Admin and Student are using
	@RequestMapping(value="/getStudentScore/{email}/{qp_id}",method=RequestMethod.GET)
	public @ResponseBody String getStudentScore(@PathVariable String email,@PathVariable int qp_id,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically it's a session based security\"}";
		
		
		//security
		
		return studentService.getStudentScore(email,qp_id);
		
	}
	
	//getExamMark
	@RequestMapping(value="/getMyExamScore/{email}/{subject}/{batch}",method=RequestMethod.GET)
	public @ResponseBody StudentExamScoreContainer getMyExamScore(@PathVariable String email,@PathVariable String subject,@PathVariable int batch,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		
		//security
		
		StudentExamScoreContainer obj=new StudentExamScoreContainer();
		obj.setSccoreList(studentService.getMyExamScore(email,subject,batch));
		return obj;
	}
	@RequestMapping(value="/getMyAllExamScore/{email}/{batch}",method=RequestMethod.GET)
	public @ResponseBody StudentAllExamHolder getMyAllExamScore(@PathVariable String email,@PathVariable int batch,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		
		//security
		
		StudentAllExamHolder obj=new StudentAllExamHolder();
		obj.setAllExamList(studentService.getMyAllExamScore(email,batch));
		return obj;
	}
	
	@RequestMapping(value="/getMyTopicStatus/{email}/{batch}",method=RequestMethod.GET)
	public @ResponseBody StudentTopicStatusAllHolder getMyTopicStatus(@PathVariable String email,@PathVariable int batch,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		
		//security
		
		StudentTopicStatusAllHolder obj=new StudentTopicStatusAllHolder();
		obj.setAllTopicStatusList(studentService.getMyTopicStatus(email,batch));
		return obj;
	}
	
	@RequestMapping(value="/getFile/{id}",method=RequestMethod.GET)
	public void getFile(@PathVariable int id,HttpServletResponse response, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return;
		
		
		//security
		
		List al=studentService.getFileById(id);
		byte[] file=(byte[])al.get(1);
		try {
			response.setContentType((String)al.get(0));
			OutputStream stream=response.getOutputStream();
			stream.write(file);
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping(value="/viewPaperStudent/{questions}",method=RequestMethod.GET)
	public @ResponseBody QuestionsList viewPaper(@PathVariable String questions,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		
		//security
		
		QuestionsList ql=new QuestionsList();
		ql.setQuestionsList(questionService.getQuestions(questions));
		return ql;
	}
	
	
	@RequestMapping(value="/userMOptions/{email}/{qp_id}",method=RequestMethod.GET)
	public @ResponseBody String userMOptions(@PathVariable String email,@PathVariable int qp_id,HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically it's a session based security\"}";
		
		
		//security
		
		
	  return	studentService.getUserOptions(email,qp_id);
		
		
		
	}
	
	@RequestMapping(value="/getQAAnswerPaper/{email}/{qp_id}",method=RequestMethod.GET)
	public @ResponseBody QAAnswersList getStudentQAAnswerPaper(@PathVariable int qp_id,@PathVariable String email, HttpServletRequest request)
	{
		
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		
		//security
		
		System.out.println("testing");
		return studentService.getStudentQAAnswerPaper(qp_id,email);
	}
	
	
	@RequestMapping(value="/uploadResume",method=RequestMethod.POST)
	public @ResponseBody String fileUpload(@RequestParam("file") MultipartFile file,
			HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return "{\"status\":"+false+",\"notification\":\"authentication required, technically it's a session based security\"}";
		
		
		//security
		
		System.out.println(file.getContentType()); //Edited By Shiva Kumar
		return studentService.uploadResume(file,request);
		 
		
	}
	@RequestMapping(value="/getStudent/{email}/any",method=RequestMethod.GET)
	public @ResponseBody CVStudent getStudent(@PathVariable("email") String email, HttpServletRequest request)
	{
		/* Considering few requests / services and application being not role based app
		   security is hard coded at every request
		   In fact security is independent and can be removed or modified for future enhancements
		   Security is a session based security.
		*/
		
		//security
		
		if(request.getSession().getAttribute("student")==null && request.getSession().getAttribute("admin")==null)
			return null;
		
		
		//security
		return studentService.getStudent(email);
	}
	
	
}
