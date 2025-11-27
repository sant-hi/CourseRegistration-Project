package com.reg.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.reg.util.Credentials;



public class Model {
int student_id;
int course_id;

public int getCourse_id() {
	return course_id;
}
public void setCourse_id(int course_id) {
	this.course_id = course_id;
}

private String name;
private String email;
private String password;
private long phone;

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public long getPhone() {
	return phone;
}
public void setPhone(long phone) {
	this.phone = phone;
}

private Connection con;
private PreparedStatement pstmt;


private ResultSet res;


public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getStudent_id() {
	return student_id;
}
public void setStudent_id(int student_id) {
	this.student_id = student_id;
}


public Model() {
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(Credentials.url,Credentials.user,Credentials.pwd);
	}catch (Exception e) {
		e.printStackTrace();
	}
}

public boolean registerStudent() {
   
    try{
    	 String sql = "INSERT INTO students(student_id, name, email, phone, password) VALUES (?, ?, ?, ?, ?)";
    	pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, student_id);
        pstmt.setString(2, name);
        pstmt.setString(3, email);
        pstmt.setLong(4, phone);
        pstmt.setString(5, password); 
        int x=pstmt.executeUpdate();
		if(x>0) {
			return true;
		}else {
			return false;
		}
	}catch (Exception e) {
		return false;
	}
}
public boolean loginStudent() {
   
    try {
    	 String sql = "SELECT student_id, name FROM students WHERE email = ? AND password = ?";
    	 pstmt = con.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, password); // compare hashed version in production
          res = pstmt.executeQuery();
            if (res.next()==true) {
            	student_id = res.getInt("student_id");
                name = res.getString("name");
                return true;
            }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
public boolean registerStudentToCourse() {
    try {
        con.setAutoCommit(false);

        String checkReg = "SELECT 1 FROM registrations WHERE student_id=? AND course_id=?";
        pstmt = con.prepareStatement(checkReg);
        pstmt.setInt(1, student_id);
        pstmt.setInt(2, course_id);
        res = pstmt.executeQuery();
        if (res.next()) {
            con.rollback();
            return false; // already registered
        }

        // Check available seats
        String checkSeats = "SELECT seats FROM courses WHERE course_id=? FOR UPDATE";
        pstmt = con.prepareStatement(checkSeats);
        pstmt.setInt(1, course_id);
        res = pstmt.executeQuery();
        if (!res.next()) {
            con.rollback();
            return false; // course not found
        }
        int seats = res.getInt("seats");
        if (seats <= 0) {
            con.rollback();
            return false; // no seats
        }

        // Insert registration
        String insertReg = "INSERT INTO registrations(student_id, course_id) VALUES (?, ?)";
        pstmt = con.prepareStatement(insertReg);
        pstmt.setInt(1, student_id);
        pstmt.setInt(2, course_id);
        int inserted = pstmt.executeUpdate();
        if (inserted == 0) {
            con.rollback();
            return false;
        }

        // Update seats
        String updateSeats = "UPDATE courses SET seats = seats - 1 WHERE course_id=?";
        pstmt = con.prepareStatement(updateSeats);
        pstmt.setInt(1, course_id);
        int updated = pstmt.executeUpdate();
        if (updated == 0) {
            con.rollback();
            return false;
        }

        con.commit();
        return true;

    } catch (SQLException e) {
        e.printStackTrace();
        try { con.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
        return false;
    } finally {
        try {
            if (res != null) res.close();
            if (pstmt != null) pstmt.close();
            con.setAutoCommit(true);
        } catch (SQLException e) { e.printStackTrace(); }
    }
}
public Course[] getStudentCoursesArray(int studentId) {
    Course[] courses = new Course[0]; // start with empty array
    String sql = "SELECT c.course_id, c.course_name, c.description, c.seats " +
                 "FROM courses c JOIN registrations r ON c.course_id = r.course_id " +
                 "WHERE r.student_id = ?";

    try (PreparedStatement pstmt = con.prepareStatement(sql, 
            ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY)) {
        pstmt.setInt(1, studentId);
        try (ResultSet rs = pstmt.executeQuery()) {

            // Count rows to create array
            rs.last();
            int rowCount = rs.getRow();
            rs.beforeFirst();

            courses = new Course[rowCount];
            int index = 0;

            while (rs.next()) {
                courses[index++] = new Course(
                    rs.getInt("course_id"),
                    rs.getString("course_name"),
                    rs.getString("description"),
                    rs.getInt("seats")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return courses;
}
public Course[] getAllCoursesArray() {
    Course[] courses = new Course[0];
    

    try {
        String sql = "SELECT course_id, course_name, description, seats FROM courses";
        pstmt = con.prepareStatement(sql, 
                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                ResultSet.CONCUR_READ_ONLY);
        res = pstmt.executeQuery();

        // 3. Count rows to create array
        res.last();
        int rowCount = res.getRow();
        res.beforeFirst();

        courses = new Course[rowCount];
        int index = 0;

        // 4. Fill array
        while (res.next()) {
            courses[index++] = new Course(
                res.getInt("course_id"),
                res.getString("course_name"),
                res.getString("description"),
                res.getInt("seats")
            );
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (res != null) res.close(); } catch (Exception e) {}
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }

    return courses;
}
}

