package ttm.models;

public class CourseModel {
	private int id;
	private String course_name;
	private int student_id;
	private int course_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public CourseModel(int id, String course_name) {
		super();
		this.id = id;
		this.course_name = course_name;
	}
	public CourseModel(String course_name) {
		super();
		this.course_name = course_name;
	}
	public CourseModel() {
		super();
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public CourseModel( int student_id, int course_id) {
		super();
		
		this.student_id = student_id;
		this.course_id = course_id;
	}
	
	}
