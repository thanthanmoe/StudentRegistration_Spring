package ttm.controllers;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import ttm.daos.UserDao;
import ttm.models.UserModel;


@Controller
public class UserController {

	@Autowired
	UserDao userDao;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login() {

		return new ModelAndView ("LGN001","user",new UserModel());
	}

	@RequestMapping(value = "/userSearch", method = RequestMethod.GET)
	public String userSearch() {

		return "USR003";
	}

	@RequestMapping(value = "/mnu", method = RequestMethod.GET)
	public String MNU() {

		return "MNU001";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") UserModel user, ModelMap model,HttpSession session) {
	    List<UserModel> users = userDao.userBy(user.getName(),user.getPassword());
	    
	    if (users.isEmpty()) {
	        model.addAttribute("error", "Invalid username or password.");
	        return "LGN001";
	    }
	    
	    UserModel foundUser = users.get(0);
	    
	   
	        if (foundUser.getRole().equals("Admin")) {
	        	session.setAttribute("foundUser", foundUser);
	            session.setAttribute("user_id", foundUser.getId());
	            
	            session.setAttribute("name", foundUser.getName());
	            return "MNU001";
	        } else if (foundUser.getRole().equals("User")) {
	        	session.setAttribute("foundUser", foundUser);
	            session.setAttribute("user_id", foundUser.getId());
	            model.addAttribute("user","user");
	       	     return "STU001";
	       
	    }else {
	    
	    model.addAttribute("error", "Login failed!");
	    return "LGN001";
	    }
	   
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
	    
		session.invalidate();
		return "redirect:/";
	    }

	
	@RequestMapping(value = "/usr", method = RequestMethod.GET)
	public ModelAndView userRegistration() {

		return new ModelAndView ("USR001","user",new UserModel());
	}
	
	@RequestMapping(value = "/userCreate", method = RequestMethod.POST)
	public String userCreate(@ModelAttribute("user") UserModel user,@RequestParam(value = "code", defaultValue = "") String code, ModelMap model) {
	    List<UserModel> users = userDao.userBy(user.getName(),user.getPassword());
		
		if (user.getRole().equals("User") && users.isEmpty()) {
			userDao.createUser(user);
			
			System.out.println(user.getPassword());
			model.addAttribute("success", "Successfully register,Please login <^^>");
			return "LGN001";
		}if (user.getRole().equals("Admin") && code.equals("123")) {
			userDao.createUser(user);
			
			model.addAttribute("success", "Successfully register,Please login <^^>");
			return "LGN001";
		}if (user.getRole().equals("Admin") && users.isEmpty()) {
			model.addAttribute("user",user);			
			model.addAttribute("success", "Please Enter Admin Code");
			return "USR001";
		} else {
			System.out.println(user.getRole());
			model.addAttribute("error", "Registration Fail,This account is already create!");
			return "USR001";
		}

	}

	 @RequestMapping(value = "/userSearch", method = RequestMethod.POST)
	    public String processForm(@RequestParam(value = "id", defaultValue = "") String id,
	                              @RequestParam(value = "name", defaultValue = "") String name,
	                              ModelMap model) {

	        if (id.isEmpty() && name.isEmpty()) {
	            List<UserModel> urs = userDao.getallUser();
	            model.addAttribute("urs", urs);
	        }if(!id.isEmpty() && !name.isEmpty()){
	        	
	            List<UserModel> urs = userDao.userByName(id, name);
	            if (urs.isEmpty()) {
	                model.addAttribute("error", "User not found");
	            } else {
	                model.addAttribute("ur", urs);
	            }
	        } else if (!id.isEmpty()) {
	            List<UserModel> urs = userDao.userId(id);
	            if (urs.isEmpty()) {
	                model.addAttribute("error", "User not found");
	            } else {
	                model.addAttribute("ur", urs);
	            }
	        } else if (!name.isEmpty()) {
	        	List<UserModel> urs = userDao.userBy(name);
	            if (urs.isEmpty()) {
	                model.addAttribute("error", "User not found");
	            } else {
	                model.addAttribute("ur", urs);
	            }
	        } 

	        return "USR003";
	    }
	 
	 @RequestMapping(value="/userDelete/{id}",method = RequestMethod.GET)
	    public String deleteUser(@PathVariable("id") Integer id) {
		 userDao.photoDelete(id);    
		 int status = userDao.getUserDelete(id);
	       return "redirect:/userSearch";
	        
	    }
	 @RequestMapping(value="/photoDelete/{id}",method = RequestMethod.GET)
	    public String deletePhoto(@PathVariable("id") Integer id) {
		 userDao.photoDelete(id);    
		 List<UserModel> list = userDao.userId(String.valueOf(id));
		 if(list.get(0).getRole().equals("Admin")) {
			 return "MNU001"; 
		 }else {
			 return "STU001";
		 }
		
	    }
	 
	 @RequestMapping(value="/userUpdate/{id}",method = RequestMethod.GET)
	 public ModelAndView userUpdate(@PathVariable("id") String id, ModelMap model) {
	     List<UserModel> list = userDao.userId(id);
	     model.addAttribute("users", list);
	     model.addAttribute("id",id);
	     return new ModelAndView("USR002", "user", new UserModel());
	 }

	 @RequestMapping(value = "/update", method = RequestMethod.POST)
	 public String updateUser(@ModelAttribute("user") UserModel user,
	                         
	                          ModelMap model) throws IOException {
	     System.out.println(user.getFile());
	     int id = user.getId();
	    
	     if (user.getFile() != null && !user.getFile().isEmpty()) {
	         String uploadPath = "D:\\AIWebDevelopment\\StudentRegistrationSpring\\src\\main\\webapp\\assets\\image" + File.separator;
	         String fileName = user.getFile().getOriginalFilename();
	         Path path = Paths.get(uploadPath + fileName);
	         Files.write(path, user.getFile().getBytes());
	         model.addAttribute("fileName", fileName);
	         userDao.photoDelete(id);
	         userDao.userPhoto(id, fileName);
	         System.out.println("aa");
	         }
	     int status = userDao.updateUserRegistration(user);
	     if(user.getRole().equals("User")) {
	        	 
	        	 model.addAttribute("success", "Update Successful.");
		         return"STU001";
	     }
	     
	     if (status == 1) {
	         model.addAttribute("success", "Update Successful.");
	         return "MNU001";
	     } else {
	         model.addAttribute("error", "Update Failed!");
	         return "USR002";
	     }
	 }


}
