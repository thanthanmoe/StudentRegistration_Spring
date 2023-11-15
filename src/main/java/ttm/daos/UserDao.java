package ttm.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ttm.helper.RegistrationHelper;
import ttm.models.UserModel;
@Service("userDao")
public class UserDao {
	
	  public int createUser(UserModel ur) {

			int status = 0;
			String query = "insert into user_registration(name,email,password,role) values(?,?,?,?)";
			Connection con = RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps = con.prepareStatement(query);

				ps.setString(1, ur.getName());
				ps.setString(2, ur.getEmail());
				ps.setString(3, ur.getPassword());
				ps.setString(4, ur.getRole());
				status = ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return status;
		}
	  public int userPhoto(int user_id,String user_photo) {

			int status = 0;
			String query = "insert into user_photo(user_id,user_photo) values(?,?)";
			Connection con = RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps = con.prepareStatement(query);

				ps.setInt(1, user_id);
				ps.setString(2, user_photo);
				
				status = ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return status;
		}
	  public List<UserModel> userBy(String name,String password){ 
			
			List<UserModel> urs=new ArrayList<UserModel>();
			String query="select * from user_registration where name=? and password=?";
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, name);
				ps.setString(2, password);
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					UserModel ur = new UserModel();
					ur.setId(rs.getInt("id"));
					ur.setName(rs.getString("name"));
					ur.setEmail(rs.getString("email"));
					ur.setPassword(rs.getString("password"));
					ur.setRole(rs.getString("role"));
					urs.add(ur);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return urs;
		}
	  
	  public List<UserModel> getallUser() {
			List<UserModel> urs=new ArrayList<UserModel>();
			
			String query="select * from user_registration ";
			
			
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					UserModel ur = new UserModel();
					ur.setId(rs.getInt("id"));
					ur.setName(rs.getString("name"));
					ur.setEmail(rs.getString("email"));
					ur.setPassword(rs.getString("password"));
					ur.setRole(rs.getString("role"));
					urs.add(ur);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return urs;

		    }
	  
	  

		public List<UserModel> userBy(String name){ 
			
			List<UserModel> urs=new ArrayList<UserModel>();
			String query="select * from user_registration where name like ?";
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, "%"+name+"%");
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					UserModel ur = new UserModel();
					ur.setId(rs.getInt("id"));
					ur.setName(rs.getString("name"));
					ur.setEmail(rs.getString("email"));
					ur.setPassword(rs.getString("password"));
					ur.setRole(rs.getString("role"));
					urs.add(ur);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return urs;
		}

		public List<UserModel> userId(String id){ 
			
			List<UserModel> urs=new ArrayList<UserModel>();
			String query="select * from user_registration where id=?";
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					UserModel ur = new UserModel();
					ur.setId(rs.getInt("id"));
					ur.setName(rs.getString("name"));
					ur.setEmail(rs.getString("email"));
					ur.setPassword(rs.getString("password"));
					ur.setRole(rs.getString("role"));
					urs.add(ur);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return urs;
		}
		
public List<UserModel> userPhoto(int user_id){ 
			
			List<UserModel> urs=new ArrayList<UserModel>();
			String query="select * from user_photo where user_id=?";
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setInt(1, user_id);
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					UserModel ur = new UserModel();
					ur.setId(rs.getInt("user_id"));
					ur.setUser_photo(rs.getString("user_photo"));
					
					urs.add(ur);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return urs;
		}
		public List<UserModel> userByName(String id,String name){ 
			
			List<UserModel> urs=new ArrayList<UserModel>();
			String query="select * from user_registration where id=? or name like ?";
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, id);
				ps.setString(2, "%"+ name +"%");
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					UserModel ur = new UserModel();
					ur.setId(rs.getInt("id"));
					ur.setName(rs.getString("name"));
					ur.setEmail(rs.getString("email"));
					ur.setPassword(rs.getString("password"));
					ur.setRole(rs.getString("role"));
					urs.add(ur);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return urs;
		}


		public int getUserDelete(Integer id){
			int status=0;
			String query="delete from user_registration where id=?";
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
		public int photoDelete(int user_id){
			int status=0;
			String query="delete from user_photo where user_id=?";
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setInt(1, user_id);
				status=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return status;
		}
		
		public int updateUserRegistration(UserModel user) {
			int status=0;
			String query="update user_registration set name=?,email=?,password=?,role=? where id=?";
			Connection con=RegistrationHelper.getInstance().getConnection();
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, user.getName());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getPassword());
				ps.setString(4, user.getRole());
				ps.setInt(5, user.getId());
				status=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e);
				e.printStackTrace();
			}
			return status;
		}

}
