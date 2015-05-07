package com.Leeroy.DatabaseConnector;

import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.Leeroy.Model.User;

public class DatabaseConnector {
	Connection connect;
	Statement s;
	String query;
	ResultSet result;
	PreparedStatement ps;
	int createUserDatabase;
	
	public DatabaseConnector() throws ClassNotFoundException, SQLException, IOException {
		Properties prop = new Properties();
		InputStream inputStream = DatabaseConnector.class.getClassLoader().getResourceAsStream("/db.properties");
		prop.load(inputStream);
		
		String driver = prop.getProperty("driver");
		String url = prop.getProperty("url");
		String user = prop.getProperty("user");
		String password = prop.getProperty("password");
		Class.forName(driver);
		this.connect = DriverManager.getConnection(url,user,password);
		
		/*Class.forName("com.mysql.jdbc.Driver");
		this.connect = DriverManager
				.getConnection("jdbc:mysql://localhost/?user=admin&password=admin");*/
		this.s = connect.createStatement();
		this.createUserDatabase = s
				.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB");
		s.execute("USE USERDB");
		this.s = connect.createStatement();
		this.createUserDatabase = s
				.executeUpdate("CREATE TABLE IF NOT EXISTS USER"
						+ "(userID INTEGER not NULL, "
						+ "userFirstName VARCHAR(255), userLastName VARCHAR(255), userEmail VARCHAR(255),"
						+ "userName VARCHAR(255), "
						+ "userPassword VARCHAR(255),"
						+ "PRIMARY KEY (userID))");
		

	}
	
	public int register(User user) throws SQLException {

		query = "SELECT * FROM USER;";
		int userID = 0;

		result = s.executeQuery(query);
		while (result.next()) {
			String x = result.getString("username");
			if (x.equals(user.getUsername())) {

				System.out.print("Username Already Exists");
				return 1;

			}
			String y = result.getString("useremail");
			if (y.equals(user.getEmail())) {

				System.out.print("Email Already Exists");
				return 2;

			}
			userID = result.getInt("userID") + 1;
		}

		query = "INSERT INTO USER(userID,username,userpassword,userfirstname,userlastname,useremail)  VALUES(?,?,?,?,?,?)";
		ps = connect.prepareStatement(query);
		ps.setString(1, userID + "");
		ps.setString(2, user.getUsername());
		ps.setString(3, user.getPassword());
		ps.setString(4, user.getFirstname());
		ps.setString(5, user.getLastname());
		ps.setString(6, user.getEmail());
		ps.execute();
		s.close();
		connect.close();
		return 0;
	}

	public int login(String username,String password) throws Exception{
		String pass="";
		query = "select * from USER where username = ?;";
		ps = connect.prepareStatement(query);
		ps.setString(1, username);
		result = ps.executeQuery();
		while(result.next()){
			pass = result.getString("userpassword");
		}
		if(pass.equals(password)){
			
			return 0;
		}
		else{
			
			return 1;
		}
	}
	
	public User userDetail(String userID) throws Exception{
		
		String[] user = new String[6];
		query = "select * from user where userID = \""+userID+"\";";
		result = s.executeQuery(query);
		while(result.next()){
			
			user[0] = result.getString("userFirstName");
			user[1] = result.getString("userLastName");
			user[2] = result.getString("userName");
			user[3] = result.getString("userPassword");
			user[4] = result.getString("userEmail");
			user[5] = result.getString("userID");
			
		}
		User users = new User(user[2],user[3],user[0],user[1],user[4]) ;
		s.close();
		connect.close();
		return users;
		
		
	}
	
	public String getUserID(String userName) throws Exception{
		String userID="";
		query = "select * from user where userName = \""+userName+"\";";
		result = s.executeQuery(query);
		while(result.next()){
			
			userID = result.getString("userID");
			
		}
		
		return userID;
	}
}
