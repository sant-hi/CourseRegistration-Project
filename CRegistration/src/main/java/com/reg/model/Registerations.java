package com.reg.model;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="registrations")
public class Registerations {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int reg_id;

    private int student_id;

    @ManyToOne
    @JoinColumn(name="course_id")
    private Course course;
    
    private LocalDateTime registration_date;

	public int getReg_id() {
		return reg_id;
	}

	public void setReg_id(int reg_id) {
		this.reg_id = reg_id;
	}

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public LocalDateTime getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date( LocalDateTime registration_date) {
		this.registration_date = registration_date;
	}
   

    
}
