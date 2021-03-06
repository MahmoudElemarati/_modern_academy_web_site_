package com.modern.www._1_2_MySql_DB_entities;
// Generated Feb 20, 2021 9:15:52 AM by Hibernate Tools 4.3.1


import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * A0997TeachersTeachCourses generated by hbm2java
 */
@Entity
@Table(name="a_0_9_9_7_teachers_teach_courses"
    ,catalog="modern_web_site"
)
public class A0997TeachersTeachCourses  implements java.io.Serializable {


     private A0997TeachersTeachCoursesId id;
     private A0054Courses a0054Courses;
     private A0999Teachers a0999Teachers;
     private Date transDate;

    public A0997TeachersTeachCourses() {
    }

    public A0997TeachersTeachCourses(A0997TeachersTeachCoursesId id, A0054Courses a0054Courses, A0999Teachers a0999Teachers, Date transDate) {
       this.id = id;
       this.a0054Courses = a0054Courses;
       this.a0999Teachers = a0999Teachers;
       this.transDate = transDate;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="courseId", column=@Column(name="course_id", nullable=false) ), 
        @AttributeOverride(name="courseCode", column=@Column(name="course_code", nullable=false, length=10) ), 
        @AttributeOverride(name="listId", column=@Column(name="list_id", nullable=false) ), 
        @AttributeOverride(name="teacherId", column=@Column(name="teacher_id", nullable=false) ) } )
    public A0997TeachersTeachCoursesId getId() {
        return this.id;
    }
    
    public void setId(A0997TeachersTeachCoursesId id) {
        this.id = id;
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
    @JoinColumn(name="teacher_id", nullable=false, insertable=false, updatable=false)
    public A0999Teachers getA0999Teachers() {
        return this.a0999Teachers;
    }
    
    public void setA0999Teachers(A0999Teachers a0999Teachers) {
        this.a0999Teachers = a0999Teachers;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="trans_date", nullable=false, length=19)
    public Date getTransDate() {
        return this.transDate;
    }
    
    public void setTransDate(Date transDate) {
        this.transDate = transDate;
    }




}


