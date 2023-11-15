package ttm.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ttm.helper.RegistrationHelper;
import ttm.models.CourseModel;
import ttm.models.StudentModel;



public class StudentDao {
public int createStudent(StudentModel srs) {
	MultipartFile multipartFile = srs.getFile();
	

	String fileName = multipartFile.getOriginalFilename();
		int status=0;
		String query="insert into student_registration(name,registration_date,gender,phone,education,photo) values(?,?,?,?,?,?)";
		Connection con=RegistrationHelper.getInstance().getConnection();
		try {
			
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setString(1, srs.getName());
			ps.setString(2, srs.getRegistration_date());
			ps.setString(3, srs.getGender());
			ps.setString(4, srs.getPhone());
			ps.setString(5, srs.getEducation());
		
			ps.setString(6, fileName);
			status =ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} 
		return status;
	}

public List<StudentModel> studentCourse(String name,String phone){ 
	
	List<StudentModel> srs=new ArrayList<StudentModel>();
	String query="select * from student_registration where name=? and phone=?";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, name);
		 ps.setString(2, phone );
	     
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			StudentModel sr = new StudentModel();

			sr.setId(rs.getInt("id"));
			sr.setName(rs.getString("name"));
			sr.setRegistration_date(rs.getString("registration_date"));
			sr.setGender(rs.getString("gender"));
			sr.setPhone(rs.getString("phone"));
			sr.setEducation(rs.getString("education"));
			sr.setPhoto(rs.getString("photo"));
			srs.add(sr);
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return srs;
}

public List<StudentModel> allStudentUser() {
	List<StudentModel> srs=new ArrayList<StudentModel>();
	String query="select * from student_registration";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			StudentModel sr = new StudentModel();
				sr.setId(rs.getInt("id"));
				sr.setName(rs.getString("name"));
				sr.setRegistration_date(rs.getString("registration_date"));
				sr.setGender(rs.getString("gender"));
				sr.setPhone(rs.getString("phone"));
				sr.setEducation(rs.getString("education"));
		
				sr.setPhoto(rs.getString("photo"));
			srs.add(sr);
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return srs;

    }
public List<StudentModel> studentById(int studentId){ 
	
		List<StudentModel> srs=new ArrayList<StudentModel>();
		String query="select * from student_registration where id=?";
		Connection con=RegistrationHelper.getInstance().getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, studentId);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				StudentModel sr = new StudentModel();
				sr.setId(rs.getInt("id"));
				sr.setName(rs.getString("name"));
				sr.setRegistration_date(rs.getString("registration_date"));
				sr.setGender(rs.getString("gender"));
				sr.setPhone(rs.getString("phone"));
				sr.setEducation(rs.getString("education"));
			
				sr.setPhoto(rs.getString("photo"));
				srs.add(sr);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return srs;
	}
public List<StudentModel> studentId(int studentId){ 
	
	List<StudentModel> srs=new ArrayList<StudentModel>();
	String query="select * from course_view where student_id=?";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, studentId);
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			StudentModel sr = new StudentModel();
			sr.setId(rs.getInt("student_id"));
			sr.setAttend(rs.getString("course_name"));
			
			srs.add(sr);
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return srs;
}

public List<StudentModel> courseName(String course_name) {
	List<StudentModel> srs=new ArrayList<StudentModel>();
	String query="SELECT * FROM student_registration WHERE id IN (SELECT  student_id\r\n"
			+ "    FROM student_course WHERE course_id = (SELECT \r\n"
			+ "    id FROM course_registration WHERE course_name = ?))";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, course_name);
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			StudentModel sr = new StudentModel();
			sr.setId(rs.getInt("id"));
			sr.setName(rs.getString("name"));
			sr.setRegistration_date(rs.getString("registration_date"));
			sr.setGender(rs.getString("gender"));
			sr.setPhone(rs.getString("phone"));
			sr.setEducation(rs.getString("education"));
		
			sr.setPhoto(rs.getString("photo"));
			srs.add(sr);
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return srs;

    }

	


public List<StudentModel> studentName(String name){ 

List<StudentModel> srs=new ArrayList<StudentModel>();
String query="select * from student_registration where name like ?";
Connection con=RegistrationHelper.getInstance().getConnection();
try {
	PreparedStatement ps=con.prepareStatement(query);
	
     ps.setString(1,"%"+ name +"%");
	ResultSet rs=ps.executeQuery();
	while (rs.next()) {
		StudentModel sr = new StudentModel();

		sr.setId(rs.getInt("id"));
		sr.setName(rs.getString("name"));
		sr.setRegistration_date(rs.getString("registration_date"));
		sr.setGender(rs.getString("gender"));
		sr.setPhone(rs.getString("phone"));
		sr.setEducation(rs.getString("education"));
		
		sr.setPhoto(rs.getString("photo"));
		srs.add(sr);
	}
} catch (SQLException e) {
	System.out.println(e.getMessage());
	e.printStackTrace();
}
return srs;
}
public List<StudentModel> studentMore(int id,String name,String attend){ 
	
	List<StudentModel> srs=new ArrayList<StudentModel>();
	String query="SELECT * FROM student_registration\r\n"
			+ "    WHERE id=? or name like ? or id IN (SELECT \r\n"
			+ "   student_id FROM student_course WHERE\r\n"
			+ "   course_id = (SELECT id FROM course_registration \r\n"
			+ "   WHERE course_name=?))";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, id);
		 ps.setString(2,"%"+name+"%" );
	     ps.setString(3, attend);
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			StudentModel sr = new StudentModel();

			sr.setId(rs.getInt("id"));
			sr.setName(rs.getString("name"));
			sr.setRegistration_date(rs.getString("registration_date"));
			sr.setGender(rs.getString("gender"));
			sr.setPhone(rs.getString("phone"));
			sr.setEducation(rs.getString("education"));
		
			sr.setPhoto(rs.getString("photo"));
			srs.add(sr);
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return srs;
}


public int studentDelete(int id){
	int status=0;
	String query="delete from student_registration where id=?";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, id);
		status=ps.executeUpdate();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return status;
}
public int stuCourseDelete(int student_id){
	int status=0;
	String query="delete from student_course where student_id=?";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, student_id);
		status=ps.executeUpdate();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return status;
}
public int updateStudentRegistration(StudentModel srs) {
MultipartFile multipartFile = srs.getFile();
	

	String fileName = multipartFile.getOriginalFilename();
	int status=0;
	String query="update student_registration set name=?,registration_date=?,gender=?,phone=?,education=?,photo=? where id=?";
	Connection con=RegistrationHelper.getInstance().getConnection();
	try {
		PreparedStatement ps=con.prepareStatement(query);
		
		ps.setString(1, srs.getName());
		ps.setString(2, srs.getRegistration_date());
		ps.setString(3, srs.getGender());
		ps.setString(4, srs.getPhone());
		ps.setString(5, srs.getEducation());
		ps.setString(6, fileName);
		ps.setInt(7, srs.getId());
		status=ps.executeUpdate();
	} catch (SQLException e) {
		System.out.println(e);
		e.printStackTrace();
	}
	return status;
}
}
