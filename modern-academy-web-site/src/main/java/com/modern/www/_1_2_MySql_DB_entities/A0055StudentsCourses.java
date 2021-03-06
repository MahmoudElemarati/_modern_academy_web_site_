package com.modern.www._1_2_MySql_DB_entities;
// Generated Feb 20, 2021 9:15:52 AM by Hibernate Tools 4.3.1


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * A0055StudentsCourses generated by hbm2java
 */
@Entity
@Table(name="a_0_0_5_5_students_courses"
    ,catalog="modern_web_site"
)
public class A0055StudentsCourses  implements java.io.Serializable {


     private A0055StudentsCoursesId id;
     private A0052Students a0052Students;
     private A0054Courses a0054Courses;
     private A0057Semester a0057Semester;
     private Integer midTerm;
     private Integer yearWork;
     private Integer lab;
     private Integer final_;
     private Integer total;

    public A0055StudentsCourses() {
    }

	
    public A0055StudentsCourses(A0055StudentsCoursesId id, A0052Students a0052Students, A0054Courses a0054Courses, A0057Semester a0057Semester) {
        this.id = id;
        this.a0052Students = a0052Students;
        this.a0054Courses = a0054Courses;
        this.a0057Semester = a0057Semester;
    }
    public A0055StudentsCourses(A0055StudentsCoursesId id, A0052Students a0052Students, A0054Courses a0054Courses, A0057Semester a0057Semester, Integer midTerm, Integer yearWork, Integer lab, Integer final_, Integer total) {
       this.id = id;
       this.a0052Students = a0052Students;
       this.a0054Courses = a0054Courses;
       this.a0057Semester = a0057Semester;
       this.midTerm = midTerm;
       this.yearWork = yearWork;
       this.lab = lab;
       this.final_ = final_;
       this.total = total;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="courseId", column=@Column(name="course_id", nullable=false) ), 
        @AttributeOverride(name="courseCode", column=@Column(name="course_code", nullable=false, length=10) ), 
        @AttributeOverride(name="listId", column=@Column(name="list_id", nullable=false) ), 
        @AttributeOverride(name="stdId", column=@Column(name="std_id", nullable=false) ), 
        @AttributeOverride(name="yearId", column=@Column(name="year_id", nullable=false) ), 
        @AttributeOverride(name="semesterId", column=@Column(name="semester_id", nullable=false) ) } )
    public A0055StudentsCoursesId getId() {
        return this.id;
    }
    
    public void setId(A0055StudentsCoursesId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="std_id", nullable=false, insertable=false, updatable=false)
    public A0052Students getA0052Students() {
        return this.a0052Students;
    }
    
    public void setA0052Students(A0052Students a0052Students) {
        this.a0052Students = a0052Students;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumns( { 
        @JoinColumn(name="course_id", referencedColumnName="course_id", nullable=false, insertable=false, updatable=false), 
        @JoinColumn(name="course_code", referencedColumnName="course_code", nullable=false, insertable=false, updatable=false), 
        @JoinColumn(name="list_id", referencedColumnName="list_id", nullable=false, insertable=false, updatable=false) } )
    public A0054Courses getA0054Courses() {
        return this.a0054Courses;
    }
    
    public void setA0054Courses(A0054Courses a0054Courses) {
        this.a0054Courses = a0054Courses;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="semester_id", nullable=false, insertable=false, updatable=false)
    public A0057Semester getA0057Semester() {
        return this.a0057Semester;
    }
    
    public void setA0057Semester(A0057Semester a0057Semester) {
        this.a0057Semester = a0057Semester;
    }

    
    @Column(name="mid_term")
    public Integer getMidTerm() {
        return this.midTerm;
    }
    
    public void setMidTerm(Integer midTerm) {
        this.midTerm = midTerm;
    }

    
    @Column(name="year_work")
    public Integer getYearWork() {
        return this.yearWork;
    }
    
    public void setYearWork(Integer yearWork) {
        this.yearWork = yearWork;
    }

    
    @Column(name="lab")
    public Integer getLab() {
        return this.lab;
    }
    
    public void setLab(Integer lab) {
        this.lab = lab;
    }

    
    @Column(name="final")
    public Integer getFinal_() {
        return this.final_;
    }
    
    public void setFinal_(Integer final_) {
        this.final_ = final_;
    }

    
    @Column(name="total")
    public Integer getTotal() {
        return this.total;
    }
    
    public void setTotal(Integer total) {
        this.total = total;
    }




}


