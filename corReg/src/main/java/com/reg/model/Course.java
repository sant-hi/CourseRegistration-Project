package com.reg.model;

public class Course {
    private int course_id;
    private String course_name;
    private String description;
    private int seats;

    // Constructor matching the parameters
    public Course(int course_id, String course_name, String description, int seats) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.seats = seats;
    }

    // Getters and setters
    public int getCourseId() { return course_id; }
    public void setCourseId(int courseId) { this.course_id = course_id; }

    public String getCourseName() { return course_name; }
    public void setCourseName(String courseName) { this.course_name = course_name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getSeats() { return seats; }
    public void setSeats(int seats) { this.seats = seats; }
}
