package com.reg.model;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.reg.util.HibernateUtil;

import javax.persistence.Transient;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "students")
public class Model {

    @Id
    private int student_id;
    private String name;
    private String email;
    private String password;
    private long phone;
    @Transient
    private int course_id;
    
   

    public int getCourse_id() { return course_id; }
    public void setCourse_id(int course_id) { this.course_id = course_id; }
   
    // Getters and Setters
    public int getStudent_id() { return student_id; }
    public void setStudent_id(int student_id) { this.student_id = student_id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public long getPhone() { return phone; }
    public void setPhone(long phone) { this.phone = phone; }

    // Register Student
    public boolean registerStudent() {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(this);
            tx.commit();
            return true;
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if(session != null) session.close();
        }
    }

    // Login Student
    public boolean loginStudent() {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            List<Model> students = session.createCriteria(Model.class)
                    .add(org.hibernate.criterion.Restrictions.eq("email", email))
                    .add(org.hibernate.criterion.Restrictions.eq("password", password))
                    .list();
            if(!students.isEmpty()) {
                Model s = students.get(0);
                this.student_id = s.getStudent_id();
                this.name = s.getName();
                return true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(session != null) session.close();
        }
        return false;
    }

    // Get All Courses
    public Course[] getAllCoursesArray() {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            List<Course> courses = session.createCriteria(Course.class).list();
            return courses.toArray(new Course[0]);
        } finally {
            if(session != null) session.close();
        }
    }

    // Get Student Courses
    public Course[] getStudentCoursesArray() {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            List<Registerations> regs = session.createCriteria(Registerations.class)
                    .add(org.hibernate.criterion.Restrictions.eq("student_id", student_id))
                    .list();
            return regs.stream().map(Registerations::getCourse).toArray(Course[]::new);
        } finally {
            if(session != null) session.close();
        }
    }

    // Register student to course
    public boolean registerStudentToCourse() {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            // Load course and check seats
            Course course = (Course) session.get(Course.class, course_id);
            if(course == null || course.getSeats() <= 0) return false;

            // Check if already registered
            List<Registerations> existing = session.createCriteria(Registerations.class)
                    .add(org.hibernate.criterion.Restrictions.eq("student_id", student_id))
                    .add(org.hibernate.criterion.Restrictions.eq("course", course))
                    .list();
            if(!existing.isEmpty()) return false;

            // Persist registration
            Registerations reg = new Registerations();
            reg.setStudent_id(student_id);
            reg.setCourse(course);
            session.save(reg);

            // Update seat count
            course.setSeats(course.getSeats() - 1);
            session.update(course);

            tx.commit();
            return true;
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if(session != null) session.close();
        }
    }
}
