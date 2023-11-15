package ttm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ttm.daos.CourseDao;
import ttm.models.CourseModel;
import ttm.models.UserModel;

@Controller
public class CourseController {
	@Autowired
	private CourseDao courseDao;
	
	@RequestMapping(value = "/course", method = RequestMethod.GET)
	public String course() {

		return "BUD003";
	}
	
	@RequestMapping(value = "/insertCourse",method = RequestMethod.POST)
	public String insertCourse(@RequestParam("name") String name,ModelMap model) {
		CourseModel cm=new CourseModel(name);
		int status=courseDao.createCourse(cm);
		if(status>0) {
			model.addAttribute("success","Insert Successfully<^^>");
		}else {
			model.addAttribute("error","Course Name is Dublicate!");
		}
		return "BUD003";
	}
	@RequestMapping(value = "/allCourse", method = RequestMethod.GET)
	public String allCourse() {

		return "BUD003-01";
	}
	 @RequestMapping(value="/courseDelete/{id}",method = RequestMethod.GET)
	    public String deleteUser(@PathVariable("id") int id) {
		courseDao.getCourseDelete(id);
		
	       return "BUD003-01";
	        
	    }
	
	
}
