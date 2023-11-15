package ttm.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.hibernate.validator.internal.util.privilegedactions.NewInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ttm.daos.CourseDao;
import ttm.daos.StudentDao;
import ttm.models.CourseModel;
import ttm.models.StudentModel;



@Controller
public class StudentController {
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private CourseDao courseDao;
	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public ModelAndView login() {
		
		return new ModelAndView ("STU001","student",new StudentModel());
	}
	
	
	@RequestMapping(value = "/studentCreate", method = RequestMethod.POST)
	public String insertCourse(@ModelAttribute("student") StudentModel student, ModelMap model) {
	    try {
	        MultipartFile multipartFile = student.getFile();
	        String uploadPath = "D:\\AIWebDevelopment\\StudentRegistrationSpring\\src\\main\\webapp\\assets\\image" + File.separator;
	        String fileName = multipartFile.getOriginalFilename();
	        Path path = Paths.get(uploadPath + fileName);
	        Files.write(path, multipartFile.getBytes());
	        model.addAttribute("fileName", fileName);
	        List<StudentModel> st = studentDao.allStudentUser();
	      if(!st.get(0).getName().equals(student.getName()) && !st.get(0).getEducation().equals(student.getEducation()) && !st.get(0).getPhone().equals(student.getPhone())) {
	        int status = studentDao.createStudent(student);
	        if (status > 0) {
	            List<StudentModel> students = studentDao.studentCourse(student.getName(), student.getPhone());
	            studentDao.stuCourseDelete(student.getId()); 
	            for (String courseId : student.getAttend().split(",")) {
	                List<CourseModel> courses = courseDao.course(courseId);
	                if (!courses.isEmpty()) {
	                    courseDao.studentCourse(students.get(0).getId(), courses.get(0).getId());
	                }
	            }
	            model.addAttribute("success", "Successful Register<^^>");
	        }
	      }else {
	            model.addAttribute("error", "Student is already Registration");
	        }
	    } catch (IOException e) {
	        model.addAttribute("error", "Error occurred while uploading the file.");
	    }
	    return "STU001";
	}
	
	@RequestMapping(value = "/studentSearch", method = RequestMethod.GET)
	public String studentSearch() {

		return "STU003";
	}
	
	@RequestMapping(value = "/studentSearch", method = RequestMethod.POST)
    public String processForm(@RequestParam(value = "id", defaultValue = "0") int id,
                              @RequestParam(value = "name", defaultValue = "") String name,
                              @RequestParam(value = "attend", defaultValue = "") String attend,
                              ModelMap model) {

        if (id == 0 && name.isEmpty() && attend.isEmpty()) {
            List<StudentModel> srs = studentDao.allStudentUser();
            
            model.addAttribute("list", srs);
        } else if (!attend.isEmpty() && id == 0 && name.isEmpty()) {
            List<StudentModel> srs = studentDao.courseName(attend);
            if (srs.isEmpty()) {
                model.addAttribute("error", "Student not found");
            } else {
                model.addAttribute("list", srs);
            }
        } else if (attend.isEmpty() && id != 0 && name.isEmpty()) {
            List<StudentModel> srs = studentDao.studentById(id);
            if (srs.isEmpty()) {
                model.addAttribute("error", "Student not found");
            } else {
                model.addAttribute("list", srs);
            }
        } else if (attend.isEmpty() && id == 0 && !name.isEmpty()) {
            List<StudentModel> srs = studentDao.studentName(name);
            if (srs.isEmpty()) {
                model.addAttribute("error", "Student not found");
            } else {
                model.addAttribute("list", srs);
            }
        } else if (id != 0 || !name.isEmpty() || !attend.isEmpty()) {
            List<StudentModel> srs = studentDao.studentMore(id, name, attend);
            if (srs.isEmpty()) {
                model.addAttribute("error", "Student not found");
            } else {
                model.addAttribute("list", srs);
            }
        }

        return "STU003";
    }
	 @RequestMapping(value="/studentDelete/{id}",method = RequestMethod.GET)
	    public String deleteStudent(@PathVariable("id") Integer id) {
		 studentDao.stuCourseDelete(id);    
		 int status = studentDao.studentDelete(id);
	       return "redirect:/studentSearch";
	        
	    }
	 
	@RequestMapping(value="/stuUpdate/{id}",method = RequestMethod.GET)
	 public ModelAndView studentUpdate(@PathVariable("id") int id, ModelMap model) {
	     List<StudentModel> list = studentDao.studentById(id);
	     model.addAttribute("stu", list);
	     model.addAttribute("id",id);
	     return new ModelAndView("STU002", "student", new StudentModel());
	 }

	@RequestMapping(value="/studentUpdate",method = RequestMethod.POST)
	 public String studentsUpdate(@ModelAttribute("student") StudentModel student, ModelMap model) {
		    try {
		        MultipartFile multipartFile = student.getFile();
		        String uploadPath = "D:\\AIWebDevelopment\\StudentRegistrationSpring\\src\\main\\webapp\\assets\\image" + File.separator;
		        String fileName = multipartFile.getOriginalFilename();
		        Path path = Paths.get(uploadPath + fileName);
		        Files.write(path, multipartFile.getBytes());
		        model.addAttribute("fileName", fileName);
		        
		        int status = studentDao.updateStudentRegistration(student);
		        if (status > 0) {
		        	
		            List<StudentModel> students = studentDao.studentCourse(student.getName(), student.getPhone());
		            studentDao.stuCourseDelete(student.getId()); 
		            for (String courseId : student.getAttend().split(",")) {
		                List<CourseModel> courses = courseDao.course(courseId);
		                if (!courses.isEmpty()) {
		                    courseDao.studentCourse(students.get(0).getId(), courses.get(0).getId());
		                }
		            }
		            model.addAttribute("success", "Update Successful <^^>");
		        } else {
		            model.addAttribute("error", "Update Failed!!");
		        }
		    } catch (IOException e) {
		        model.addAttribute("error", "Error occurred while uploading the file.");
		    }
		    return "STU002";
		}
}
