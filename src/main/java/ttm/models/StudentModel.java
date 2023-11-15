package ttm.models;

import org.springframework.web.multipart.MultipartFile;

public class StudentModel {
	private int id;
	private String name;
	private String registration_date;
	private String gender;
	private String phone;
	private String education;
	private String attend;
	private String photo;
	private MultipartFile file;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getAttend() {
		return attend;
	}
	public void setAttend(String attend) {
		this.attend = attend;
	}
	public StudentModel(String name, String registration_date, String gender, String phone, String education,
			MultipartFile file) {
		super();
		this.name = name;
		this.registration_date = registration_date;
		this.gender = gender;
		this.phone = phone;
		this.education = education;
		this.file = file;
	}
	
	public StudentModel(int id, String name, String registration_date, String gender, String phone, String education,
			String attend, String photo, MultipartFile file) {
		super();
		this.id = id;
		this.name = name;
		this.registration_date = registration_date;
		this.gender = gender;
		this.phone = phone;
		this.education = education;
		this.attend = attend;
		this.photo = photo;
		this.file = file;
	}
	public StudentModel(String name, String registration_date, String gender, String phone, String education,
			String photo) {
		super();
		this.name = name;
		this.registration_date = registration_date;
		this.gender = gender;
		this.phone = phone;
		this.education = education;
		this.photo = photo;
	}
	public StudentModel() {
		super();
	}
	public StudentModel(String name, String registration_date, String gender, String phone, String education,
			String attend, String photo, MultipartFile file) {
		super();
		this.name = name;
		this.registration_date = registration_date;
		this.gender = gender;
		this.phone = phone;
		this.education = education;
		this.attend = attend;
		this.photo = photo;
		this.file = file;
	}
	
	
	
}
