package com.modern.www._1_2_MySql_DB_entities;
// Generated Mar 29, 2021 8:57:57 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * A0053Course generated by hbm2java
 */
@Entity
@Table(name="a_0_0_5_3_course"
    ,catalog="modern_web_site"
)
public class A0053Course  implements java.io.Serializable {


     private int courseId;
     private A0996Departments a0996Departments;
     private String courseNameA;
     private String courseNameE;
     private String coursePanaerPhoto;
     private Set<A0054Courses> a0054Courseses = new HashSet<A0054Courses>(0);

    public A0053Course() {
    }

	
    public A0053Course(int courseId, A0996Departments a0996Departments, String courseNameA, String courseNameE) {
        this.courseId = courseId;
        this.a0996Departments = a0996Departments;
        this.courseNameA = courseNameA;
        this.courseNameE = courseNameE;
    }
    public A0053Course(int courseId, A0996Departments a0996Departments, String courseNameA, String courseNameE, String coursePanaerPhoto, Set<A0054Courses> a0054Courseses) {
       this.courseId = courseId;
       this.a0996Departments = a0996Departments;
       this.courseNameA = courseNameA;
       this.courseNameE = courseNameE;
       this.coursePanaerPhoto = coursePanaerPhoto;
       this.a0054Courseses = a0054Courseses;
    }
   
     @Id 

    
    @Column(name="course_id", unique=true, nullable=false)
    public int getCourseId() {
        return this.courseId;
    }
    
    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="department_id", nullable=false)
    public A0996Departments getA0996Departments() {
        return this.a0996Departments;
    }
    
    public void setA0996Departments(A0996Departments a0996Departments) {
        this.a0996Departments = a0996Departments;
    }

    
    @Column(name="course_name_a", nullable=false, length=100)
    public String getCourseNameA() {
        return this.courseNameA;
    }
    
    public void setCourseNameA(String courseNameA) {
        this.courseNameA = courseNameA;
    }

    
    @Column(name="course_name_e", nullable=false, length=100)
    public String getCourseNameE() {
        return this.courseNameE;
    }
    
    public void setCourseNameE(String courseNameE) {
        this.courseNameE = courseNameE;
    }

    
    @Column(name="course_panaer_photo")
    public String getCoursePanaerPhoto() {
        return this.coursePanaerPhoto;
    }
    
    public void setCoursePanaerPhoto(String coursePanaerPhoto) {
        this.coursePanaerPhoto = coursePanaerPhoto;
    }

@OneToMany(fetch=FetchType.EAGER, mappedBy="a0053Course")
    public Set<A0054Courses> getA0054Courseses() {
        return this.a0054Courseses;
    }
    
    public void setA0054Courseses(Set<A0054Courses> a0054Courseses) {
        this.a0054Courseses = a0054Courseses;
    }




}


